part of 'package:flutter_addons/flutter_addons.dart';

class UiShapes {
  /// Rounded rectangle with customizable corner radius.
  static RoundedRectangleBorder roundedRect({double radius = 12}) {
    return RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  /// Circular shape (perfect circle).
  static CircleBorder circle() {
    return const CircleBorder();
  }

  /// Stadium shape (pill-shaped, fully rounded on short sides).
  static StadiumBorder stadium() {
    return const StadiumBorder();
  }

  /// Beveled rectangle with customizable radius.
  static BeveledRectangleBorder beveledRect({double radius = 8}) {
    return BeveledRectangleBorder(borderRadius: BorderRadius.circular(radius));
  }

  /// Rounded rectangle border for input fields or containers.
  static OutlineInputBorder outlineInputBorder({
    double radius = 8,
    Color borderColor = Colors.grey,
    double borderWidth = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );
  }

  /// Underline border for input fields.
  static UnderlineInputBorder underlineInputBorder({
    Color borderColor = Colors.grey,
    double borderWidth = 1,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(color: borderColor, width: borderWidth),
    );
  }
}
