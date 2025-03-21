// AuroraSoul (Vibrant & Energetic)
// A dynamic palette inspired by the aurora borealis.

part of 'package:flutter_addons/flutter_addons.dart';


class AuroraLight extends Kolors {
  @override Brightness get themeMode => Brightness.light;
  @override Color get primaryColor => const Color(0xFFFF6B6B);
  @override Color get forground => const Color(0xFF333333);
  @override Color get background => const Color(0xFFFFF8E1);
  @override Color get cardBackground => const Color(0xFFFFECB3);
  @override Color get secondaryContent => const Color(0xFF757575);
  @override Color get inputBackground => const Color(0xFFFFF3CD);
  @override Color get outlineColor => const Color(0xFFD6D6D6);
  @override Color get dividerColor => const Color(0xFFE0E0E0);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFFFFE082);
}
class AuroraDark extends Kolors {
  @override Brightness get themeMode => Brightness.dark;
  @override Color get primaryColor => const Color(0xFFFF4081);
  @override Color get forground => const Color(0xFFFFFFFF);
  @override Color get background => const Color(0xFF121212);
  @override Color get cardBackground => const Color(0xFF1F1F1F);
  @override Color get secondaryContent => const Color(0xFFBDBDBD);
  @override Color get inputBackground => const Color(0xFF303030);
  @override Color get outlineColor => const Color(0xFF424242);
  @override Color get dividerColor => const Color(0xFF383838);
  @override Color get shadowColor => const Color(0x29000000);
  @override Color get secondaryButton => const Color(0xFF2E2E2E);
}
