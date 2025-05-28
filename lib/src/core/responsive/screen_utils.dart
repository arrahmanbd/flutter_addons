part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class providing global access to the current device's layout
/// properties such as screen dimensions, orientation, and pixel density.

/// Internal utility class for device and screen-related metrics.
///
/// Should be initialized once before use.
class _ScreenTypeResolver {
  static ScreenType resolve({
    required double width,
    required double maxMobileWidth,
    double? maxTabletWidth,
  }) {
    if (width <= maxMobileWidth) return ScreenType.mobile;
    if (maxTabletWidth == null || width <= maxTabletWidth) {
      return ScreenType.tablet;
    }
    return ScreenType.desktop;
  }
}

class _ScreenUtils {
  static late Size _screenSize;
  static late EdgeInsets _padding;
  static late Orientation _orientation;
  static late double _devicePixelRatio;

  static late DeviceType _deviceType;
  static late ScreenType _screenType;

  /// Initializes the device metrics and screen classifications.
  ///
  /// Must be called before accessing any properties.
  static void initialize({
    required MediaQueryData mediaQuery,
    required Orientation orientation,
    required double maxMobileWidth,
    double? maxTabletWidth,
  }) {
    assert(
      mediaQuery.size.width > 0 && mediaQuery.size.height > 0,
      'MediaQuery size must be greater than zero.',
    );
    assert(maxMobileWidth > 0, 'maxMobileWidth must be greater than zero.');
    if (maxTabletWidth != null) {
      assert(
        maxTabletWidth > maxMobileWidth,
        'maxTabletWidth must be greater than maxMobileWidth.',
      );
    }

    _screenSize = mediaQuery.size;
    _padding = mediaQuery.padding;
    _devicePixelRatio = mediaQuery.devicePixelRatio;
    _orientation = orientation;

    _deviceType = _resolveDeviceType();
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

  static DeviceType get deviceType {
    _assertInitialized();
    return _deviceType;
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

  /// Returns radius scaled by percentage of screen width (0-100).
  static double percentRadius(double percent) {
    _assertInitialized();
    assert(
      percent >= 0 && percent <= 100,
      'Percent must be between 0 and 100.',
    );
    // You can choose to scale radius by width or safeWidth here, I use safeWidth:
    return safeWidth * (percent / 100);
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

  static DeviceType _resolveDeviceType() {
    if (kIsWeb) return DeviceType.web;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return DeviceType.android;
      case TargetPlatform.iOS:
        return DeviceType.ios;
      case TargetPlatform.windows:
        return DeviceType.windows;
      case TargetPlatform.macOS:
        return DeviceType.mac;
      case TargetPlatform.linux:
        return DeviceType.linux;
      case TargetPlatform.fuchsia:
        return DeviceType.fuchsia;
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
