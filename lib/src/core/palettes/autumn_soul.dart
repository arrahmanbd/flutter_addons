// PastelSoul (Soft & Playful)
// Inspired by delicate pastel shades.
part of 'package:flutter_addons/flutter_addons.dart';

class PastelLight extends Kolors {
  @override
  Brightness get themeMode => Brightness.light;
  @override
  Color get primaryColor => const Color(0xFFF8B6C1);
  @override
  Color get forground => const Color(0xFF4A322F);
  @override
  Color get background => const Color(0xFFFFFAF0);
  @override
  Color get cardBackground => const Color(0xFFF5D9B1);
  @override
  Color get secondaryContent => const Color(0xFF9C7D71);
  @override
  Color get inputBackground => const Color(0xFFF5C8BE);
  @override
  Color get outlineColor => const Color(0xFFCAB5A8);
  @override
  Color get dividerColor => const Color(0xFFD9CDC5);
  @override
  Color get shadowColor => const Color(0x1A000000);
  @override
  Color get secondaryButton => const Color(0xFFF0AB72);
}

class PastelDark extends Kolors {
  @override
  Brightness get themeMode => Brightness.dark;
  @override
  Color get primaryColor => const Color(0xFFE89AAE);
  @override
  Color get forground => const Color(0xFFEDEDED);
  @override
  Color get background => const Color(0xFF252525);
  @override
  Color get cardBackground => const Color(0xFF333333);
  @override
  Color get secondaryContent => const Color(0xFFC4C4C4);
  @override
  Color get inputBackground => const Color(0xFF424242);
  @override
  Color get outlineColor => const Color(0xFF5A5A5A);
  @override
  Color get dividerColor => const Color(0xFF666666);
  @override
  Color get shadowColor => const Color(0x1A000000);
  @override
  Color get secondaryButton => const Color(0xFFD48A8A);
}
