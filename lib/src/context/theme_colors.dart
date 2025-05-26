part of 'package:flutter_addons/flutter_addons.dart';

/// [UI Helper Class] Easy design UI
/// Apply on BuildContext
extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
  ColorScheme get kolorScheme => theme.colorScheme;
  TextTheme get typography => theme.textTheme;
}

extension ThemeModeContext on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  bool get isLight => Theme.of(this).brightness == Brightness.light;
}

extension ThemeColors on BuildContext {
  /// Primary brand color, used for buttons, FABs, and active elements.
  Color get primaryColor => Theme.of(this).colorScheme.primary;

  /// Background color for scaffolds, screens, and major surfaces.
  Color get background => Theme.of(this).scaffoldBackgroundColor;

  /// Text and icons color that appear on top of the background.
  Color get forground =>
      Theme.of(this).colorScheme.onPrimary; //IF DARK THEN WHITE ELSE BLACK
  /// Card background color, used for cards and containers.
  Color get cardBackground => Theme.of(this).colorScheme.secondaryContainer;
  Color get surfaceContent => Theme.of(this).colorScheme.onSurface;
  Color get inputBackground => Theme.of(this).colorScheme.surfaceContainerLow;

  /// Secondary brand color, used for accents like chips, toggles, and highlights.
  Color get secondaryButton => Theme.of(this).colorScheme.secondaryFixed;
  // Text and content color inside cards, primary usecase is After title.
  Color get secondaryContent => Theme.of(this).colorScheme.onSurfaceVariant;
  //extras
  /// Border color, used for dividers, input fields, and outlines.
  Color get outline => Theme.of(this).colorScheme.outline;

  /// Border color, used for dividers, input fields, and outlines.
  Color get divider => Theme.of(this).colorScheme.surfaceDim;

  /// Shadow color, used for elevation and floating elements.
  Color get shadow => Theme.of(this).colorScheme.shadow;

  /// Muted text color, used for secondary text, captions, and hints.
  Color get inactive => Theme.of(this).colorScheme.secondaryContainer;
}

/// Easy access TextColors
///
/// Extension on `BuildContext` for getting `ColorScheme` text colors
extension TextColor on BuildContext {
  // High contrast (Black/White)
  Color get titleColor => Theme.of(this).colorScheme.onSurface;
  // Medium contrast (Gray)
  Color get subtitleColor => Theme.of(this).colorScheme.onSurfaceVariant;
  // Same as title for body text
  Color get bodyTextColor => Theme.of(this).colorScheme.onSurface;
  // Low contrast (Lighter gray)
  Color get captionColor => Theme.of(this).colorScheme.outlineVariant;
  // Same as title for body text
  Color get titleInverse => Theme.of(this).colorScheme.onPrimary;
}
