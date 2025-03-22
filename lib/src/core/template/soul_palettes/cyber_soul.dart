
// CyberSoul (Futuristic & High-Tech)
// Inspired by neon lights and cyberpunk aesthetics.
part of 'package:flutter_addons/flutter_addons.dart';

class CyberLight extends Kolors {
  @override Brightness get themeMode => Brightness.light;
  @override Color get primaryColor => const Color(0xFFE9457A);
  @override Color get forground => const Color(0xFF2A2A2A);
  @override Color get background => const Color(0xFFF6EBF5);
  @override Color get cardBackground => const Color(0xFFD9BFD8);
  @override Color get secondaryContent => const Color(0xFFA8A8A8);
  @override Color get inputBackground => const Color(0xFFF0C5D3);
  @override Color get outlineColor => const Color(0xFFC8A3CF);
  @override Color get dividerColor => const Color(0xFFB78BBE);
  @override Color get shadowColor => const Color(0x1A000000);
  @override Color get secondaryButton => const Color(0xFFE06492);
}

class CyberDark extends Kolors {
  @override Brightness get themeMode => Brightness.dark;
  @override Color get primaryColor => const Color(0xFFD84575);
  @override Color get forground => const Color(0xFFEDEDED);
  @override Color get background => const Color(0xFF1A1A1A);
  @override Color get cardBackground => const Color(0xFF252525);
  @override Color get secondaryContent => const Color(0xFFB8B8B8);
  @override Color get inputBackground => const Color(0xFF333333);
  @override Color get outlineColor => const Color(0xFF4A4A4A);
  @override Color get dividerColor => const Color(0xFF414141);
  @override Color get shadowColor => const Color(0x1A000000);
  @override Color get secondaryButton => const Color(0xFFC23C6D);
}