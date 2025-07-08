part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class providing global access to the current device's layout
/// properties such as screen dimensions, orientation, and pixel density.
/// Utility for resolving screen size, safe area, OS type, and screen type.
///
/// Call [initialize] before using any other property.
class _ScreenUtils {
  static late Size _screenSize;
  static late EdgeInsets _padding;
  static late Orientation _orientation;
  static late double _devicePixelRatio;

  static late OSType _osType;
  static late ScreenType _screenType;

  /// Initializes device metrics and screen classification.
  ///
  /// Should be called in a widget with valid [MediaQuery].
  static void initialize({
    required MediaQueryData mediaQuery,
    BuildContext? context,
  }) {
    Size screenSize = mediaQuery.size;

    // Fallback if MediaQuery is invalid
    if (screenSize.isEmpty) {
      screenSize = _fallbackScreenSize(context);
    }

    _screenSize = screenSize;
    _padding = mediaQuery.padding;
    _devicePixelRatio = mediaQuery.devicePixelRatio;
    _orientation = mediaQuery.orientation;

    _osType = _resolveOSType();
    _screenType = _resolveScreenType(screenSize.width);
  }

  /// Returns a safe fallback size using [View] or [PlatformDispatcher].
  static Size _fallbackScreenSize(BuildContext? context) {
    try {
      if (context != null) {
        final view = View.of(context);
        return view.physicalSize / view.devicePixelRatio;
      } else {
        final dispatcher = PlatformDispatcher.instance;
        final primaryView = dispatcher.views.first;
        return primaryView.physicalSize / primaryView.devicePixelRatio;
      }
    } catch (_) {
      return const Size(360, 800);
    }
  }

  static void _assertInitialized() {
    assert(
      _screenSize.width > 0 && _screenSize.height > 0,
      'ScreenUtils not initialized. Call initialize() first.',
    );
  }

  /// Screen width in logical pixels.
  static double get width {
    _assertInitialized();
    return _screenSize.width;
  }

  /// Screen height in logical pixels.
  static double get height {
    _assertInitialized();
    return _screenSize.height;
  }

  /// Safe width excluding horizontal padding.
  static double get safeWidth {
    _assertInitialized();
    return width - _padding.horizontal;
  }

  /// Safe height excluding vertical padding.
  static double get safeHeight {
    _assertInitialized();
    return height - _padding.vertical;
  }

  /// Aspect ratio (width / height).
  static double get aspectRatio {
    _assertInitialized();
    return width / height;
  }

  /// Physical pixel density.
  static double get pixelRatio {
    _assertInitialized();
    return _devicePixelRatio;
  }

  /// Device orientation.
  static Orientation get orientation {
    _assertInitialized();
    return _orientation;
  }

  /// Operating system type.
  static OSType get osType {
    _assertInitialized();
    return _osType;
  }

  /// Screen type: mobile, tablet, or desktop.
  static ScreenType get screenType {
    _assertInitialized();
    return _screenType;
  }

  /// Returns width scaled by percentage (0-100).
  static double percentWidth(double percent) {
    _assertInitialized();
    assert(
      percent >= 0 && percent <= 100,
      'Percent must be between 0 and 100.',
    );
    return width * (percent / 100);
  }

  /// Returns height scaled by percentage (0-100).
  static double percentHeight(double percent) {
    _assertInitialized();
    assert(
      percent >= 0 && percent <= 100,
      'Percent must be between 0 and 100.',
    );
    return height * (percent / 100);
  }

  /// Returns radius scaled by percentage of safe width.
  static double percentRadius(double percent) {
    _assertInitialized();
    assert(
      percent >= 0 && percent <= 100,
      'Percent must be between 0 and 100.',
    );
    return safeWidth * (percent / 100);
  }

  /// Returns scaled font size based on screen size and density.
  static double percentFontSize(double size) {
    _assertInitialized();
    assert(size > 0, 'Font size must be greater than zero.');
    final scaled =
        ((percentHeight(size) + percentWidth(size)) +
            (pixelRatio * aspectRatio)) /
        2.08 /
        100;
    return size * scaled;
  }

  /// Determines the current OS.
  static OSType _resolveOSType() {
    if (kIsWeb) return OSType.web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return OSType.android;
      case TargetPlatform.iOS:
        return OSType.ios;
      case TargetPlatform.windows:
        return OSType.windows;
      case TargetPlatform.macOS:
        return OSType.mac;
      case TargetPlatform.linux:
        return OSType.linux;
      case TargetPlatform.fuchsia:
        return OSType.fuchsia;
    }
  }

  /// Determines screen type using your `Breakpoints`.
  static ScreenType _resolveScreenType(double logicalWidth) {
    if (logicalWidth <= Breakpoints.xs) return ScreenType.mobile;
    if (logicalWidth <= Breakpoints.sm) return ScreenType.tablet;
    return ScreenType.desktop;
  }
}

/// Enum for OS type.
enum OSType { android, ios, web, windows, mac, linux, fuchsia }

/// Enum for screen type.
enum ScreenType { mobile, tablet, desktop }
