part of 'package:flutter_addons/flutter_addons.dart';

/// Base class for managing theme logic, exposing core functionality.
/// This class is designed to be extended by the user.
/// It provides methods to set and toggle themes, as well as to refresh the theme based on system settings.
/// It also includes an abstract method for updating the theme, which must be implemented by the user.
abstract class ThemeManager extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.system;
  late ThemeData _currentTheme;

  /// Define the light and dark themes (to be implemented by user).
  abstract final ThemeData lightTheme;
  abstract final ThemeData darkTheme;

  /// Getter for theme mode (light, dark, or system).
  ThemeMode get themeMode => _themeMode;

  /// Getter for the current theme data.
  ThemeData get themeData => _currentTheme;

  /// Getter to check if the current theme is dark.
  bool get isDarkMode => _themeMode == ThemeMode.dark ||
      (_themeMode == ThemeMode.system &&
          WidgetsBinding.instance.platformDispatcher.platformBrightness ==
              Brightness.dark);

  /// Constructor initializes theme based on system settings.
  ThemeManager() {
    _updateTheme();
  }

  /// Method to set the theme mode (light, dark, system).
  void setThemeMode(ThemeMode mode) {
    if (_themeMode == mode) return;
    _themeMode = mode;
    _updateTheme();
  }

  /// Refresh theme based on system settings.
  void refreshTheme() {
    _updateTheme();
  }

  /// Abstract method to be implemented by user for updating the theme.
  void onUpdateTheme();

  /// Toggle between light and dark mode.
  void toggleTheme() {
    setThemeMode(_themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light);
  }

  /// Cycles through Light → Dark → System.
  void toggleThemeMode() {
    setThemeMode(
      _themeMode == ThemeMode.light ? ThemeMode.dark
      : _themeMode == ThemeMode.dark ? ThemeMode.system
      : ThemeMode.light,
    );
  }

  /// Method to update the theme dynamically based on selected mode.
  void _updateTheme() {
    switch (_themeMode) {
      case ThemeMode.light:
        _currentTheme = lightTheme;
        break;
      case ThemeMode.dark:
        _currentTheme = darkTheme;
        break;
      case ThemeMode.system:
        final isDarkMode =
            WidgetsBinding.instance.platformDispatcher.platformBrightness ==
            Brightness.dark;
        _currentTheme = isDarkMode ? darkTheme : lightTheme;
        break;
    }

    // Notify listeners and call user-defined update method
    notifyListeners();
    onUpdateTheme();
  }
}
