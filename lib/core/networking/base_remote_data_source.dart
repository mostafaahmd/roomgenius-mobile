import 'package:dio/dio.dart';

import '../error/app_exception.dart';

mixin BaseRemoteDataSource {
  AppException mapException(Object error, [StackTrace? stackTrace]) {
    if (error is DioException) {
      final statusCode = error.response?.statusCode;
      final message = error.message ?? 'Unexpected network error';

      if (statusCode == 401) {
        return UnauthorizedException(message);
      }

      if (statusCode == 400 || statusCode == 422) {
        return ValidationException(message);
      }

      if (statusCode != null && statusCode >= 500) {
        return ServerException(message);
      }

      return NetworkException(message);
    }

    if (error is AppException) {
      return error;
    }

    return UnknownException(error.toString());
  }
}
