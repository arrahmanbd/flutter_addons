part of 'package:flutter_addons/flutter_addons.dart';
/// A comprehensive text style extension for Flutter that provides
/// a fluent interface for building and customizing text styles.
extension TextStyleBuilder on num {
  /// Creates a base [TextStyle] with the specified font size.
  /// 
  /// Example:
  /// ```dart
  /// Text('Hello World', style: 16.text)
  /// ```
  TextStyle get text => TextStyle(fontSize: toDouble());

  /// Font weight modifiers
  TextStyle get bold => _copyWith(fontWeight: FontWeight.bold);
  TextStyle get semiBold => _copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => _copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => _copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => _copyWith(fontWeight: FontWeight.w300);
  TextStyle get extraLight => _copyWith(fontWeight: FontWeight.w200);

  /// Font style modifiers
  TextStyle get italic => _copyWith(fontStyle: FontStyle.italic);
  
  /// Text decoration modifiers
  TextStyle get underline => _copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => _copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => _copyWith(decoration: TextDecoration.overline);

  /// Letter spacing modifiers
  TextStyle get tightSpacing => _copyWith(letterSpacing: -0.5);
  TextStyle get normalSpacing => _copyWith(letterSpacing: 0.0);
  TextStyle get wideSpacing => _copyWith(letterSpacing: 1.2);
  TextStyle get extraWideSpacing => _copyWith(letterSpacing: 2.0);

  /// Line height modifiers
  TextStyle get tightHeight => _copyWith(height: 1.0);
  TextStyle get normalHeight => _copyWith(height: 1.2);
  TextStyle get relaxedHeight => _copyWith(height: 1.5);
  TextStyle get looseHeight => _copyWith(height: 2.0);

  /// Font family modifiers
  TextStyle fontFamily(String family) => _copyWith(fontFamily: family);
  
  /// Color application
  TextStyle withColor(Color color) => _copyWith(color: color);
  
  /// Background color application
  TextStyle withBackground(Color color) => _copyWith(backgroundColor: color);
  
  /// Shadow application
  TextStyle withShadow({
    Color color = const Color(0x33000000),
    double blurRadius = 2.0,
    Offset offset = Offset.zero,
  }) => _copyWith(shadows: [Shadow(color: color, blurRadius: blurRadius, offset: offset)]);

  /// Package-scoped text style builder
  TextStyle _copyWith({
    FontWeight? fontWeight,
    FontStyle? fontStyle,
    TextDecoration? decoration,
    double? letterSpacing,
    double? height,
    String? fontFamily,
    Color? color,
    Color? backgroundColor,
    List<Shadow>? shadows,
  }) {
    return text.copyWith(
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      decoration: decoration,
      letterSpacing: letterSpacing,
      height: height,
      fontFamily: fontFamily,
      color: color,
      backgroundColor: backgroundColor,
      shadows: shadows,
    );
  }
}

/// Extension on [Color] to create text styles with specific colors.
extension ColorTextStyleExtension on Color {
  /// Creates a [TextStyle] with this color and specified font size.
  /// 
  /// Example:
  /// ```dart
  /// Text('Colored text', style: Colors.blue.textStyle(16))
  /// ```
  TextStyle textStyle(double fontSize) => TextStyle(fontSize: fontSize, color: this);
}

/// Extension on [TextStyle] for additional modifications and utilities.
extension TextStyleEnhancements on TextStyle {
  /// Applies a color to the text style
  TextStyle withColor(Color color) => copyWith(color: color,decorationColor: color);
  
  /// Applies a background color to the text style
  TextStyle withBackground(Color color) => copyWith(backgroundColor: color);
  
  /// Applies a font weight
  TextStyle withWeight(FontWeight weight) => copyWith(fontWeight: weight);
  
  /// Applies a font family
  TextStyle withFamily(String family) => copyWith(fontFamily: family);
  
  /// Applies letter spacing
  TextStyle withSpacing(double spacing) => copyWith(letterSpacing: spacing);
  
  /// Applies line height
  TextStyle withHeight(double height) => copyWith(height: height);
  
  /// Applies text decoration
  TextStyle withDecoration(TextDecoration decoration) => copyWith(decoration: decoration);
  
  /// Applies multiple shadows
  TextStyle withShadows(List<Shadow> shadows) => copyWith(shadows: shadows);
  
  /// Applies a single shadow
  TextStyle withShadow({
    Color color = const Color(0x33000000),
    double blurRadius = 2.0,
    Offset offset = Offset.zero,
  }) => copyWith(shadows: [Shadow(color: color, blurRadius: blurRadius, offset: offset)]);

  /// Font weight shortcuts
  TextStyle get extraBold => copyWith(fontWeight: FontWeight.w800);
  TextStyle get bold => copyWith(fontWeight: FontWeight.w700);
  TextStyle get semiBold => copyWith(fontWeight: FontWeight.w600);
  TextStyle get medium => copyWith(fontWeight: FontWeight.w500);
  TextStyle get regular => copyWith(fontWeight: FontWeight.w400);
  TextStyle get light => copyWith(fontWeight: FontWeight.w300);
  TextStyle get extraLight => copyWith(fontWeight: FontWeight.w200);
  TextStyle get thin => copyWith(fontWeight: FontWeight.w100);

  /// Font style shortcuts
  TextStyle get italic => copyWith(fontStyle: FontStyle.italic);
  TextStyle get normalStyle => copyWith(fontStyle: FontStyle.normal);

  /// Decoration shortcuts
  TextStyle get underline => copyWith(decoration: TextDecoration.underline);
  TextStyle get lineThrough => copyWith(decoration: TextDecoration.lineThrough);
  TextStyle get overline => copyWith(decoration: TextDecoration.overline);
  TextStyle get noDecoration => copyWith(decoration: TextDecoration.none);

  /// Spacing shortcuts
  TextStyle get tight => copyWith(letterSpacing: -0.5, height: 1.0);
  TextStyle get normal => copyWith(letterSpacing: 0.0, height: 1.2);
  TextStyle get relaxed => copyWith(letterSpacing: 0.5, height: 1.5);
}

/// Usage examples:
/// 
/// ```dart
/// // Basic usage
/// Text('Title', style: 24.text.bold.withColor(Colors.blue))
/// 
/// // Chained modifiers
/// Text('Subtitle', style: 16.text.semiBold.italic.withColor(Colors.grey))
/// 
/// // Using color extension
/// Text('Warning', style: Colors.red.textStyle(14).bold)
/// 
/// // Advanced styling
/// Text('Featured', style: 18.text
///   .bold
///   .withColor(Colors.white)
///   .withBackground(Colors.black)
///   .withShadow()
///   .wideSpacing
/// )
/// ```