part of 'package:flutter_addons/flutter_addons.dart';

class _LinuxMint extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => const Color(0xFFF5F6F5); // Mint light gray background

  @override
  Color get cardBackground => const Color(0xFFFFFFFF); // Pure white for cards

  @override
  Color get dividerColor => const Color(0xFFE0E0E0); // Light divider

  @override
  Color get forground => const Color(0xFF1B1B1B); // Dark text

  @override
  Color get inputBackground => const Color(0xFFF0F0F0); // Light input fields

  @override
  Color get outlineColor => const Color(0xFFBBBBBB); // Outlines

  @override
  Color get primaryColor => const Color(0xFF66BB6A); // Vibrant Mint green

  @override
  Color get secondaryButton => const Color(0xFFEDEDED); // Subtle surface

  @override
  Color get secondaryContent => const Color(0xFF555555); // Subtext or hints

  @override
  Color get shadowColor => const Color(0xFF000000).withValues(alpha: 0.05); // Light shadow
}

class _LinuxMintDark extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;

  @override
  Color get background => const Color(0xFF1E1E1E); // Main dark background

  @override
  Color get cardBackground => const Color(0xFF2A2A2A); // Dark surface for cards

  @override
  Color get dividerColor => const Color(0xFF3A3A3A); // Subtle divider

  @override
  Color get forground => const Color(0xFFEAEAEA); // Soft white for text

  @override
  Color get inputBackground => const Color(0xFF2E2E2E); // Form fields background

  @override
  Color get outlineColor => const Color(0xFF555555); // Outlines and borders

  @override
  Color get primaryColor => const Color(0xFF66BB6A); // Mint green

  @override
  Color get secondaryButton => const Color(0xFF444444); // Low emphasis button

  @override
  Color get secondaryContent => const Color(0xFFB0B0B0); // Subtle text

  @override
  Color get shadowColor => const Color(0xFF000000).withValues(alpha:0.3); // Shadow for elevation
}
