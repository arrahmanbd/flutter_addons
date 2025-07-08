part of 'package:flutter_addons/flutter_addons.dart';

class ButtonStyles {
  /// Elevated Material button style (primary CTA)
  static ButtonStyle primary({
    Color? background,
    Color? foreground,
    double radius = 12,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 14,
    ),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: background ?? Colors.blue,
      foregroundColor: foreground ?? Colors.white,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      elevation: 4,
    );
  }

  /// Outlined border button
  static ButtonStyle outline({
    Color? borderColor,
    Color? foreground,
    double radius = 12,
    double borderWidth = 1.2,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 14,
    ),
  }) {
    return OutlinedButton.styleFrom(
      foregroundColor: foreground ?? borderColor ?? Colors.blue,
      side: BorderSide(color: borderColor ?? Colors.blue, width: borderWidth),
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  /// Minimal ghost-style button (transparent)
  static ButtonStyle ghost({
    Color? foreground,
    double radius = 12,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 14,
    ),
  }) {
    return TextButton.styleFrom(
      foregroundColor: foreground ?? Colors.grey.shade800,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  /// Destructive (delete, remove) button
  static ButtonStyle danger({
    double radius = 12,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 14,
    ),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.redAccent,
      foregroundColor: Colors.white,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  /// Disabled style (for preview or manual styling)
  static ButtonStyle disabled({
    double radius = 12,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 14,
    ),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: Colors.grey.shade300,
      foregroundColor: Colors.grey.shade600,
      padding: padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }

  /// Rounded pill-style button
  static ButtonStyle pill({
    Color? background,
    Color? foreground,
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(
      horizontal: 24,
      vertical: 14,
    ),
  }) {
    return ElevatedButton.styleFrom(
      backgroundColor: background ?? Colors.indigo,
      foregroundColor: foreground ?? Colors.white,
      padding: padding,
      shape: const StadiumBorder(),
    );
  }
}
