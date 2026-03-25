import '../error/error_mapper.dart';
import '../error/failure.dart';
import '../error/result.dart';

Future<Result<T>> safeRepositoryCall<T>(
  Future<T> Function() action,
) async {
  try {
    final result = await action();
    return Success<T>(result);
  } catch (error) {
    final Failure failure = ErrorMapper.mapToFailure(error);
    return Err<T>(failure);
  }
}
