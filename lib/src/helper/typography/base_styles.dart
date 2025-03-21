part of 'package:flutter_addons/flutter_addons.dart';

/// Abstract class defining typography styles (Users only extend this)
abstract class Typography {
  /// Font family for all text styles.
  String get fontFamily;

  /// **Body text** - Standard content text.
  TextStyle get bodyText;

  /// **Secondary text** - Used for subtitles or descriptions.
  TextStyle get bodySmall;

  /// **Main heading** - Large screen titles.
  TextStyle get titleText;

  /// **Section heading** - Used for sections or modal titles.
  TextStyle get displayText;

  /// **Button text** - Ensures legibility on buttons.
  TextStyle get labelText;

  /// Converts the custom typography into a `TextTheme`
  TextTheme toTextTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: bodyText.copyWith(
      color: colorScheme.onSurface,
      fontFamily: fontFamily,
    ),
    bodyMedium: bodySmall.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.8),
      fontFamily: fontFamily,
    ),
    titleLarge: titleText.copyWith(
      color: colorScheme.primary,
      fontFamily: fontFamily,
    ),
    titleMedium: displayText.copyWith(
      color: colorScheme.onSurface,
      fontFamily: fontFamily,
    ),
    labelLarge: labelText.copyWith(
      color: colorScheme.onPrimary,
      fontFamily: fontFamily,
    ),
  );
}
