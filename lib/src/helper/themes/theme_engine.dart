part of 'package:flutter_addons/flutter_addons.dart';

/// Soul is a theme engine I designed to streamline and enhance theming in apps, making it easier to implement structured color palettes, typography, and component styles while supporting dynamic theming and custom extensions.
//  It follows Material Design Guidelines, ensuring a cohesive and structured approach to theming.

abstract class SoulThemeEngine {
  ThemeData get themeData;
  ColorScheme get colorScheme;
  TextTheme get textTheme;
}
