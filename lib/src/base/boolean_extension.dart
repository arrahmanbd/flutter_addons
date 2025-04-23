part of 'package:flutter_addons/flutter_addons.dart';

/// Extension for boolean (`bool`) values to provide utility methods
/// for common operations like toggling, conditionally executing actions,
/// and converting to different string representations.
extension BoolExtensions on bool {
  /// Returns the opposite of the boolean value.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// print(flag.toggled); // false
  /// ```
  bool get toggled => !this;

  /// Executes the [onTrue] function if the boolean is true, otherwise
  /// executes the [onFalse] function.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// flag.ifElse(
  ///   () => print("Flag is true"),
  ///   () => print("Flag is false")
  /// ); // Output: Flag is true
  /// ```
  T ifElse<T>(T Function() onTrue, T Function() onFalse) =>
      this ? onTrue() : onFalse();

  /// Executes the [action] only if the boolean is true.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// flag.whenTrue(() => print("Flag is true"));
  /// // Output: Flag is true
  /// ```
  void whenTrue(void Function() action) {
    if (this) action();
  }

  /// Executes the [action] only if the boolean is false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = false;
  /// flag.whenFalse(() => print("Flag is false"));
  /// // Output: Flag is false
  /// ```
  void whenFalse(void Function() action) {
    if (!this) action();
  }

  /// Converts the boolean to an integer: 1 if true, 0 if false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// print(flag.toInt()); // Output: 1
  /// ```
  int toInt() => this ? 1 : 0;

  /// Converts the boolean to a string representation: 'Yes' for true, 'No' for false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// print(flag.toYesNo()); // Output: Yes
  /// ```
  String toYesNo() => this ? 'Yes' : 'No';

  /// Converts the boolean to a string representation: 'On' for true, 'Off' for false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = false;
  /// print(flag.toOnOff()); // Output: Off
  /// ```
  String toOnOff() => this ? 'On' : 'Off';

  /// Converts the boolean to a string representation: 'Enabled' for true, 'Disabled' for false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// print(flag.toEnabledDisabled()); // Output: Enabled
  /// ```
  String toEnabledDisabled() => this ? 'Enabled' : 'Disabled';

  /// Returns 'Active' if true, 'Inactive' if false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// print(flag.toActiveInactive()); // Output: Active
  /// ```
  String toActiveInactive() => this ? 'Active' : 'Inactive';

  /// Returns 'Visible' if true, 'Hidden' if false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = false;
  /// print(flag.toVisibility()); // Output: Hidden
  /// ```
  String toVisibility() => this ? 'Visible' : 'Hidden';

  /// Returns 'Checked' if true, 'Unchecked' if false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = true;
  /// print(flag.toCheckedUnchecked()); // Output: Checked
  /// ```
  String toCheckedUnchecked() => this ? 'Checked' : 'Unchecked';

  /// Returns [trueText] if true, [falseText] if false.
  ///
  /// Example:
  /// ```dart
  /// bool flag = false;
  /// print(flag.toCustomText("It is true", "It is false")); // Output: It is false
  /// ```
  String toCustomText(String trueText, String falseText) =>
      this ? trueText : falseText;
}
