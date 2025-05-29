//  SunsetSoul (Warm & Cozy)
// Inspired by golden sunsets and twilight hues.
part of 'package:flutter_addons/flutter_addons.dart';

class _SummerLight extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;
  @override
  Color get primaryColor => const Color(0xFFFF9800);
  @override
  Color get forground => const Color(0xFF4E342E);
  @override
  Color get background => const Color(0xFFFFF3E0);
  @override
  Color get cardBackground => const Color(0xFFFDEACD);
  @override
  Color get secondaryContent => const Color(0xFF8D6E63);
  @override
  Color get inputBackground => const Color(0xFFFFCCBC);
  @override
  Color get outlineColor => const Color(0xFFBCAAA4);
  @override
  Color get dividerColor => const Color(0xFFD7CCC8);
  @override
  Color get shadowColor => const Color(0x29000000);
  @override
  Color get secondaryButton => const Color(0xFFFFB74D);
}

class _SummerDark extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;
  @override
  Color get primaryColor => const ui.Color.fromARGB(255, 226, 103, 66);
  @override
  Color get forground => const Color(0xFFFFFFFF);
  @override
  Color get background => const Color(0xFF161005);
  @override
  Color get cardBackground => const Color(0xFF201715);
  @override
  Color get secondaryContent => const Color(0xFFBCAAA4);
  @override
  Color get inputBackground => const Color(0xFF5D4037);
  @override
  Color get outlineColor => const Color(0xFF6D4C41);
  @override
  Color get dividerColor => const Color(0xFF795548);
  @override
  Color get shadowColor => const Color(0x29000000);
  @override
  Color get secondaryButton => const Color(0xFFE64A19);
}
