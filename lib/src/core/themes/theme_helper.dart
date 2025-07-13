part of 'package:flutter_addons/flutter_addons.dart';

/// A globally available theme helper.
/// Call [ThemeHelper.init] once with a context at your app's root.
/// Then use [ThemeHelper.instance] anywhere without passing context.
class ThemeHelper {
  static ThemeHelper? _instance;

  final ThemeData theme;
  final TextTheme textTheme;
  final ColorScheme colorScheme;
  final MediaQueryData mediaQuery;

  ThemeHelper._({
    required this.theme,
    required this.textTheme,
    required this.colorScheme,
    required this.mediaQuery,
  });

  /// Initialize this once at app root.
  static void init(BuildContext context) {
    _instance = ThemeHelper._(
      theme: Theme.of(context),
      textTheme: Theme.of(context).textTheme,
      colorScheme: Theme.of(context).colorScheme,
      mediaQuery: MediaQuery.of(context),
    );
  }

  /// Access the global ThemeHelper.
  static ThemeHelper get instance {
    assert(
      _instance != null,
      'ThemeHelper not initialized! Call ThemeHelper.init(context) in your app root.',
    );
    return _instance!;
  }
}

/// Global design system access point.
///
/// Provides convenient static access to your app’s theme data,
/// text styles, and color scheme without needing to pass [BuildContext].
///
/// Initialize [ThemeHelper] once at your app's root to ensure this works safely.
///
/// Example:
/// ```dart
/// Container(
///   color: Ui.colors.primary,
///   child: Text(
///     'Hello!',
///     style: Ui.textStyle.titleLarge,
///   ),
/// )
/// ```
class Ui {
  /// Global [ThemeData] instance.
  static final theme = ThemeHelper.instance.theme;

  /// Global [TextTheme] instance.
  static final textStyle = theme.textTheme;

  /// Global [ColorScheme] instance.
  static final color = theme.colorScheme;
}
