part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on `num` for dynamic `TextStyle`
extension TextStyleExtension on num {
  TextStyle get textStyle => TextStyle(fontSize: sp);

  /// Font Weights
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.normal);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w200);

  /// Text Decorations
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);

  /// Letter Spacing
  TextStyle get spaced => copyWith(letterSpacing: 1.2);
  TextStyle get wideSpaced => copyWith(letterSpacing: 2.0);

  /// Apply color dynamically
  TextStyle kolor(Color color) => copyWith(color: color);

  /// Utility method to copy text style properties
  TextStyle copyWith({
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? letterSpacing,
    Color? color,
  }) {
    return textStyle.copyWith(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: letterSpacing,
      color: color,
    );
  }
}

/// Extension on `BuildContext` for accessing `ThemeData.textTheme`
extension ContextTextStyles on BuildContext {
  /// Get `TextTheme` from `ThemeData`
  TextTheme get _textTheme => Theme.of(this).textTheme;
  /// Use predefined text styles while allowing custom font size
  TextStyle get titleLg => _textTheme.titleLarge!;
  TextStyle get titleMd => _textTheme.titleMedium!;
  TextStyle get bodyLg => _textTheme.bodyLarge!;
  TextStyle get bodyMd => _textTheme.bodyMedium!;
  TextStyle get caption => _textTheme.bodySmall!;
  TextStyle get label => _textTheme.labelMedium!;
  TextStyle get labelLg => _textTheme.labelLarge!;
  TextStyle get labelSm => _textTheme.labelSmall!;
  TextStyle get display => _textTheme.displayMedium!;
  TextStyle get displayLg => _textTheme.displayLarge!;
}

/// Extension on `Color` for directly generating `TextStyle`
extension ColorTextStyle on Color {
  TextStyle size(double fontSize) => TextStyle(fontSize: fontSize, color: this);
}

extension DynamicTextStyle on TextStyle {
  TextStyle kolor(Color color) => copyWith(color: color);
}

///On text styles
///

/// Extension to simplify accessing text styles from the theme.
extension TextStyles on BuildContext {
  /// Provides easy access to predefined text styles.
  TextTheme get textStyles => Theme.of(this).textTheme;
}

/// A helper extension to modify the font weight of a text style.
extension FontWeights on TextStyle {
  TextStyle get thick => copyWith(fontWeight: FontWeight.w900);
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);
}

/// A helper extension to modify the font style of a text style.
extension FontStyles on TextStyle {
  TextStyle get normal => copyWith(fontStyle: FontStyle.normal);
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
}
