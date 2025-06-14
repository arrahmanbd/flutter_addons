part of 'package:flutter_addons/flutter_addons.dart';

/// Soul is a theme engine I designed to streamline and enhance theming in apps, making it easier to implement structured color palettes, typography, and component styles while supporting dynamic theming and custom extensions.
//  It follows Material Design Guidelines, ensuring a cohesive and structured approach to theming.

abstract class SoulThemeEngine {
  /// Provides the application's ColorScheme.
  ColorScheme get colorScheme;

  /// Provides the application's TextTheme.
  TextTheme get textTheme;

  /// Generates ThemeData from the theme engine.
  ThemeData get themeData;
}
