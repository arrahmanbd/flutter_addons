part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on [BuildContext] to provide convenient access
/// to theme-related properties such as current theme mode.
extension ThemeModeExtensions on BuildContext {
  /// Gets the current [ThemeMode] inferred from platform brightness.
  ///
  /// Note: This is a best-effort fallback and does not reflect
  /// an explicitly set [ThemeMode] (e.g., from app settings).
  ThemeMode get themeMode {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  }

  /// Returns `true` if the current theme is considered dark.
  ///
  /// This checks both explicit dark mode and inferred system dark mode.
  bool get isDark {
    final brightness = MediaQuery.of(this).platformBrightness;
    return themeMode == ThemeMode.dark || brightness == Brightness.dark;
  }

  /// Returns `true` if the current theme is considered light.
  ///
  /// This checks both explicit light mode and inferred system light mode.
  bool get isLight {
    final brightness = MediaQuery.of(this).platformBrightness;
    return themeMode == ThemeMode.light || brightness == Brightness.light;
  }

  /// Returns `true` if the app follows the system theme mode.
  bool get isSystemTheme => themeMode == ThemeMode.system;
}
