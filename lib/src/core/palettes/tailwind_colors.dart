part of 'package:flutter_addons/flutter_addons.dart';

/// ==============================
/// ☀️ Tailwind Light Theme
/// ==============================
class TailwindLightColors extends BrandKolors {
  const TailwindLightColors();

  @override
  Brightness get brightness => Brightness.light;

  // Brand identity
  @override
  Color get primary => const Color(0xFF3B82F6); // Blue-500
  @override
  Color get secondary => const Color(0xFF10B981); // Emerald-500
  @override
  Color get accent => const Color(0xFFF59E0B); // Amber-500

  // Surface & background
  @override
  Color get background => const Color(0xFFF9FAFB);
  @override
  Color get surface => const Color(0xFFFFFFFF);
  @override
  Color get surfaceVariant => const Color(0xFFF3F4F6);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFF111827);
  @override
  Color get textSecondary => const Color(0xFF374151);
  @override
  Color get textTertiary => const Color(0xFF6B7280);
}

/// ==============================
/// 🌙 Tailwind Dark Theme
/// ==============================
class TailwindDarkColors extends BrandKolors {
  const TailwindDarkColors();

  @override
  Brightness get brightness => Brightness.dark;

  // Brand identity
  @override
  Color get primary => const Color(0xFF60A5FA); // Blue-400
  @override
  Color get secondary => const Color(0xFF34D399); // Emerald-400
  @override
  Color get accent => const Color(0xFFFBBF24); // Amber-400

  // Surface & background
  @override
  Color get background => const Color(0xFF111827);
  @override
  Color get surface => const Color(0xFF1F2937);
  @override
  Color get surfaceVariant => const Color(0xFF374151);

  // Text & content
  @override
  Color get textPrimary => const Color(0xFFF9FAFB);
  @override
  Color get textSecondary => const Color(0xFFD1D5DB);
  @override
  Color get textTertiary => const Color(0xFF9CA3AF);
}
