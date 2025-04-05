import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Example of ThemeEngine
class Themer extends ThemeManager {
  /// Define the light and dark themes in `Themer`.
  @override
  final ThemeData lightTheme = ThemeMaker.makeTheme(LightSoul());

  @override
  final ThemeData darkTheme = ThemeMaker.makeTheme(DarkSoul());

  /// Implement theme updating logic (this will be triggered when the theme changes).
  @override
  void onUpdateTheme() {
    // This method is called when the theme is updated.
    // You can add custom logic here if needed.
    // For example, you might want to save the theme preference to shared preferences
    // or notify other parts of your app about the theme change.
    // For demonstration, we will just print the current theme mode.
    log(
      "Current theme mode: ${themeMode == ThemeMode.dark ? 'Dark' : 'Light'}",
    );
  }
}

final themeProvider = ChangeNotifierProvider<Themer>((ref) {
  return Themer();
});
