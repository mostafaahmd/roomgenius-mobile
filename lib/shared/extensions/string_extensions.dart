// lib/core/extensions/string_extensions.dart

extension StringExtensions on String {
  // ✅ Capitalization
  String capitalize() {
    if (isEmpty) return this;
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }

  String capitalizeWords() {
    if (isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  // ✅ Validation
  bool get isEmail {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(this);
  }

  bool get isPhone {
    // Egyptian phone format
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(this);
  }

  bool get isNumeric {
    return double.tryParse(this) != null;
  }

  // ✅ Trimming
  String get trimAll => replaceAll(RegExp(r'\s+'), '');
  
  String trimExtraSpaces() {
    return trim().replaceAll(RegExp(r'\s+'), ' ');
  }

  // ✅ Truncate with ellipsis
  String truncate(int maxLength, {String ellipsis = '...'}) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}$ellipsis';
  }

  // ✅ Parse safely
  int? toIntOrNull() => int.tryParse(this);
  int toIntOrZero() => int.tryParse(this) ?? 0;
  
  double? toDoubleOrNull() => double.tryParse(this);
  double toDoubleOrZero() => double.tryParse(this) ?? 0.0;

  // ✅ Mask sensitive data
  String maskEmail() {
    if (!isEmail) return this;
    final parts = split('@');
    final username = parts[0];
    final domain = parts[1];
    
    if (username.length <= 2) return this;
    
    final masked = username[0] + 
                   '*' * (username.length - 2) + 
                   username[username.length - 1];
    return '$masked@$domain';
  }

  String maskPhone() {
    if (length < 4) return this;
    return '*' * (length - 4) + substring(length - 4);
  }

  // ✅ Extract numbers
  String extractNumbers() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  // ✅ Check if contains only Arabic
  bool get isArabic {
    final arabicRegex = RegExp(r'^[\u0600-\u06FF\s]+$');
    return arabicRegex.hasMatch(this);
  }

  // ✅ Check if contains only English
  bool get isEnglish {
    final englishRegex = RegExp(r'^[a-zA-Z\s]+$');
    return englishRegex.hasMatch(this);
  }
}

extension NullableStringExtension on String? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
  bool get isNotNullOrEmpty => !isNullOrEmpty();
}
