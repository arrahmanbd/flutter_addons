part of 'package:flutter_addons/flutter_addons.dart';

/// A unified registry of all available UI brand themes.
/// Easily switch between different design systems and their light/dark variants.
class UiTheme {
  // === Predefined themes ===
  static const apple = IOSBrandLightColors();
  static const appleDark = IOSBrandDarkColors();

  static const soul = LightSoulColors();
  static const soulDark = DarkSoulColors();

  static const material = GoogleMaterialLightColors();
  static const materialDark = GoogleMaterialDarkColors();

  static const twitter = TwitterLightColors();
  static const twitterDark = TwitterDarkColors();

  static const tailwind = TailwindLightColors();
  static const tailwindDark = TailwindDarkColors();

  static const bootstrap = BootstrapLightColors();
  static const bootstrapDark = BootstrapDarkColors();

  static const neutral = NeutralLightColors();
  static const neutralDark = NeutralDarkColors();

  /// === Dynamic getter ===
  /// Returns the theme by name. `dark` determines light/dark variant.
  static BrandKolors of(String name, {bool dark = false}) {
    switch (name.toLowerCase()) {
      case 'apple':
        return dark ? appleDark : apple;
      case 'soul':
        return dark ? soulDark : soul;
      case 'material':
      case 'google':
        return dark ? materialDark : material;
      case 'twitter':
        return dark ? twitterDark : twitter;
      case 'tailwind':
        return dark ? tailwindDark : tailwind;
      case 'bootstrap':
        return dark ? bootstrapDark : bootstrap;
      case 'neutral':
      default:
        return dark ? neutralDark : neutral;
    }
  }
}

// Example
// final currentTheme = UiTheme.of("apple");         // Apple Light
// final darkMaterial = UiTheme.of("material", dark: true); // Google Material Dark
// final tailwindTheme = UiTheme.of("tailwind");     // Tailwind Light
