class ApiErrorModel {

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) {
    return ApiErrorModel(
      success: json['success'] is bool
          ? json['success'] as bool
          : (json['success'] == 1 || json['success'] == 'true'),
      message: json['message'] as String?,
      code: json['code'] as int?,
      errors: (json['errors'] as List<dynamic>?)
              ?.map((e) => ApiErrorField.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );
  }

  ApiErrorModel({
    required this.success,
    this.message,
    this.code,
    this.errors = const [],
  });
  final bool success;
  final String? message;
  final int? code;
  final List<ApiErrorField> errors;

  /// Combines all error messages into one string (newline separated)
  String getAllErrorMessages() {
    if (errors.isNotEmpty) {
      return errors.map((e) => e.message).join('\n');
    } else if (message != null && message!.isNotEmpty) {
      return message!;
    } else {
      return "حدث خطأ غير متوقع."; // Arabic fallback: "An unexpected error occurred."
    }
  }
}

class ApiErrorField {

  factory ApiErrorField.fromJson(Map<String, dynamic> json) {
    return ApiErrorField(
      field: json['field'] is String ? json['field'] as String : json['field']?.toString() ?? '',
      message: json['message'] is String ? json['message'] as String : json['message']?.toString() ?? '',
    );
  }

  ApiErrorField({
    required this.field,
    required this.message,
  });
  final String field;
  final String message;
}
