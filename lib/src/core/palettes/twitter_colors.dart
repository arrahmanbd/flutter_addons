part of 'package:flutter_addons/flutter_addons.dart';

/// This is Default Color Palette
/// **Light Theme Color Palette**
/// ==============================
/// ☀️ Twitter Light Theme
/// ==============================
class TwitterLightColors extends BrandKolors {
  const TwitterLightColors();

  @override
  Brightness get brightness => Brightness.light;

  // Brand identity
  @override
  Color get primary => const Color(0xFF1DA1F2);
  @override
  Color get secondary => const Color(0xFF14171A);
  @override
  Color get accent => const Color(0xFFFFAD1F);

  // Surface & background
  @override
  Color get background => const Color(0xFFFFFFFF);
  @override
  Color get surface => const Color(0xFFF5F8FA);
  @override
  Color get surfaceVariant => const Color(0xFFE1E8ED);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFF0F1419);
  @override
  Color get textSecondary => const Color(0xFF536471);
  @override
  Color get textTertiary => const Color(0xFFAAB8C2);
}

/// ==============================
/// 🌙 Twitter Dark Theme
/// ==============================
class TwitterDarkColors extends BrandKolors {
  const TwitterDarkColors();

  @override
  Brightness get brightness => Brightness.dark;

  // Brand identity
  @override
  Color get primary => const Color(0xFF1DA1F2);
  @override
  Color get secondary => const Color(0xFF15202B);
  @override
  Color get accent => const Color(0xFFFFAD1F);

  // Surface & background
  @override
  Color get background => const Color(0xFF15202B);
  @override
  Color get surface => const Color(0xFF192734);
  @override
  Color get surfaceVariant => const Color(0xFF22303C);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  @override
  Color get textSecondary => const Color(0xFF8899A6);
  @override
  Color get textTertiary => const Color(0xFF6E767D);
}
