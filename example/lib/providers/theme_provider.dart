import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Example of ThemeEngine
final lightTheme = ThemePainter(AuroraLight());
final darkTheme = ThemePainter(DarkSoul());

class ThemeNotifier extends StateNotifier<ThemeManager> {
  ThemeNotifier()
    : super(ThemeManager(theme: lightTheme, darkTheme: darkTheme));

  void toggleTheme() {
    state = state.copyWith(
      mode:
          state.mode == ThemeMode.light || state.mode == ThemeMode.system
              ? ThemeMode.dark
              : ThemeMode.light,
    );
  }
}

final themeProvider = StateNotifierProvider<ThemeNotifier, ThemeManager>((ref) {
  return ThemeNotifier();
});
