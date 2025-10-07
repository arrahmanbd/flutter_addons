part of 'package:flutter_addons/flutter_addons.dart';

/// Centralized theme, text, color, and media query access.
/// Initialize once at app root with [ThemeHelper.init(context)].

class ThemeHelper extends ChangeNotifier {
  static ThemeHelper? _instance;

  /// Access the singleton instance.
  static ThemeHelper get instance {
    assert(
      _instance != null,
      'ThemeHelper not initialized! Call ThemeHelper.init(context) first.',
    );
    return _instance!;
  }

  late BuildContext _context;

  ThemeHelper._(BuildContext context) {
    _context = context;
  }

  /// Initialize at app root.
  static void init(BuildContext context) {
    _instance ??= ThemeHelper._(context);
  }

  /// Call this whenever the app’s theme or MediaQuery changes
  /// (e.g. in `MaterialApp.builder` or `didChangeDependencies`).
  void update(BuildContext context) {
    _context = context;
    notifyListeners();
  }

  /// Current [BuildContext].
  BuildContext get context => _context;

  /// Current [ThemeData].
  ThemeData get theme => Theme.of(_context);

  /// Current [TextTheme].
  TextTheme get textTheme => theme.textTheme;

  /// Current [ColorScheme].
  ColorScheme get colorScheme => theme.colorScheme;

  /// Current [MediaQueryData].
  MediaQueryData get mediaQuery => MediaQuery.of(_context);

  /// Convenience getters.
  double get width => mediaQuery.size.width;
  double get height => mediaQuery.size.height;

  /// Is dark mode active.
  bool get isDark => theme.brightness == Brightness.dark;
}

/// Global design system access point.
///
/// Usage:
/// ```dart
/// final primary = Ui.color.primary;
/// final isDark = Ui.isDark;
/// ```
class Ui {
  static ThemeData get theme => ThemeHelper.instance.theme;
  static TextTheme get textStyle => ThemeHelper.instance.textTheme;
  static ColorScheme get color => ThemeHelper.instance.colorScheme;
  static MediaQueryData get mediaQuery => ThemeHelper.instance.mediaQuery;
  static double get width => ThemeHelper.instance.width;
  static double get height => ThemeHelper.instance.height;
  static bool get isDark => ThemeHelper.instance.isDark;
}


// Easy-to-use extensions
extension NotificationExtension on BuildContext {
  void showSuccessToast(String message, {String? title, type=NotificationType.info, ToastPosition position = ToastPosition.bottom}) {
    NotificationService().showToast(
      context: this,
      message: message,
      title: title,
      type: type,
      position: position
    );
  }



  void showInfoSnackbar(String title, String message) {
    NotificationService().showSnackbar(
      context: this,
      title: title,
      message: message,
      type: NotificationType.info,
    );
  }

  Future<bool> showConfirmationDialog(String title, String message) {
    return NotificationService().showConfirmation(
      context: this,
      title: title,
      message: message,
    );
  }
}