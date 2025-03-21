part of 'package:flutter_addons/flutter_addons.dart';

@immutable
class ThemeManager {
  /// The current theme mode (light, dark, or system default).
   final ThemeMode mode;

  /// The primary theme palette.
  final ThemePainter theme;

  /// The dark theme palette.
  final ThemePainter darkTheme;

  /// Constructor with runtime initialization for `darkTheme`.
  ThemeManager({
    required this.theme,
    this.mode = ThemeMode.system,
    ThemePainter? darkTheme, // No default value here
  }) : darkTheme = darkTheme ?? ThemePainter(DarkSoul()); 

  /// Creates a modified copy of this ThemeManager instance.
  ThemeManager copyWith({ThemeMode? mode, ThemePainter? theme, ThemePainter? darkTheme}) {
    return ThemeManager(
      mode: mode ?? this.mode,
      theme: theme ?? this.theme,
      darkTheme: darkTheme ?? this.darkTheme,
    );
  }

  /// Returns the active theme based on the current mode.
  ThemePainter get activeTheme {
    return mode == ThemeMode.dark ? darkTheme : darkTheme;
  }
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ThemeManager &&
          other.mode == mode &&
          other.theme == theme &&
          other.darkTheme == darkTheme);

  @override
  int get hashCode => mode.hashCode ^ theme.hashCode ^ darkTheme.hashCode;
}