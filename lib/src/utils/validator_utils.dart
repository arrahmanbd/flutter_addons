part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class that provides common form field validators.
/// All validators return `null` if the input is valid, otherwise return a string error message.
class Validator {
  /// Validates that the field is not empty.
  static String? required(String? value, {String fieldName = 'This field'}) {
    if (value == null || value.trim().isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  /// Validates if the input is a valid email address.
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    return emailRegex.hasMatch(value) ? null : 'Invalid email address';
  }

  /// Validates a strong password with optional rules.
  static String? password(
    String? value, {
    int minLength = 6,
    bool requireSpecialChar = false,
    bool requireUppercase = false,
  }) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < minLength) {
      return 'Password must be at least $minLength characters';
    }

    if (requireUppercase && !RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain an uppercase letter';
    }

    if (requireSpecialChar && !RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain a special character';
    }

    return null;
  }

  /// Validates that the input is a valid phone number.
  static String? phone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required';
    }
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    return phoneRegex.hasMatch(value) ? null : 'Invalid phone number';
  }

  /// Validates that the input is a number.
  static String? number(String? value) {
    if (value == null || value.trim().isEmpty) return 'This field is required';
    return double.tryParse(value) == null ? 'Invalid number' : null;
  }

  /// Validates that two fields are equal (e.g., password and confirm password).
  static String? match(
    String? value,
    String? otherValue, {
    String fieldName = 'Fields',
  }) {
    if (value != otherValue) return '$fieldName do not match';
    return null;
  }

  /// Validates that the input meets a minimum length.
  static String? minLength(
    String? value,
    int length, {
    String fieldName = 'This field',
  }) {
    if (value == null || value.length < length) {
      return '$fieldName must be at least $length characters';
    }
    return null;
  }

  /// Validates that the input does not exceed a maximum length.
  static String? maxLength(
    String? value,
    int length, {
    String fieldName = 'This field',
  }) {
    if (value != null && value.length > length) {
      return '$fieldName must be at most $length characters';
    }
    return null;
  }

  /// Validates that the input is a valid URL.
  static String? url(String? value) {
    if (value == null || value.isEmpty) return 'URL is required';
    final urlRegex = RegExp(r'^(https?:\/\/)?[\w\-]+(\.[\w\-]+)+[/#?]?.*$');
    return urlRegex.hasMatch(value) ? null : 'Invalid URL';
  }
}
