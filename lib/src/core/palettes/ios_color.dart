part of 'package:flutter_addons/flutter_addons.dart';

/// Core 12-color palette abstraction.

/// ==============================
/// 🍏 iOS Light Theme
/// ==============================
class IOSBrandLightColors extends BrandKolors {
  const IOSBrandLightColors();

  @override
  Brightness get brightness => Brightness.light;

  // Brand identity
  @override
  Color get primary => const Color(0xFF007AFF); // iOS Blue
  @override
  Color get secondary => const Color(0xFF5856D6); // Indigo accent
  @override
  Color get accent => const Color(0xFFFF9500); // Orange accent

  // Surface & background
  @override
  Color get background => const Color(0xFFF9F9F9);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFF2F2F7);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFF000000);
  @override
  Color get textSecondary => const Color(0xFF6E6E73);
  @override
  Color get textTertiary => const Color(0xFFAEAEB2);
}

/// ==============================
/// 🌙 iOS Dark Theme
/// ==============================
class IOSBrandDarkColors extends BrandKolors {
  const IOSBrandDarkColors();

  @override
  Brightness get brightness => Brightness.dark;

  // Brand identity
  @override
  Color get primary => const Color(0xFF0A84FF);
  @override
  Color get secondary => const Color(0xFF5E5CE6);
  @override
  Color get accent => const Color(0xFFFF9F0A);

  // Surface & background
  @override
  Color get background => const Color(0xFF000000);
  @override
  Color get surface => const Color(0xFF1C1C1E);
  @override
  Color get surfaceVariant => const Color(0xFF2C2C2E);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  @override
  Color get textSecondary => const Color(0xFFEBEBF5);
  @override
  Color get textTertiary => const Color(0xFF8E8E93);
}
