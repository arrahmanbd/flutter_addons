part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class providing global access to the current device's layout
/// properties such as screen dimensions, orientation, and pixel density.

/// Internal utility class for device and screen-related metrics.
///
/// Should be initialized once before use.

class _ScreenUtils {
  static late Size _screenSize;
  static late EdgeInsets _padding;
  static late Orientation _orientation;
  static late double _devicePixelRatio;

  // ignore: unused_field
  static late OSType _osType;
  static late ScreenType _screenType;

  /// Initializes the device metrics and screen classifications.
  ///
  /// Must be called before accessing any properties.
  static void initialize({
    required MediaQueryData mediaQuery,
    required double maxMobileWidth,
    double? maxTabletWidth,
    BuildContext? context,
  }) {
    Size screenSize = mediaQuery.size;

    // Fallback if MediaQuery size is invalid
    if (screenSize.width == 0 || screenSize.height == 0) {
      if (context != null) {
        try {
          final view = View.of(context);
          screenSize = view.physicalSize / view.devicePixelRatio;
        } catch (e) {
          screenSize = const Size(360, 800); // fallback
        }
      } else {
        try {
          final dispatcher = PlatformDispatcher.instance;
          final primaryView = dispatcher.views.first;
          screenSize = primaryView.physicalSize / primaryView.devicePixelRatio;
        } catch (e) {
          screenSize = const Size(360, 800); // fallback
        }
      }
    }

    // Still fallback if it's zero after view checks
    if (screenSize.width == 0 || screenSize.height == 0) {
      screenSize = const Size(360, 800); // Safe default
    }

    assert(
      screenSize.width > 0 && screenSize.height > 0,
      'Screen size must be greater than zero.',
    );

    assert(maxMobileWidth > 0, 'maxMobileWidth must be greater than zero.');
    if (maxTabletWidth != null) {
      assert(
        maxTabletWidth > maxMobileWidth,
        'maxTabletWidth must be greater than maxMobileWidth.',
      );
    }

    _screenSize = screenSize;
    _padding = mediaQuery.padding;
    _devicePixelRatio = mediaQuery.devicePixelRatio;
    _orientation = mediaQuery.orientation;

    _osType = _resolveDeviceType();
    _screenType = _resolveScreenType(maxMobileWidth, maxTabletWidth);
  }

  static void _assertInitialized() {
    assert(
      _screenSize.width > 0 && _screenSize.height > 0,
      'DeviceScreenUtils not initialized. Call initialize() first.',
    );
  }

  /// Width of the screen in logical pixels.
  static double get width {
    _assertInitialized();
    return _screenSize.width;
  }

  /// Height of the screen in logical pixels.
  static double get height {
    _assertInitialized();
    return _screenSize.height;
  }

  /// Safe width excluding horizontal padding (e.g., notches).
  static double get safeWidth {
    _assertInitialized();
    return width - _padding.horizontal;
  }

  /// Safe height excluding vertical padding (e.g., status bar).
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

  static Orientation get orientation {
    _assertInitialized();
    return _orientation;
  }

  static OSType get osType {
    _assertInitialized();
    return _resolveDeviceType();
  }

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
    return width * (percent.clamp(0, 100) / 100);
  }

  /// Returns height scaled by percentage (0-100).
  static double percentHeight(double percent) {
    _assertInitialized();
    assert(
      percent >= 0 && percent <= 100,
      'Percent must be between 0 and 100.',
    );
    return height * (percent.clamp(0, 100) / 100);
  }

  /// Returns radius scaled by percentage of screen width (0-100).
  static double percentRadius(double percent) {
    _assertInitialized();
    assert(
      percent >= 0 && percent <= 100,
      'Percent must be between 0 and 100.',
    );
    // You can choose to scale radius by width or safeWidth here, I use safeWidth:
    return safeWidth * (percent.clamp(0, 100) / 100);
  }

  /// Returns scaled font size (sp) based on combined height, width, pixel ratio, and aspect ratio.
  /// The formula is: (((ph + pw) + (pixelRatio * aspectRatio)) / 2.08) / 100 * size
  static double percentFontSize(double size) {
    _assertInitialized();
    assert(size > 0, 'Font size must be greater than zero.');
    final scaledValue =
        ((percentHeight(size) + percentWidth(size)) +
            (pixelRatio * aspectRatio)) /
        2.08 /
        100;

    return size * scaledValue;
  }

  static OSType _resolveDeviceType() {
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

  static ScreenType _resolveScreenType(
    double maxMobileWidth,
    double? maxTabletWidth,
  ) {
    final logicalWidth = orientation == Orientation.portrait ? width : height;

    if (logicalWidth <= maxMobileWidth) return ScreenType.mobile;
    if (maxTabletWidth == null || logicalWidth <= maxTabletWidth) {
      return ScreenType.tablet;
    }
    return ScreenType.desktop;
  }
}
