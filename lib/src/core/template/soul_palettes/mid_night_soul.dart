
// MidnightSoul (Elegant & Mysterious)
// A sophisticated dark theme with deep purples and blues.
part of 'package:flutter_addons/flutter_addons.dart';

class MidnightLight extends Kolors {
  @override Brightness get themeMode => Brightness.light;
  @override Color get primaryColor => const Color(0xFF6200EA);
  @override Color get forground => const Color(0xFF2C2C2C);
  @override Color get background => const Color(0xFFF3E5F5);
  @override Color get cardBackground => const Color(0xFFD1C4E9);
  @override Color get secondaryContent => const Color(0xFF9E9E9E);
  @override Color get inputBackground => const Color(0xFFEDE7F6);
  @override Color get outlineColor => const Color(0xFFBDBDBD);
  @override Color get dividerColor => const Color(0xFFC5CAE9);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFB39DDB);
}

class MidnightDark extends Kolors {
  @override Brightness get themeMode => Brightness.dark;
  @override Color get primaryColor => const Color(0xFFBB86FC);
  @override Color get forground => const Color(0xFFFFFFFF);
  @override Color get background => const Color(0xFF121212);
  @override Color get cardBackground => const Color(0xFF1E1E1E);
  @override Color get secondaryContent => const Color(0xFFBDBDBD);
  @override Color get inputBackground => const Color(0xFF242424);
  @override Color get outlineColor => const Color(0xFF3A3A3A);
  @override Color get dividerColor => const Color(0xFF292929);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFF312450);
}
