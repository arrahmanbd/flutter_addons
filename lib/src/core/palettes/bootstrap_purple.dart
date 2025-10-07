part of 'package:flutter_addons/flutter_addons.dart';

/// ==============================
/// ☀️ Bootstrap Light Theme
/// ==============================
class BootstrapLightColors extends BrandKolors {
  const BootstrapLightColors();

  @override
  Brightness get brightness => Brightness.light;

  // Brand identity
  @override
  Color get primary => const Color(0xFF0D6EFD);
  @override
  Color get secondary => const Color(0xFF6C757D);
  @override
  Color get accent => const Color(0xFF6610F2);

  // Surface & background
  @override
  Color get background => const Color(0xFFFFFFFF);
  @override
  Color get surface => const Color(0xFFF8F9FA);
  @override
  Color get surfaceVariant => const Color(0xFFE9ECEF);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFF212529);
  @override
  Color get textSecondary => const Color(0xFF495057);
  @override
  Color get textTertiary => const Color(0xFF6C757D);
}

/// ==============================
/// 🌙 Bootstrap Dark Theme
/// ==============================
class BootstrapDarkColors extends BrandKolors {
  const BootstrapDarkColors();

  @override
  Brightness get brightness => Brightness.dark;

  // Brand identity
  @override
  Color get primary => const Color(0xFF0D6EFD);
  @override
  Color get secondary => const Color(0xFFADB5BD);
  @override
  Color get accent => const Color(0xFF6F42C1);

  // Surface & background
  @override
  Color get background => const Color(0xFF212529);
  @override
  Color get surface => const Color(0xFF2C3034);
  @override
  Color get surfaceVariant => const Color(0xFF343A40);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFFFFFFFF);
  @override
  Color get textSecondary => const Color(0xFFE9ECEF);
  @override
  Color get textTertiary => const Color(0xFFCED4DA);
}
