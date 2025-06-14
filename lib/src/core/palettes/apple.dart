part of 'package:flutter_addons/flutter_addons.dart';

class _Apple extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => Kolors.gray50; // Subtle light background

  @override
  Color get cardBackground => Kolors.neutral100; // Clean white cards

  @override
  Color get dividerColor => Kolors.gray200;

  @override
  Color get forground => Kolors.gray900; // Rich black text

  @override
  Color get inputBackground => Kolors.gray100;

  @override
  Color get outlineColor => Kolors.gray300;

  @override
  Color get primaryColor => Kolors.blue600; // iOS blue (buttons/links)

  @override
  Color get secondaryButton => Kolors.gray200;

  @override
  Color get secondaryContent => Kolors.gray500;

  @override
  Color get shadowColor => Kolors.neutral950.withValues(alpha: 0.1); // Subtle card shadow
}

class _AppleDark extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;

  @override
  Color get background => Kolors.gray900;

  @override
  Color get cardBackground => Kolors.gray800;

  @override
  Color get dividerColor => Kolors.gray700;

  @override
  Color get forground => Kolors.gray100;

  @override
  Color get inputBackground => Kolors.gray900;

  @override
  Color get outlineColor => Kolors.gray600;

  @override
  Color get primaryColor => Kolors.blue400; // Matches iOS accent blue

  @override
  Color get secondaryButton => Kolors.gray700;

  @override
  Color get secondaryContent => Kolors.gray400;

  @override
  Color get shadowColor => Kolors.neutral950.withValues(alpha: 0.4); // Slight elevation
}
