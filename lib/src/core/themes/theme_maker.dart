part of 'package:flutter_addons/flutter_addons.dart';

/// Manages the application's theme settings, including colors and typography.
/// Implements the [SoulThemeEngine] interface for centralized theme handling.
///
/// This class is used to create a custom theme for the application.
/// Implementation of SoulThemeEngine with caching.
class ThemeMaker implements SoulThemeEngine {
  final Palette colors;
  final AppTypo typography;

  // Constructor with fallback typography
  ThemeMaker(this.colors, [AppTypo? typography])
    : typography = typography ?? FallBackTypography();

  @override
  ColorScheme get colorScheme => colors.colorScheme;

  // Safely initialize textTheme using typography.toTextTheme
  @override
  TextTheme get textTheme {
    try {
      return typography.toTextTheme(colorScheme);
    } catch (e) {
      // In case of an error, use a fallback TextTheme
      // to avoid breaking the app.
      // 2 hours of my life I’ll never get back, LOL
      // Should’ve used a try-catch block instead of diving into the rabbit hole.
      // Rookie mistake, but hey, it works now... for now 😉
      return TextTheme(
        // titleLarge: TextStyle(color: colorScheme.),
        // bodyMedium: TextStyle(color: colorScheme.onSurfaceVariant),
      );
    }
  }

  @override
  ThemeData get themeData => _buildThemeData();

  // Factory method to create and cache themes
  static ThemeData makeTheme(Palette colors, {AppTypo? typography}) {
    final typo = typography ?? FallBackTypography();
    final cacheKey = _generateCacheKey(colors, typo);

    // Return cached theme if available
    if (_cache.containsKey(cacheKey)) {
      return _cache[cacheKey]!.themeData;
    }

    // Build the theme
    final theme = ThemeMaker(colors, typography);
    _cache[cacheKey] = theme;
    return theme.themeData;
  }

  // Generate a unique cache key based on colors and typography
  static String _generateCacheKey(Palette colors, AppTypo typography) {
    return Object.hashAll([
      colors.colorScheme.primary.r,
      colors.colorScheme.secondary.r,
      typography.fontFamily,
    ]).toString();
  }

  // In-memory cache for previously created themes
  static final Map<String, ThemeMaker> _cache = {};

  // Method to clear the theme cache
  static void clearCache() => _cache.clear();

  // Build the ThemeData based on the given color scheme and typography
  ThemeData _buildThemeData() {
    // Generate component themes based on colors and textTheme
    final componentThemes = SoulComponentThemes(
      colorScheme: colorScheme,
      textTheme: textTheme,
    );

    return ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: colorScheme.primary.withAlpha(38), // 15% alpha
      dividerColor: colorScheme.onSecondaryContainer,
      fontFamily: typography.fontFamily,
      textTheme: textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      // Theme components
      appBarTheme: componentThemes.appBarTheme,
      buttonTheme: componentThemes.buttonTheme,
      textButtonTheme: componentThemes.textButtonTheme,
      elevatedButtonTheme: componentThemes.elevatedButtonTheme,
      outlinedButtonTheme: componentThemes.outlinedButtonTheme,
      cardTheme: componentThemes.cardTheme,
      inputDecorationTheme: componentThemes.inputDecorationTheme,
      dialogTheme: componentThemes.dialogTheme,
      snackBarTheme: componentThemes.snackBarTheme,
      bannerTheme: componentThemes.bannerTheme,
      bottomNavigationBarTheme: componentThemes.bottomNavigationBarTheme,
      popupMenuTheme: componentThemes.popupMenuTheme,
      checkboxTheme: componentThemes.checkboxTheme,
      chipTheme: componentThemes.chipTheme,
      floatingActionButtonTheme: componentThemes.floatingActionButtonTheme,
    );
  }
}
