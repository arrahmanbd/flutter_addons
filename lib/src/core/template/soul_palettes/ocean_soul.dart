// OceanSoul (Calm & Serene)
// Inspired by deep sea blues and coastal waves.
part of 'package:flutter_addons/flutter_addons.dart';
class OceanLight extends Kolors {
  @override Brightness get themeMode => Brightness.light;
  @override Color get primaryColor => const Color(0xFF0077B6);
  @override Color get forground => const Color(0xFF222831);
  @override Color get background => const Color(0xFFCAF0F8);
  @override Color get cardBackground => const Color(0xFFADE8F4);
  @override Color get secondaryContent => const Color(0xFF6C757D);
  @override Color get inputBackground => const Color(0xFFE0F7FA);
  @override Color get outlineColor => const Color(0xFFB0BEC5);
  @override Color get dividerColor => const Color(0xFF90A4AE);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFBBDEFB);
}
class OceanDark extends Kolors {
  @override Brightness get themeMode => Brightness.dark;
  @override Color get primaryColor => const Color(0xFF00B4D8);
  @override Color get forground => const Color(0xFFFFFFFF);
  @override Color get background => const Color(0xFF001B2E);
  @override Color get cardBackground => const Color(0xFF023E8A);
  @override Color get secondaryContent => const Color(0xFFBDBDBD);
  @override Color get inputBackground => const Color(0xFF1C3A63);
  @override Color get outlineColor => const Color(0xFF37474F);
  @override Color get dividerColor => const Color(0xFF455A64);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFF1976D2);
}
