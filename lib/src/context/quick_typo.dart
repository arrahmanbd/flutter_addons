part of 'package:flutter_addons/flutter_addons.dart';


/// Extension on `num` for dynamic `TextStyle` creation.
extension SortHandStyleExtension on num {
  /// Returns a base text style with the given font size.
  /// Text(
  // "Hello, World!",
  // style: 16.t.bold.italic.k(Colors.blue),
  TextStyle get t => TextStyle(fontSize: sp);

  /// Font Weights
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w200);

  /// Text Decorations
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Letter Spacing
  TextStyle get spaced => copyWith(letterSpacing: 1.2);
  TextStyle get wideSpaced => copyWith(letterSpacing: 2.0);

  /// Custom color application
  TextStyle k(Color color) => copyWith(color: color);

  /// Utility method to modify text style properties dynamically.
  TextStyle copyWith({
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? letterSpacing,
    Color? color,
  }) {
    return t.copyWith(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: letterSpacing,
      color: color,
    );
  }
}


/// Extension on `Color` to quickly create `TextStyle` with a specific color.
extension ColorTextStyle on Color {
  TextStyle s(double fontSize) => TextStyle(fontSize: fontSize, color: this);
}

/// Extension on `TextStyle` to easily apply colors.
extension DynamicTextStyle on TextStyle {
  TextStyle k(Color color) => copyWith(color: color);
}

/// Extension to simplify font weight modifications.
extension FontWeights on TextStyle {
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
}
