sealed class AppException implements Exception {
  const AppException(this.message);

  final String message;

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  const NetworkException([super.message = 'Network connection error']);
}

class RequestTimeoutException extends AppException {
  const RequestTimeoutException([super.message = 'Request timed out']);
}

class UnauthorizedException extends AppException {
  const UnauthorizedException([super.message = 'Unauthorized request']);
}

class ValidationException extends AppException {
  const ValidationException(
    super.message, {
    this.fieldErrors = const <String, List<String>>{},
  });

  final Map<String, List<String>> fieldErrors;
}

class NotFoundException extends AppException {
  const NotFoundException([super.message = 'Requested resource was not found']);
}

class ServerException extends AppException {
  const ServerException([super.message = 'Server error occurred']);
}

class UnknownException extends AppException {
  const UnknownException([super.message = 'Unexpected error occurred']);
}