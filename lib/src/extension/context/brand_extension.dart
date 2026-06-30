part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on [BuildContext] to provide convenient access
/// to theme-related properties such as current theme mode.
/// [Professional Brand Design System]
/// Comprehensive theme extensions with actual brand color semantics

/// Core theme access
extension BrandThemeExtension on BuildContext {
  ThemeData get _theme => Theme.of(this);

  ColorScheme get colorScheme => _theme.colorScheme;

  TextTheme get textTheme => _theme.textTheme;

  bool get isDark => _theme.brightness == Brightness.dark;
}

/// Clean Brand Color System
extension BrandColorsExtension on BuildContext {
  // ─────────────────────────────────────────────
  // Brand
  // ─────────────────────────────────────────────

  Color get primary => colorScheme.primary;

  Color get secondary => colorScheme.secondary;

  Color get accent => colorScheme.tertiary;

  // ─────────────────────────────────────────────
  // Status
  // ─────────────────────────────────────────────

  Color get success => colorScheme.tertiary;

  Color get successContainer => colorScheme.tertiaryContainer;

  Color get warning => const Color(0xFFFFB300);

  Color get warningContainer => const Color(0xFFFFF3CD);

  Color get error => colorScheme.error;

  Color get errorContainer => colorScheme.errorContainer;

  // ─────────────────────────────────────────────
  // Surface
  // ─────────────────────────────────────────────

  Color get background => colorScheme.surface;

  Color get surface => colorScheme.surface;

  Color get surfaceHigh => colorScheme.surfaceContainerHighest;

  Color get inputBackground => colorScheme.surfaceContainerHigh;

  // ─────────────────────────────────────────────
  // Text
  // ─────────────────────────────────────────────

  Color get textPrimary => colorScheme.onSurface;

  Color get textSecondary => colorScheme.onSurfaceVariant;

  Color get textTertiary => colorScheme.outline;

  Color get textOnPrimary => colorScheme.onPrimary;

  // ─────────────────────────────────────────────
  // Buttons
  // ─────────────────────────────────────────────

  Color get primaryButton => colorScheme.primary;

  Color get secondaryButton => colorScheme.secondaryContainer;

  Color get outlineButtonBorder => colorScheme.outline;

  Color get buttonDisabled => colorScheme.onSurface.withValues(alpha: 0.12);

  Color get fabBackground => colorScheme.primaryContainer;

  // ─────────────────────────────────────────────
  // Border & Divider
  // ─────────────────────────────────────────────

  Color get border => colorScheme.outline;

  Color get borderFocus => colorScheme.primary;

  Color get divider => colorScheme.outlineVariant;

  Color get dividerSubtle => colorScheme.surfaceContainerHighest;

  // ─────────────────────────────────────────────
  // Effects
  // ─────────────────────────────────────────────

  Color get shadow => colorScheme.shadow;

  Color get scrim => colorScheme.scrim;

  Color get overlay => colorScheme.surfaceTint;

  // ─────────────────────────────────────────────
  // Gradients
  // ─────────────────────────────────────────────

  Gradient get brandGradient => LinearGradient(
    colors: [primary, accent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  Gradient get surfaceGradient => LinearGradient(
    colors: [surface, surfaceHigh],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

/// Adaptive Color Helpers
extension BrandAdaptiveColors on BuildContext {
  Color adaptiveColor({required Color light, required Color dark}) {
    return isDark ? dark : light;
  }

  Color adaptiveBrand(Color baseColor, {double darkAdjustment = -0.1}) {
    if (!isDark) return baseColor;

    final hsl = HSLColor.fromColor(baseColor);
    final lightness = (hsl.lightness + darkAdjustment).clamp(0.0, 1.0);

    return hsl.withLightness(lightness).toColor();
  }

  Color adaptiveSurface([int elevation = 0]) {
    const lightSurfaces = [
      Color(0xFFFFFFFF),
      Color(0xFFF8F9FA),
      Color(0xFFF1F3F4),
      Color(0xFFECEEF0),
    ];

    const darkSurfaces = [
      Color(0xFF121212),
      Color(0xFF1E1E1E),
      Color(0xFF242424),
      Color(0xFF272727),
    ];

    final index = elevation.clamp(0, lightSurfaces.length - 1);

    return adaptiveColor(
      light: lightSurfaces[index],
      dark: darkSurfaces[index],
    );
  }
}

/// Brand Layout & Styling Tokens
extension BrandStylingExtension on BuildContext {
  // ─────────────────────────────────────────────
  // Radius
  // ─────────────────────────────────────────────

  BorderRadius get radiusSmall => const BorderRadius.all(Radius.circular(8));

  BorderRadius get radiusMedium => const BorderRadius.all(Radius.circular(12));

  BorderRadius get radiusLarge => const BorderRadius.all(Radius.circular(16));

  BorderRadius get radiusXLarge => const BorderRadius.all(Radius.circular(24));

  // ─────────────────────────────────────────────
  // Shadows
  // ─────────────────────────────────────────────

  List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.10),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.15),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  List<BoxShadow> get shadowLarge => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.20),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  // ─────────────────────────────────────────────
  // Spacing
  // ─────────────────────────────────────────────

  double get spacingXS => 4;

  double get spacingSM => 8;

  double get spacingMD => 16;

  double get spacingLG => 24;

  double get spacingXL => 32;
}
