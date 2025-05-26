import 'dart:ui';

import 'package:flutter_addons/flutter_addons.dart';

class AppColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;

  @override
  Color get background => Kolors.neutral900;

  @override
  Color get cardBackground => Kolors.neutral800;

  @override
  Color get dividerColor => Kolors.neutral700;

  @override
  Color get forground => Kolors.neutral100; // corrected from 'forground'

  @override
  Color get inputBackground => Kolors.neutral700;

  @override
  Color get outlineColor => Kolors.neutral600;

  @override
  Color get primaryColor => Kolors.teal600;

  @override
  Color get secondaryButton => Kolors.neutral600;

  @override
  Color get secondaryContent => Kolors.neutral400;

  @override
  Color get shadowColor => Kolors.neutral900.withValues(alpha: .5);
}
