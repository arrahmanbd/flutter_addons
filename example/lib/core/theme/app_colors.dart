
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class AppDarkColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;

  @override
  Color get background => const Color(0xFF0D1117); // Soft black

  @override
  Color get cardBackground => const Color(0xFF161B22); // Card contrast

  @override
  Color get dividerColor => const Color(0xFF30363D); // Low contrast divider

  @override
  Color get foreground => const Color(0xFFF0F6FC); // Soft white text

  @override
  Color get inputBackground => const Color(0xFF1C2128); // Input fields

  @override
  Color get outlineColor => const Color(0xFF3E4C5A); // Focus border, subtle

  @override
  Color get primaryColor => const Color(0xFF10B981); // Emerald green (used by GitHub)

  @override
  Color get secondaryButton => const Color(0xFF374151); // Muted button background

  @override
  Color get secondaryContent => const Color(0xFF9CA3AF); // Muted text

  @override
  Color get shadowColor => Colors.black.withOpacity(0.4); // Elevated UI shadow
}
class AppLightColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => const Color(0xFFF9FAFB); // Off-white

  @override
  Color get cardBackground => const Color(0xFFFFFFFF); // Pure white cards

  @override
  Color get dividerColor => const Color(0xFFE5E7EB); // Tailwind neutral-200

  @override
  Color get foreground => const Color(0xFF111827); // Strong readable text

  @override
  Color get inputBackground => const Color(0xFFF3F4F6); // Slight gray for input

  @override
  Color get outlineColor => const Color(0xFFCBD5E1); // Subtle borders

  @override
  Color get primaryColor => const Color(0xFF2563EB); // Tailwind blue-600

  @override
  Color get secondaryButton => const Color(0xFFE2E8F0); // Light neutral button

  @override
  Color get secondaryContent => const Color(0xFF6B7280); // Muted text

  @override
  Color get shadowColor => Colors.black.withOpacity(0.08); // Light UI elevation
}
