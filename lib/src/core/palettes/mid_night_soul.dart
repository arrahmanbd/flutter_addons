// MidnightSoul (Elegant & Mysterious) 🌙
// A sophisticated dark theme with deep purples and blues.
part of 'package:flutter_addons/flutter_addons.dart';

class MidnightLight extends Kolors {
  @override
  Brightness get themeMode => Brightness.light;
  @override
  Color get primaryColor => const Color(0xFF7A5DCC);
  @override
  Color get forground => const Color(0xFF3A3A3A);
  @override
  Color get background => const Color(0xFFF5F0FA);
  @override
  Color get cardBackground => const Color(0xFFD9CFE8);
  @override
  Color get secondaryContent => const Color(0xFFA8A8A8);
  @override
  Color get inputBackground => const Color(0xFFE9E2F3);
  @override
  Color get outlineColor => const Color(0xFFC2C2C2);
  @override
  Color get dividerColor => const Color(0xFFD0D3E5);
  @override
  Color get shadowColor => const Color(0x1A000000);
  @override
  Color get secondaryButton => const Color(0xFFC4B0DC);
}

class MidnightDark extends Kolors {
  @override
  Brightness get themeMode => Brightness.dark;
  @override
  Color get primaryColor => const Color(0xFFA078D1);
  @override
  Color get forground => const Color(0xFFEAEAEA);
  @override
  Color get background => const Color(0xFF191925);
  @override
  Color get cardBackground => const Color(0xFF252535);
  @override
  Color get secondaryContent => const Color(0xFFB5B5B5);
  @override
  Color get inputBackground => const Color(0xFF2F2F40);
  @override
  Color get outlineColor => const Color(0xFF494961);
  @override
  Color get dividerColor => const Color(0xFF3A3A4D);
  @override
  Color get shadowColor => const Color(0x1A000000);
  @override
  Color get secondaryButton => const Color(0xFF4A3D6A);
}
