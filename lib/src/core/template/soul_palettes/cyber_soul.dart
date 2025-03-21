
// CyberSoul (Futuristic & High-Tech)
// Inspired by neon lights and cyberpunk aesthetics.
part of 'package:flutter_addons/flutter_addons.dart';
class CyberLight extends Kolors {
  @override Brightness get themeMode => Brightness.light;
  @override Color get primaryColor => const Color(0xFFFF0266);
  @override Color get forground => const Color(0xFF212121);
  @override Color get background => const Color(0xFFF3E5F5);
  @override Color get cardBackground => const Color(0xFFE1BEE7);
  @override Color get secondaryContent => const Color(0xFF9E9E9E);
  @override Color get inputBackground => const Color(0xFFF8BBD0);
  @override Color get outlineColor => const Color(0xFFCE93D8);
  @override Color get dividerColor => const Color(0xFFBA68C8);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFEC407A);
}
class CyberDark extends Kolors {
  @override Brightness get themeMode => Brightness.dark;
  @override Color get primaryColor => const Color(0xFFFF4081);
  @override Color get forground => const Color(0xFFFFFFFF);
  @override Color get background => const Color(0xFF121212);
  @override Color get cardBackground => const Color(0xFF1C1C1C);
  @override Color get secondaryContent => const Color(0xFFBDBDBD);
  @override Color get inputBackground => const Color(0xFF292929);
  @override Color get outlineColor => const Color(0xFF424242);
  @override Color get dividerColor => const Color(0xFF383838);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFD81B60);
}
