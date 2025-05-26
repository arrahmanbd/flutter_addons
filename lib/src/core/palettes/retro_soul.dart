// RetroSoul (Bold & Nostalgic)
// Inspired by neon lights, vintage vibes, and retro tech.

part of 'package:flutter_addons/flutter_addons.dart';

class RetroLight extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;
  @override
  Color get primaryColor => const Color(0xFFFF4081); // Neon Pink
  @override
  Color get forground => const Color(0xFF212121); // Dark Gray for Text
  @override
  Color get background => const Color(0xFFFFF9C4); // Soft Yellow
  @override
  Color get cardBackground => const Color(0xFFFFEB3B); // Bright Yellow
  @override
  Color get secondaryContent => const Color(0xFF757575); // Light Gray
  @override
  Color get inputBackground => const Color(0xFF81C784); // Pastel Green
  @override
  Color get outlineColor => const Color(0xFFDD2C00); // Bold Orange
  @override
  Color get dividerColor => const Color(0xFFBDBDBD); // Gray Divider
  @override
  Color get shadowColor => const Color(0x29000000); // Soft Shadow
  @override
  Color get secondaryButton => const Color(0xFF9C27B0); // Purple
}

class RetroDark extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;
  @override
  Color get primaryColor => const Color(0xFF00E5FF); // Neon Cyan
  @override
  Color get forground => const Color(0xFFFFFFFF); // White Text
  @override
  Color get background => const Color(0xFF263238); // Deep Blue-Gray
  @override
  Color get cardBackground => const Color(0xFF202731); // Electric Blue
  @override
  Color get secondaryContent => const Color(0xFFBDBDBD); // Light Gray
  @override
  Color get inputBackground => const Color(0xFF1DE9B6); // Neon Green
  @override
  Color get outlineColor => const Color(0xFF382A2F); // Neon Pink
  @override
  Color get dividerColor => const Color(0xFF37474F); // Dark Blue-Gray
  @override
  Color get shadowColor => const Color(0x29000000); // Soft Shadow
  @override
  Color get secondaryButton => const Color(0xFFFF4081); // Neon Pink
}
