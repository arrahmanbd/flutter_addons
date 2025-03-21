part of 'package:flutter_addons/flutter_addons.dart';

/// This is Default Color Palette
/// **Light Theme Color Palette**
class SoulColor extends Kolors {
  @override
  /// Theme mode defining this as a light theme
  Brightness get themeMode => Brightness.light;

  @override
  /// Primary brand color, used for buttons and active elements
  Color get primaryColor => const Color(0xFF007AFF);

  @override
  /// Foreground text and icon color for dark text elements
  Color get forground => const Color(0xFF282828);

  @override
  /// Background color for scaffold and major surfaces
  Color get background => const Color(0xFFF5F5F5);

  @override
  /// Background color for cards and containers
  Color get cardBackground => const Color(0xFFF7F7F7);

  @override
  /// Used as secondary text color for subtitles, labels, and hints
  Color get secondaryContent => const Color(0xFFB1B1B1);

  @override
  /// Background color for input fields
  Color get inputBackground => const Color(0xFFF3F3F3);

  @override
  /// Border color for dividers and outlines
  Color get outlineColor => const Color(0xFFDDDDDD);

  @override
  /// Divider line color for separating content
  Color get dividerColor => const Color(0xFFE0E0E0);

  @override
  /// Shadow color used for elevated elements
  Color get shadowColor => const Color(0x29000000);

  @override
  /// Secondary button background color (e.g., card-like buttons)
  Color get secondaryButton => const Color(0xFFF3F3F3);
}

/// **Dark Theme Color Palette**
class DarkSoul extends Kolors {
  @override
  /// Theme mode defining this as a dark theme
  Brightness get themeMode => Brightness.dark;

  @override
  /// Primary brand color, used for buttons and active elements
  Color get primaryColor => const Color(0xFF0476F0);

  @override
  /// Foreground text and icon color for light text elements
  Color get forground => const Color(0xFFFFFFFF);

  @override
  /// Background color for scaffold and major surfaces
  Color get background => const Color(0xFF121212);

  @override
  /// Background color for cards and containers
  Color get cardBackground => const Color(0xFF181818);

  @override
  /// Used as secondary text color for subtitles, labels, and hints
  Color get secondaryContent => const Color(0xFF9E9E9E);

  @override
  /// Background color for input fields
  Color get inputBackground => const Color(0xFF252525);

  @override
  /// Border color for dividers and outlines
  Color get outlineColor => const Color(0xFF3A3A3A);

  @override
  /// Divider line color for separating content
  Color get dividerColor => const Color(0xFF292929);

  @override
  /// Shadow color used for elevated elements
  Color get shadowColor => const Color(0x29000000);

  @override
  /// Secondary button background color (e.g., card-like buttons)
  Color get secondaryButton => const Color(0xFF1E1E1E);
}
