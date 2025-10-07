part of 'package:flutter_addons/flutter_addons.dart';

/// ==============================
/// ☀️ Google Material Light Theme
/// ==============================
class GoogleMaterialLightColors extends BrandKolors {
  const GoogleMaterialLightColors();

  @override
  Brightness get brightness => Brightness.light;

  // Brand identity
  @override
  Color get primary => const Color(0xFF4285F4); // Google Blue
  @override
  Color get secondary => const Color(0xFFDB4437); // Google Red
  @override
  Color get accent => const Color(0xFFF4B400); // Google Yellow

  // Surface & background
  @override
  Color get background => const Color(0xFFF8F9FA);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFF1F3F4);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFF202124);
  @override
  Color get textSecondary => const Color(0xFF5F6368);
  @override
  Color get textTertiary => const Color(0xFF9AA0A6);
}

/// ==============================
/// 🌙 Google Material Dark Theme
/// ==============================
class GoogleMaterialDarkColors extends BrandKolors {
  const GoogleMaterialDarkColors();

  @override
  Brightness get brightness => Brightness.dark;

  // Brand identity
  @override
  Color get primary => const Color(0xFF8AB4F8);
  @override
  Color get secondary => const Color(0xFFF28B82);
  @override
  Color get accent => const Color(0xFFFDD663);

  // Surface & background
  @override
  Color get background => const Color(0xFF202124);
  @override
  Color get surface => const Color(0xFF303134);
  @override
  Color get surfaceVariant => const Color(0xFF3C4043);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  @override
  Color get textSecondary => const Color(0xFFBDC1C6);
  @override
  Color get textTertiary => const Color(0xFF9AA0A6);
}
