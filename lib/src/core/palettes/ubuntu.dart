part of 'package:flutter_addons/flutter_addons.dart';

class _UbuntuColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => const Color(0xFFF6F6F6); // Soft light gray

  @override
  Color get cardBackground => const Color(0xFFFFFFFF); // Clean white

  @override
  Color get dividerColor => const Color(0xFFE0E0E0);

  @override
  Color get forground => const Color(0xFF2C2C2C); // Ubuntu dark gray text

  @override
  Color get inputBackground => const Color(0xFFF2F2F2);

  @override
  Color get outlineColor => const Color(0xFFCCCCCC);

  @override
  Color get primaryColor => const Color(0xFFD64937); // Ubuntu Orange

  @override
  Color get secondaryButton => const Color(0xFFDDDDDD); // Light neutral

  @override
  Color get secondaryContent => const Color(0xFF666666); // Mid-gray

  @override
  Color get shadowColor => const Color(0xFF000000).withValues(alpha:0.05);
}

class _UbuntuDarkColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;

  @override
  Color get background => const Color(0xFF1F1F1F); // Neutral dark background

  @override
  Color get cardBackground => const Color(0xFF2A2A2A); // Soft black-gray

  @override
  Color get dividerColor => const Color(0xFF3A3A3A); // Muted neutral gray

  @override
  Color get forground => const Color(0xFFF6F6F6); // Light text

  @override
  Color get inputBackground => const Color(0xFF2E2E2E); // Input field dark

  @override
  Color get outlineColor => const Color(0xFF4D4D4D); // Subtle outline

  @override
  Color get primaryColor => const Color(0xFFD84E27); // Slightly toned Ubuntu orange

  @override
  Color get secondaryButton => const Color(0xFF3D3D3D); // Flat dark gray

  @override
  Color get secondaryContent => const Color(0xFFA0A0A0); // Neutral muted text

  @override
  Color get shadowColor => const Color(0xFF000000).withValues(alpha:0.3); // Richer shadows
}
