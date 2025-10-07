part of 'package:flutter_addons/flutter_addons.dart';

/// A minimal yet comprehensive 12-color system for easy branding
/// Covers all essential needs for any app without complexity
abstract class BrandKolors extends Palette {
  const BrandKolors();

  // === CORE BRAND (3 colors) ===
  Brightness get brightness;
  Color get primary;
  Color get secondary;
  Color get accent;

  // === SURFACE & BACKGROUND (3 colors) ===
  Color get background;
  Color get surface;
  Color get surfaceVariant;

  // === TEXT & CONTENT (3 colors) ===
  Color get textPrimary;
  Color get textSecondary;
  Color get textTertiary;

  // === FEEDBACK & STATES (optional 3 colors) ===
  Color get success => const Color(0xFF4CAF50);
  Color get warning => const Color(0xFFFF9800);
  Color get error => const Color(0xFFF44336);

  // === DERIVED COLORS ===
  Color get onPrimary => _getContrastColor(primary);
  Color get onSecondary => _getContrastColor(secondary);
  Color get onAccent => _getContrastColor(accent);
  Color get onBackground => textPrimary;
  Color get onSurface => textPrimary;
  Color get onError => _getContrastColor(error);

  Color get border =>
      brightness == Brightness.light
          ? const Color(0xFFE0E0E0)
          : const Color(0xFF404040);

  Color get shadow =>
      brightness == Brightness.light
          ? Colors.black.withValues(alpha: 0.1)
          : Colors.black.withValues(alpha: 0.4);

  // === COLOR SCHEME ===
  @override
  ColorScheme get colorScheme => ColorScheme(
    brightness: brightness,
    primary: primary,
    onPrimary: onPrimary,
    primaryContainer: primary.withValues(alpha: 0.1),
    secondary: secondary,
    onSecondary: onSecondary,
    secondaryContainer: secondary.withValues(alpha: 0.1),
    tertiary: accent,
    onTertiary: onAccent,
    tertiaryContainer: accent.withValues(alpha: 0.1),
    error: error,
    onError: onError,
    errorContainer: error.withValues(alpha: 0.1),
    surface: surface,
    onSurface: onSurface,
    surfaceContainerHighest: surfaceVariant,
    onSurfaceVariant: textSecondary,
    outline: border,
    outlineVariant: border.withValues(alpha: 0.5),
    shadow: shadow,
  );

  Color _getContrastColor(Color color) {
    final luminance = color.computeLuminance();
    if (luminance > 0.6) return Colors.black;
    if (luminance < 0.4) return Colors.white;
    return brightness == Brightness.dark ? Colors.white : Colors.black;
  }
}


// Example implementations
// class LightBrandColors extends BrandColors {
//   const LightBrandColors();

//   @override
//   Brightness get brightness => Brightness.light;
//   @override
//   Color get primary => const Color(0xFF4A90E2);
//   @override
//   Color get secondary => const Color(0xFF50E3C2);
//   @override
//   Color get accent => const Color(0xFFFFC107);
//   @override
//   Color get background => const Color(0xFFFDFDFD);
//   @override
//   Color get surface => const Color(0xFFFFFFFF);
//   @override
//   Color get surfaceVariant => const Color(0xFFF2F2F2);
//   @override
//   Color get textPrimary => const Color(0xFF212121);
//   @override
//   Color get textSecondary => const Color(0xFF757575);
//   @override
//   Color get textTertiary => const Color(0xFFBDBDBD);
//   @override
//   Color get success => const Color(0xFF4CAF50);
//   @override
//   Color get warning => const Color(0xFFFF9800);
//   @override
//   Color get error => const Color(0xFFF44336);
// }



// The 12 Essential Colors:
// 🎨 Core Brand (3)
// primary - Main brand color

// secondary - Supporting brand color

// accent - Highlights, CTAs

// 🖼️ Surfaces (3)
// background - App background

// surface - Cards, dialogs

// surfaceVariant - Elevated elements

// 📝 Text (3)
// textPrimary - Main content

// textSecondary - Subtle text

// textTertiary - Placeholders

// ⚡ Feedback (3)
// success - Positive states

// warning - Warnings

// error - Errors
