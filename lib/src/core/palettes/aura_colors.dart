// AuroraSoul (Vibrant & Energetic)
// A dynamic palette inspired by the aurora borealis.

part of 'package:flutter_addons/flutter_addons.dart';

class _AuroraLight extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;
  @override
  Color get primaryColor => const Color(0xFFEE7674);
  @override
  Color get forground => const Color(0xFF444444);
  @override
  Color get background => const Color(0xFFFEF9E7);
  @override
  Color get cardBackground => const Color(0xFFFDE7B4);
  @override
  Color get secondaryContent => const Color(0xFF868686);
  @override
  Color get inputBackground => const Color(0xFFFCECC3);
  @override
  Color get outlineColor => const Color(0xFFD9D9D9);
  @override
  Color get dividerColor => const Color(0xFFE6E6E6);
  @override
  Color get shadowColor => const Color(0x1A000000);
  @override
  Color get secondaryButton => const Color(0xFFF5D48E);
}

class _AuroraDark extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;
  @override
  Color get primaryColor => const Color(0xFFDC5B89);
  @override
  Color get forground => const Color(0xFFEDEDED);
  @override
  Color get background => const Color(0xFF1A1A1A);
  @override
  Color get cardBackground => const Color(0xFF292929);
  @override
  Color get secondaryContent => const Color(0xFFC2C2C2);
  @override
  Color get inputBackground => const Color(0xFF3A3A3A);
  @override
  Color get outlineColor => const Color(0xFF4C4C4C);
  @override
  Color get dividerColor => const Color(0xFF414141);
  @override
  Color get shadowColor => const Color(0x1A000000);
  @override
  Color get secondaryButton => const Color(0xFF3B3B3B);
}
