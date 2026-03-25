
sealed class Failure {
  const Failure(this.message);

  final String message;
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Network connection error']);
}

class RequestTimeoutFailure extends Failure {
  const RequestTimeoutFailure([super.message = 'Request timed out']);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure([super.message = 'Unauthorized request']);
}

class ValidationFailure extends Failure {
  const ValidationFailure(
    super.message, {
    this.fieldErrors = const <String, List<String>>{},
  });

  final Map<String, List<String>> fieldErrors;
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Requested resource was not found']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Server error occurred']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Unexpected error occurred']);
}