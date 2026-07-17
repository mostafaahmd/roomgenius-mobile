class GeneralApiResponse<T> {
  factory GeneralApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return GeneralApiResponse<T>(
      success: json['success'] as bool,
      code: json['code'] as int?,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  GeneralApiResponse({
    required this.success,
    this.code,
    this.message,
    this.data,
  });
  bool success;
  int? code;
  String? message;
  T? data;

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return {
      'success': success,
      'code': code,
      'message': message,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }
}
