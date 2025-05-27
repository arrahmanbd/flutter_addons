part of 'package:flutter_addons/flutter_addons.dart';

extension ThemeModeExtensions on BuildContext {
  /// Gets the current ThemeMode based on the Theme's brightness and system.
  ///
  /// This is a simple fallback assuming you don't store ThemeMode explicitly.
  /// Override this if you manage themeMode in app state.
  ThemeMode get themeMode {
    // For example, if you have stored themeMode in a provider, read from there instead.
    // Here, we just return ThemeMode.system to show isAuto logic.
    return ThemeMode.system;
  }

  /// Returns true if the app is currently in dark mode.
  bool get isDark {
    if (themeMode == ThemeMode.dark) return true;
    if (themeMode == ThemeMode.system) {
      return MediaQuery.of(this).platformBrightness == Brightness.dark;
    }
    return false;
  }

  /// Returns true if the app is currently in light mode.
  bool get isLight {
    if (themeMode == ThemeMode.light) return true;
    if (themeMode == ThemeMode.system) {
      return MediaQuery.of(this).platformBrightness == Brightness.light;
    }
    return false;
  }

  /// Returns true if the app is using system brightness mode.
  bool get isAuto => themeMode == ThemeMode.system;
}
