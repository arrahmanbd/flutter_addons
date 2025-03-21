// PastelSoul (Soft & Playful)
// Inspired by delicate pastel shades.
part of 'package:flutter_addons/flutter_addons.dart';
class PastelLight extends Kolors {
  @override Brightness get themeMode => Brightness.light;
  @override Color get primaryColor => const Color(0xFFFFC1CC);
  @override Color get forground => const Color(0xFF3E2723);
  @override Color get background => const Color(0xFFFFF8E1);
  @override Color get cardBackground => const Color(0xFFFFE0B2);
  @override Color get secondaryContent => const Color(0xFF8D6E63);
  @override Color get inputBackground => const Color(0xFFFFCCBC);
  @override Color get outlineColor => const Color(0xFFBCAAA4);
  @override Color get dividerColor => const Color(0xFFD7CCC8);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFFFB74D);
}
class PastelDark extends Kolors {
  @override Brightness get themeMode => Brightness.dark;
  @override Color get primaryColor => const Color(0xFFF48FB1);
  @override Color get forground => const Color(0xFFFFFFFF);
  @override Color get background => const Color(0xFF1C1C1C);
  @override Color get cardBackground => const Color(0xFF2A2A2A);
  @override Color get secondaryContent => const Color(0xFFBDBDBD);
  @override Color get inputBackground => const Color(0xFF383838);
  @override Color get outlineColor => const Color(0xFF4E4E4E);
  @override Color get dividerColor => const Color(0xFF5C5C5C);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFE57373);
}
