part of 'package:flutter_addons/flutter_addons.dart';

/// System UI Utilities
class SystemUI {
  /// Set status bar color and brightness.
  static Future<void> setStatusBarColor(
    Color statusBarColor, {
    Color? systemNavigationBarColor,
    Brightness? statusBarBrightness,
    Brightness? statusBarIconBrightness,
    int delayInMilliSeconds = 200,
  }) async {
    await Future.delayed(Duration(milliseconds: delayInMilliSeconds));

    service.SystemChrome.setSystemUIOverlayStyle(
      service.SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        systemNavigationBarColor: systemNavigationBarColor,
        statusBarBrightness: statusBarBrightness,
        statusBarIconBrightness:
            statusBarIconBrightness ??
            (statusBarColor.isDark() ? Brightness.light : Brightness.dark),
      ),
    );
  }

  /// Set dark status bar mode.
  static void setDarkStatusBar() {
    service.SystemChrome.setSystemUIOverlayStyle(
      const service.SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
    );
  }

  /// Set light status bar mode.
  static void setLightStatusBar() {
    service.SystemChrome.setSystemUIOverlayStyle(
      const service.SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.light,
      ),
    );
  }

  /// Show the system status bar.
  static Future<void> showStatusBar() async {
    service.SystemChrome.setEnabledSystemUIMode(
      service.SystemUiMode.manual,
      overlays: service.SystemUiOverlay.values,
    );
  }

  /// Hide the system status bar.
  static Future<void> hideStatusBar() async {
    service.SystemChrome.setEnabledSystemUIMode(
      service.SystemUiMode.manual,
      overlays: [],
    );
  }

  /// Enter full-screen mode.
  static void enterFullScreen() {
    service.SystemChrome.setEnabledSystemUIMode(
      service.SystemUiMode.manual,
      overlays: [],
    );
  }

  /// Exit full-screen mode.
  static void exitFullScreen() {
    service.SystemChrome.setEnabledSystemUIMode(
      service.SystemUiMode.manual,
      overlays: service.SystemUiOverlay.values,
    );
  }

  /// Set device orientation to portrait mode.
  static void setOrientationPortrait() {
    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.portraitDown,
      service.DeviceOrientation.portraitUp,
    ]);
  }

  /// Set device orientation to landscape mode.
  static void setOrientationLandscape() {
    service.SystemChrome.setPreferredOrientations([
      service.DeviceOrientation.landscapeRight,
      service.DeviceOrientation.landscapeLeft,
    ]);
  }
}

/// Custom Scroll Behavior
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  /// Use this function in `MaterialApp` for applying custom scroll behavior.
  static Widget Function(BuildContext, Widget?) apply() {
    return (context, child) =>
        ScrollConfiguration(behavior: CustomScrollBehavior(), child: child!);
  }
}
