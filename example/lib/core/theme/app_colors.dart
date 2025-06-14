import 'dart:ui';
import 'package:flutter_addons/flutter_addons.dart';

class AppDarkColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => Kolors.neutral900;

  @override
  Color get cardBackground => Kolors.neutral800;

  @override
  Color get dividerColor => Kolors.neutral700;

  @override
  Color get forground => Kolors.neutral100;

  @override
  Color get inputBackground => Kolors.neutral700;

  @override
  Color get outlineColor => Kolors.neutral600;

  @override
  Color get primaryColor => Kolors.cyan700;

  @override
  Color get secondaryButton => Kolors.neutral600;

  @override
  Color get secondaryContent => Kolors.neutral400;

  @override
  Color get shadowColor => Kolors.neutral900.withValues(alpha: .5);
}

class AppLightColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => Kolors.neutral100; // Light background

  @override
  Color get cardBackground => Kolors.neutral200; // Slightly darker for cards

  @override
  Color get dividerColor => Kolors.neutral300;

  @override
  Color get forground => Kolors.neutral900; // Dark text for light background

  @override
  Color get inputBackground => Kolors.neutral100; // Input fields match background

  @override
  Color get outlineColor => Kolors.neutral400;

  @override
  Color get primaryColor => Kolors.cyan600;

  @override
  Color get secondaryButton => Kolors.neutral400;

  @override
  Color get secondaryContent => Kolors.neutral600;

  @override
  Color get shadowColor => Kolors.neutral900.withValues(alpha: 0.08); // Subtle shadow
}
