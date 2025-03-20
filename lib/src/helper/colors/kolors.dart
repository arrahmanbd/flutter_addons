part of 'package:flutter_addons/flutter_addons.dart';

/// An abstract class defining a structured color system for themes.
/// This serves as the foundation for both light and dark themes, ensuring consistency
/// across the app's UI or The Soul UI.
abstract class Kolors extends Palette {
  const Kolors();

  /// Defines the brightness of the theme
  Brightness get themeMode;

  /// The primary brand color used for emphasis.
  Color get primaryColor;

  /// The default foreground color, typically used for text.
  Color get forground;

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

  /// The color used for inactive elements, such as disabled buttons and icons.
  //Color get inactiveColor;

  /// Generates a [ColorScheme] based on the defined theme colors.
  ///
  /// This scheme is useful for Material components that require a standardized
  /// color palette.
  @override
  ColorScheme get colorScheme => ColorScheme(
    brightness: themeMode,
    primary: primaryColor,
    onPrimary: themeMode == Brightness.dark ? forground : background,
    secondary: primaryColor.withValues(alpha: .35),
    onSecondary: secondaryContent,
    surface: background,
    // High contrast Text (Black/White)
    onSurface: forground,
    surfaceContainer: cardBackground,
    onSurfaceVariant: secondaryContent,
    primaryContainer: primaryColor.withValues(alpha: 0.1),
    onPrimaryContainer: primaryColor,
    secondaryContainer: cardBackground,
    onSecondaryContainer: dividerColor,
    secondaryFixed: secondaryButton,
    error: Colors.red,
    onError: Colors.white,
    outline: outlineColor,
    shadow: shadowColor,
    surfaceContainerLow: inputBackground,
    surfaceDim: dividerColor,
    inverseSurface: dividerColor,
    outlineVariant: outlineColor,
  );
}
