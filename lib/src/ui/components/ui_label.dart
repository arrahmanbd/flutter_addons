part of 'package:flutter_addons/flutter_addons.dart';

enum UiLabelTextType {
  displayLarge,
  displayMedium,
  displaySmall,
  headlineLarge,
  headlineMedium,
  headlineSmall,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall,
  labelLarge,
  labelMedium,
  labelSmall,
}

// Minimal MyTextStyle without GoogleFonts, simple static styles for demo
class UiLabelTextStyle {
  static final Map<UiLabelTextType, double> _defaultTextSize = {
    UiLabelTextType.displayLarge: 57,
    UiLabelTextType.displayMedium: 45,
    UiLabelTextType.displaySmall: 36,
    UiLabelTextType.headlineLarge: 32,
    UiLabelTextType.headlineMedium: 28,
    UiLabelTextType.headlineSmall: 26,
    UiLabelTextType.titleLarge: 22,
    UiLabelTextType.titleMedium: 16,
    UiLabelTextType.titleSmall: 14,
    UiLabelTextType.labelLarge: 14,
    UiLabelTextType.labelMedium: 12,
    UiLabelTextType.labelSmall: 11,
    UiLabelTextType.bodyLarge: 16,
    UiLabelTextType.bodyMedium: 14,
    UiLabelTextType.bodySmall: 12,
  };

  static final Map<UiLabelTextType, FontWeight> _defaultFontWeight = {
    UiLabelTextType.displayLarge: FontWeight.w400,
    UiLabelTextType.displayMedium: FontWeight.w400,
    UiLabelTextType.displaySmall: FontWeight.w400,
    UiLabelTextType.headlineLarge: FontWeight.w400,
    UiLabelTextType.headlineMedium: FontWeight.w400,
    UiLabelTextType.headlineSmall: FontWeight.w400,
    UiLabelTextType.titleLarge: FontWeight.w500,
    UiLabelTextType.titleMedium: FontWeight.w500,
    UiLabelTextType.titleSmall: FontWeight.w500,
    UiLabelTextType.labelLarge: FontWeight.w600,
    UiLabelTextType.labelMedium: FontWeight.w600,
    UiLabelTextType.labelSmall: FontWeight.w600,
    UiLabelTextType.bodyLarge: FontWeight.w400,
    UiLabelTextType.bodyMedium: FontWeight.w400,
    UiLabelTextType.bodySmall: FontWeight.w400,
  };

  static final Map<UiLabelTextType, double> _defaultLetterSpacing = {
    UiLabelTextType.displayLarge: -0.25,
    UiLabelTextType.displayMedium: 0,
    UiLabelTextType.displaySmall: 0,
    UiLabelTextType.headlineLarge: -0.2,
    UiLabelTextType.headlineMedium: -0.15,
    UiLabelTextType.headlineSmall: 0,
    UiLabelTextType.titleLarge: 0,
    UiLabelTextType.titleMedium: 0.1,
    UiLabelTextType.titleSmall: 0.1,
    UiLabelTextType.labelLarge: 0.1,
    UiLabelTextType.labelMedium: 0.5,
    UiLabelTextType.labelSmall: 0.5,
    UiLabelTextType.bodyLarge: 0.5,
    UiLabelTextType.bodyMedium: 0.25,
    UiLabelTextType.bodySmall: 0.4,
  };

  static TextStyle getStyle(
    UiLabelTextType type, {
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    double? letterSpacing,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return TextStyle(
      fontSize: fontSize ?? _defaultTextSize[type],
      fontWeight: fontWeight ?? _defaultFontWeight[type],
      letterSpacing: letterSpacing ?? _defaultLetterSpacing[type],
      decoration: decoration,
      color: color ?? Colors.black,
      height: 1.2,
      fontFamily: 'Roboto', // system fallback font
    );
  }
}

/// Simple UiLabel widget that uses MyTextStyle
class UiLabel extends StatelessWidget {
  final String text;
  final UiLabelTextType textType;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextDecoration decoration;

  const UiLabel(
    this.text, {
    super.key,
    this.textType = UiLabelTextType.bodyMedium,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.fontSize,
    this.fontWeight,
    this.letterSpacing,
    this.decoration = TextDecoration.none,
  });

  @override
  Widget build(BuildContext context) {
    final style = UiLabelTextStyle.getStyle(
      textType,
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );

    return Text(
      text,
      style: style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
