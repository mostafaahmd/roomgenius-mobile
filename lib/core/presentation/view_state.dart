enum ViewStatus {
  initial,
  loading,
  success,
  failure,
}

class ViewState<T> {
  const ViewState._({
    required this.status,
    this.data,
    this.message,
  });

  const ViewState.initial() : this._(status: ViewStatus.initial);

  const ViewState.loading() : this._(status: ViewStatus.loading);

  const ViewState.success(T data)
      : this._(
          status: ViewStatus.success,
          data: data,
        );

  const ViewState.failure(String message)
      : this._(
          status: ViewStatus.failure,
          message: message,
        );

  final ViewStatus status;
  final T? data;
  final String? message;

  bool get isInitial => status == ViewStatus.initial;
  bool get isLoading => status == ViewStatus.loading;
  bool get isSuccess => status == ViewStatus.success;
  bool get isFailure => status == ViewStatus.failure;
}
