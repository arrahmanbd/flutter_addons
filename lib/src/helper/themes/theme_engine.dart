part of 'package:flutter_addons/flutter_addons.dart';

/// I created this `ThemeEngine` to manage the application's theme settings.
/// This class allows me to switch between light and dark themes, and it provides
/// a centralized way to handle theme-related configurations. By using `ThemeEngine`,
/// I can ensure a consistent look and feel across the entire application.
abstract class ThemeEngine {
  ThemeData get themeData;
  ColorScheme get colorSchema;
  TextTheme get textStyles;
}
