part of 'package:flutter_addons/flutter_addons.dart';

/// Manages the application's theme settings, including colors and typography.
/// Implements the [SoulThemeEngine] interface for centralized theme handling.
///
/// A theme engine implementation that creates and caches ThemeData instances
/// based on provided color palettes and typography configurations.
class ThemeMaker implements SoulThemeEngine {
  final Palette colors;
  final BrandTypo typography;

  /// Creates a ThemeMaker instance with the specified colors and typography.
  ///
  /// [colors] - The color palette for the theme
  /// [typography] - Optional typography configuration, falls back to [FallBackTypography] if not provided
  ThemeMaker(this.colors, [BrandTypo? typography])
    : typography = typography ?? FallBackTypography();

  @override
  ColorScheme get colorScheme => colors.colorScheme;

  @override
  TextTheme get textTheme {
    try {
      return typography.toTextTheme(colorScheme);
    } catch (e) {
      // Fallback to empty TextTheme to maintain application stability
      // when typography conversion fails
      // In case of an error, use a fallback TextTheme
      // to avoid breaking the app.
      // 2 hours of my life I’ll never get back, LOL
      // Should’ve used a try-catch block instead of diving into the rabbit hole.
      // Rookie mistake, but hey, it works now... for now 😉
      return const TextTheme();
    }
  }

  @override
  ThemeData get themeData => _buildThemeData();

  /// Creates and caches a ThemeData instance based on the provided parameters.
  ///
  /// [colors] - The color palette for the theme
  /// [typography] - Optional typography configuration
  /// Returns a cached or newly created ThemeData instance
  static ThemeData makeTheme(Palette colors, {BrandTypo? typography}) {
    final typo = typography ?? FallBackTypography();
    final cacheKey = _generateCacheKey(colors, typo);

    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!.themeData;
    }

    final theme = ThemeMaker(colors, typography);
    _cache[cacheKey] = theme;
    return theme.themeData;
  }

  /// Generates a unique cache key based on color scheme and typography properties.
  static String _generateCacheKey(Palette colors, BrandTypo typography) {
    return Object.hashAll([
      colors.colorScheme.onPrimary.hashCode,
      colors.colorScheme.onSurface.hashCode,
      typography.fontFamily,
    ]).toString();
  }

  /// In-memory cache for theme instances to avoid redundant creations
  static final Map<String, ThemeMaker> _cache = {};

  /// Clears all cached theme instances
  static void clearCache() => _cache.clear();

  /// Builds the complete ThemeData using the configured color scheme and typography
  ThemeData _buildThemeData() {
    return SoulTheme(
      colorScheme: colorScheme,
      textTheme: textTheme,
      typography: typography,
    ).themeData;
  }
}
