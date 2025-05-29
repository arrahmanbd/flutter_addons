import 'package:example_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_typo.dart';

class Themer extends ThemeManager {
  static const _themeKey = 'selected_theme';

  Themer() {
    _loadThemeFromPrefs(); // Load theme on initialization
  }

  @override
  ThemeData get lightTheme =>
      ThemeMaker.makeTheme(AppLightColors(), typography: AppFonts());

  @override
  ThemeData get darkTheme =>
      ThemeMaker.makeTheme(AppDarkColors(), typography: AppFonts());

  /// Save the theme mode when updated
  @override
  void onUpdateTheme() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, themeMode == ThemeMode.dark);

    debug(
      "Current theme mode: ${themeMode == ThemeMode.dark ? 'Dark' : 'Light'}",
    );
  }

  /// Load theme from shared preferences
  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final isDark = prefs.getBool(_themeKey) ?? false;
    setThemeMode(isDark ? ThemeMode.dark : ThemeMode.light);
  }

  /// Toggle between light and dark
  void toggle() {
    toggleTheme(); // This will also trigger onUpdateTheme
  }
}

final themeProvider = ChangeNotifierProvider<Themer>((ref) {
  return Themer();
});
