// lib/core/utils/validators.dart
// ✅ Form validation utilities - Pure functions

class Validators {
  // ✅ Email validation
  static String? email(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }

    return null;
  }

  // ✅ Name validation
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    if (value.length < 3) {
      return 'Name must be at least 3 characters';
    }

    // Allow letters, spaces, hyphens, apostrophes (basic name validation)
    // Adjust regex if Arabic/other characters are needed (using Unicode property escapes if possible, or broad match)
    // For now simple length and presence is usually enough, regex can be strict.
    // Let's stick to simple length for broad compatibility unless strict requested.
    return null;
  }

  // ✅ Password validation
  static String? password(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    return null;
  }

  // ✅ Strong password validation
  static String? strongPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }

    // At least one uppercase letter
    if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    }

    // At least one lowercase letter
    if (!RegExp(r'[a-z]').hasMatch(value)) {
      return 'Password must contain at least one lowercase letter';
    }

    // At least one digit
    if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    }

    // At least one special character
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }

    return null;
  }

  // ✅ Phone validation (Egyptian format)
  static String? phone(String? value) {
    if (value == null || value.isEmpty) {
      return null;
    }

    // Egyptian phone: optional +20 or 0, followed by 10/11/12/15, then 8 digits
    // Matches: 010..., +2010..., 2010...
    final phoneRegex = RegExp(r'^(\+20|20|0)?1[0125][0-9]{8}$');

    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid Egyptian phone number';
    }

    return null;
  }

  // ✅ Required field validation
  static String? required(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }
    return null;
  }

  // ✅ Minimum length validation
  static String? minLength(String? value, int minLength, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }

    if (value.length < minLength) {
      return '${fieldName ?? 'This field'} must be at least $minLength characters';
    }

    return null;
  }

  // ✅ Maximum length validation
  static String? maxLength(String? value, int maxLength, {String? fieldName}) {
    if (value != null && value.length > maxLength) {
      return '${fieldName ?? 'This field'} must not exceed $maxLength characters';
    }

    return null;
  }

  // ✅ Confirm password validation
  static String? confirmPassword(String? value, String? originalPassword) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }

    if (value != originalPassword) {
      return 'Passwords do not match';
    }

    return null;
  }

  // ✅ Numeric validation
  static String? numeric(String? value, {String? fieldName}) {
    if (value == null || value.isEmpty) {
      return '${fieldName ?? 'This field'} is required';
    }

    if (double.tryParse(value) == null) {
      return '${fieldName ?? 'This field'} must be a number';
    }

    return null;
  }

  // ✅ Image file validation
  static String? imageFile(String? filePath, int? fileSizeInBytes) {
    if (filePath == null || filePath.isEmpty) {
      return null; // Optional field
    }

    // Check file extension
    final validExtensions = ['jpg', 'jpeg', 'png'];
    final extension = filePath.split('.').last.toLowerCase();

    if (!validExtensions.contains(extension)) {
      return 'Image must be JPG, JPEG, or PNG format';
    }

    // Check file size (max 2MB = 2097152 bytes)
    if (fileSizeInBytes != null && fileSizeInBytes > 2097152) {
      final sizeInMB = (fileSizeInBytes / 1048576).toStringAsFixed(2);
      return 'Image size ($sizeInMB MB) exceeds maximum of 2 MB';
    }

    return null;
  }

  // ✅ Video file validation
  static String? videoFile(String? filePath, int? fileSizeInBytes) {
    if (filePath == null || filePath.isEmpty) {
      return null; // Optional field
    }

    // Check file extension
    final validExtensions = ['mp4', 'mov', 'avi', 'mkv', 'webm'];
    final extension = filePath.split('.').last.toLowerCase();

    if (!validExtensions.contains(extension)) {
      return 'Video must be MP4, MOV, AVI, MKV, or WEBM format';
    }

    // Check file size (max 10MB = 10485760 bytes)
    if (fileSizeInBytes != null && fileSizeInBytes > 10485760) {
      final sizeInMB = (fileSizeInBytes / 1048576).toStringAsFixed(2);
      return 'Video size ($sizeInMB MB) exceeds maximum of 10 MB';
    }

    return null;
  }

  // ✅ Helper: Format file size for display
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1048576) return '${(bytes / 1024).toStringAsFixed(2)} KB';
    return '${(bytes / 1048576).toStringAsFixed(2)} MB';
  }
}

// Usage in forms:
/*
TextFormField(
  validator: Validators.email,
  decoration: InputDecoration(labelText: 'Email'),
),

TextFormField(
  validator: Validators.strongPassword,
  decoration: InputDecoration(labelText: 'Password'),
),

TextFormField(
  validator: (value) => Validators.confirmPassword(value, passwordController.text),
  decoration: InputDecoration(labelText: 'Confirm Password'),
),
*/
