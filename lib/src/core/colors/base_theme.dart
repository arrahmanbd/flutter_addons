part of 'package:flutter_addons/flutter_addons.dart';

/// Abstract class for All kolors
abstract class Palette {
  const Palette();

  /// Common getter to get a `ColorScheme` from any state
  ColorScheme get colorScheme;
}

/// An abstract class defining a structured color system for themes.
/// This serves as the foundation for both light and dark themes, ensuring consistency
/// across the app's UI or The Soul UI.
abstract class ThemeKolors extends Palette {
  const ThemeKolors();

  /// Defines the brightness of the theme.
  Brightness get themeMode;

  /// The primary brand color used for emphasis.
  Color get primaryColor;

  /// The default foreground color, typically used for text.
  Color get foreground;

  /// The background color of the app.
  Color get background;

  /// The color used for secondary buttons.
  Color get secondaryButton;

  /// The color used for secondary text, such as hints and labels.
  Color get secondaryContent;

  /// The background color for input fields.
  Color get inputBackground;

  /// The color used for surfaces such as cards, sheets, and containers.
  Color get cardBackground;

  /// The outline color, typically used for borders.
  Color get outlineColor;

  /// The color used for dividers.
  Color get dividerColor;

  /// The shadow color used to create depth.
  Color get shadowColor;

  /// Generates a [ColorScheme] based on the defined theme colors.
  @override
  ColorScheme get colorScheme => ColorScheme(
    brightness: themeMode,
    primary: primaryColor,
    onPrimary: themeMode == Brightness.dark ? foreground : background,
    secondary: primaryColor.withValues(alpha: 0.35),
    onSecondary: secondaryContent,
    surface: background,
    onSurface: foreground,
    surfaceContainerHighest: secondaryContent,
    primaryContainer: primaryColor.withValues(alpha: 0.1),
    onPrimaryContainer: primaryColor,
    secondaryContainer: cardBackground,
    onSecondaryContainer: dividerColor,
    secondaryFixed: secondaryButton,
    error: Colors.red,
    onError: Colors.white,
    outline: outlineColor,
    shadow: shadowColor,
    surfaceTint: inputBackground,
    surfaceDim: dividerColor,
    inverseSurface: dividerColor,
    outlineVariant: outlineColor,
  );
}
