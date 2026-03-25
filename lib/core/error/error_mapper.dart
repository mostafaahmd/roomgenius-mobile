import 'package:dio/dio.dart';
import 'package:roomgenius_mobile/core/error/app_exception.dart';
import 'package:roomgenius_mobile/core/error/failure.dart';
import 'package:roomgenius_mobile/core/models/api_error_model.dart';

class ErrorMapper {
  const ErrorMapper._();

  static AppException mapToAppException(Object error) {
    if (error is AppException) {
      return error;
    }

    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final responseData = error.response?.data;
      final apiError = _tryParseApiError(responseData);

      final serverMessage = apiError?.message?.trim();
      final fallbackMessage = (serverMessage != null && serverMessage.isNotEmpty)
          ? serverMessage
          : (error.message ?? 'Unexpected error occurred');

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.receiveTimeout:
          return RequestTimeoutException(fallbackMessage);

        case DioExceptionType.connectionError:
          return NetworkException(fallbackMessage);

        case DioExceptionType.badResponse:
          if (statusCode == 401 || statusCode == 403) {
            return UnauthorizedException(fallbackMessage);
          }

          if (statusCode == 404) {
            return NotFoundException(fallbackMessage);
          }

          if (statusCode == 400 || statusCode == 422) {
            return ValidationException(
              fallbackMessage,
              fieldErrors: _collectFieldErrors(apiError),
            );
          }

          if (statusCode != null && statusCode >= 500) {
            return ServerException(fallbackMessage);
          }

          return UnknownException(fallbackMessage);

        case DioExceptionType.cancel:
          return const UnknownException('Request cancelled');

        case DioExceptionType.badCertificate:
          return const NetworkException('Invalid server certificate');

        case DioExceptionType.unknown:
          return NetworkException(fallbackMessage);
      }
    }

    return UnknownException(error.toString());
  }

  static Failure mapToFailure(Object error) {
    final exception = mapToAppException(error);

    return switch (exception) {
      NetworkException(:final message) => NetworkFailure(message),
      RequestTimeoutException(:final message) =>
        RequestTimeoutFailure(message),
      UnauthorizedException(:final message) => UnauthorizedFailure(message),
      ValidationException(:final message, :final fieldErrors) =>
        ValidationFailure(message, fieldErrors: fieldErrors),
      NotFoundException(:final message) => NotFoundFailure(message),
      ServerException(:final message) => ServerFailure(message),
      UnknownException(:final message) => UnknownFailure(message),
    };
  }

  static ApiErrorModel? _tryParseApiError(dynamic data) {
    if (data is Map<String, dynamic>) {
      try {
        return ApiErrorModel.fromJson(data);
      } catch (_) {
        return null;
      }
    }
    return null;
  }

  static Map<String, List<String>> _collectFieldErrors(ApiErrorModel? error) {
    if (error?.errors == null) {
      return const <String, List<String>>{};
    }

    final result = <String, List<String>>{};

    for (final item in error!.errors) {
      final key = item.field.trim();
      final message = item.message.trim();

      if (message.isEmpty) continue;

      result.putIfAbsent(key, () => <String>[]).add(message);
    }

    return result;
  }
}