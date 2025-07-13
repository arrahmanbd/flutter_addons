part of 'package:flutter_addons/flutter_addons.dart';

/// String Extensions
extension StringExt on String {
  /// Get First Letter
  String get firstLetter {
    if (isEmpty) {
      return ''; // Return an empty string if the input string is empty
    }
    return this[0].toUpperCase(); // Return the first character in uppercase
  }

  /// Capitalizes each word in the string.
  /// Example: `"hello world"` → `"Hello World"`
  String toTitleCase() => split(' ').map((e) => e.capitalizeFirst()).join(' ');

  /// Capitalizes only the first letter of the string.
  /// Example: `"hello world"` → `"Hello world"`
  String capitalizeFirst() {
    if (isEmpty) return '';
    return this[0].toUpperCase() + substring(1);
  }

  /// Reverses the string.
  /// Example: `"hello"` → `"olleh"`
  String reverse() => split('').reversed.join();

  /// Returns true if the string contains only numeric characters.
  bool isNumeric() => RegExp(r'^\d+$').hasMatch(this);

  /// Checks if the string is a valid email.
  bool isEmail() {
    return Patterns.email.hasMatch(this);
  }

  /// Checks if the string is a valid phone number.
  /// (Supports international formats)
  bool isPhoneNumber() {
    return Patterns.phone.hasMatch(this);
  }

  /// Masks part of a string (e.g., credit card or password).
  /// Example: `"12345678".mask(4)` → `"****5678"`
  String mask(int visibleLength, {String maskChar = '*'}) {
    if (length <= visibleLength) return this;
    return maskChar * (length - visibleLength) +
        substring(length - visibleLength);
  }

  /// Removes all whitespace from the string.
  String removeAllWhitespace() => replaceAll(RegExp(r'\s+'), '');

  /// Checks whether the string contains a match for the given pattern.
  bool hasMatch(String pattern) => RegExp(pattern).hasMatch(this);

  /// Converts the string to a boolean.
  bool toBool({bool caseSensitive = true}) {
    final val = caseSensitive ? this : toLowerCase();
    if (val == 'true') return true;
    if (val == 'false') return false;
    throw FormatException('Invalid boolean string: $this');
  }

  /// Checks if the string is a valid boolean representation.
  bool isBool({bool caseSensitive = true}) {
    final val = caseSensitive ? this : toLowerCase();
    return val == 'true' || val == 'false';
  }

  /// Converts the string to a number.
  num toNum() => num.parse(this);

  /// Checks if the string is a valid number.
  bool isNum() => num.tryParse(this) != null;

  /// Converts the string to an integer.
  int toInt() => int.parse(this);

  /// Checks if the string is a valid integer.
  bool isInt() => int.tryParse(this) != null;

  /// Converts the string to a double.
  double toDouble() => double.parse(this);

  /// Checks if the string is a valid double.
  bool isDouble() => double.tryParse(this) != null;
}
