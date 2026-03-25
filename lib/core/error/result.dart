import 'package:roomgenius_mobile/core/error/failure.dart';

sealed class Result<T> {
  const Result();

  bool get isSuccess => this is Success<T>;
  bool get isError => this is Err<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(Failure failure) error,
  }) {
    final self = this;
    if (self is Success<T>) {
      return success(self.data);
    }
    return error((self as Err<T>).failure);
  }
}

class Success<T> extends Result<T> {
  const Success(this.data);

  final T data;
}

class Err<T> extends Result<T> {
  const Err(this.failure);

  final Failure failure;
}