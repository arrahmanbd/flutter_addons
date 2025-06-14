part of 'package:flutter_addons/flutter_addons.dart';

/// Abstract class defining typography styles (Users only extend this)
/// Abstract class defining typography styles for Soul
abstract class AppTypo {
  /// Font family for all text styles.
  String get fontFamily;

  /// General body text, used for main content text
  TextStyle get bodyLarge;

  /// Medium-sized body text, often used for subtitles or secondary text
  TextStyle get bodyMedium;

  /// Smallest body text, useful for captions or footnotes
  TextStyle get bodySmall;

  /// Large display text, typically used for prominent headers
  TextStyle get displayLarge;

  /// Medium display text, used for secondary headers
  TextStyle get displayMedium;

  /// Large label text, used for buttons, navbar titles, or emphasized labels
  TextStyle get labelLarge;

  /// Medium label text, used for form field labels, section headers, or hints
  TextStyle get labelMedium;

  /// Small label text, used for less prominent labels or small buttons
  TextStyle get labelSmall;

  /// Large title text, ideal for card titles or modal headers
  TextStyle get titleLarge;

  /// Medium title text, used for app bar titles or section titles
  TextStyle get titleMedium;

  /// Small title text, used for small cards, subtitles, or tab labels
  TextStyle get titleSmall;

  /// Converts the custom typography into a `TextTheme`
  TextTheme toTextTheme(ColorScheme colorScheme) => TextTheme(
    bodyLarge: bodyLarge.copyWith(
      color: colorScheme.onSurface,
      fontFamily: fontFamily,
    ),
    bodyMedium: bodyMedium.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.8),
      fontFamily: fontFamily,
    ),
    bodySmall: bodySmall.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.6),
      fontFamily: fontFamily,
    ),
    displayLarge: displayLarge.copyWith(
      color: colorScheme.onSurface,
      fontFamily: fontFamily,
    ),
    displayMedium: displayMedium.copyWith(
      color: colorScheme.onSurface,
      fontFamily: fontFamily,
    ),
    labelLarge: labelLarge.copyWith(
      color: colorScheme.onPrimary,
      fontFamily: fontFamily,
    ),
    labelMedium: labelMedium.copyWith(
      color: colorScheme.onPrimary.withValues(alpha: 0.8),
      fontFamily: fontFamily,
    ),
    labelSmall: labelSmall.copyWith(
      color: colorScheme.onPrimary.withValues(alpha: 0.8),
      fontFamily: fontFamily,
    ),
    titleLarge: titleLarge.copyWith(
      color: colorScheme.primary,
      fontFamily: fontFamily,
    ),
    titleMedium: titleMedium.copyWith(
      color: colorScheme.onSurface,
      fontFamily: fontFamily,
    ),
    titleSmall: titleSmall.copyWith(
      color: colorScheme.onSurface.withValues(alpha: 0.8),
      fontFamily: fontFamily,
    ),
  );
}
