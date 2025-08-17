part of 'package:flutter_addons/flutter_addons.dart';

/// Centralized theme, text, color, and media query access.
/// Initialize once at app root with [ThemeHelper.init(context)].
class ThemeHelper {
  static ThemeHelper? _instance;

  final BuildContext context;
  final ThemeData theme;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final MediaQueryData mediaQuery;

  ThemeHelper._({
    required this.context,
    required this.theme,
    required this.textTheme,
    required this.colorScheme,
    required this.mediaQuery,
  });

  /// Initialize at app root.
  static void init(BuildContext context) {
    _instance = ThemeHelper._(
      context: context,
      theme: Theme.of(context),
      textTheme: Theme.of(context).textTheme,
      colorScheme: Theme.of(context).colorScheme,
      mediaQuery: MediaQuery.of(context),
    );
  }

  /// Access the singleton instance globally.
  static ThemeHelper get instance {
    assert(
      _instance != null,
      'Add on ThemeHelper not initialized! Call ThemeHelper.init(context) in your app root.',
    );
    return _instance!;
  }
}

/// Global design system access point.
/// Easy access `.context`, `.theme`, `.color`, `.textStyle`.
class Ui {
  /// Access current [BuildContext] via ThemeHelper.
  @Deprecated('Will not work')
  static BuildContext get context => ThemeHelper.instance.context;

  /// Access [ThemeData].
  static ThemeData get theme => ThemeHelper.instance.theme;

  /// Access [TextTheme].
  static TextTheme get textStyle => ThemeHelper.instance.textTheme;

  /// Access [ColorScheme].
  static ColorScheme get color => ThemeHelper.instance.colorScheme;

  /// Access [MediaQueryData].
  static MediaQueryData get mediaQuery => ThemeHelper.instance.mediaQuery;

  /// Screen width shortcut.
  static double get width => mediaQuery.size.width;

  /// Screen height shortcut.
  static double get height => mediaQuery.size.height;
}
