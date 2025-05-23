part of 'package:flutter_addons/flutter_addons.dart';

/// Defines the operating platform the app is currently running on.
enum DeviceType { android, ios, fuchsia, web, windows, mac, linux }

/// Defines the general screen size category for the current device.
enum ScreenType { mobile, tablet, desktop }

/// A utility class providing global access to the current device's
/// layout properties such as screen dimensions, orientation, and pixel density.
class Device {
  // Core layout constraints
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late ScreenType screenType;

  // Screen dimensions
  static late double width;
  static late double height;
  static late double safeWidth;
  static late double safeHeight;

  // Display characteristics
  static late double aspectRatio;
  static late double pixelRatio;

  /// Initializes the device's layout data using the provided context and constraints.
  ///
  /// - [context]: The build context to extract media properties.
  /// - [constraints]: The current layout constraints.
  /// - [currentOrientation]: The screen's orientation.
  /// - [maxMobileWidth]: The threshold width for mobile screens.
  /// - [maxTabletWidth]: The optional threshold width for tablets (if not provided, only mobile detection applies).
  static void setScreenSize(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
    double maxMobileWidth, [
    double? maxTabletWidth,
  ]) {
    // Store layout and orientation data
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Screen dimensions
    width = constraints.maxWidth;
    height = constraints.maxHeight;

    // Calculate SafeArea-aware dimensions
    final padding = MediaQuery.of(context).viewPadding;
    safeWidth = width - padding.horizontal;
    safeHeight = height - padding.vertical;

    // Display properties
    aspectRatio = width / height;
    pixelRatio = MediaQuery.of(context).devicePixelRatio;

    // Determine platform type
    deviceType = _resolveDeviceType();

    // Determine screen type
    screenType = _resolveScreenType(maxMobileWidth, maxTabletWidth);
  }

  /// Maps the current platform to the corresponding [DeviceType].
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

  /// Determines the [ScreenType] based on current orientation and thresholds.
  static ScreenType _resolveScreenType(
    double maxMobileWidth,
    double? maxTabletWidth,
  ) {
    final primaryAxis = orientation == Orientation.portrait ? width : height;

    if (primaryAxis <= maxMobileWidth) return ScreenType.mobile;

    if (maxTabletWidth == null || primaryAxis <= maxTabletWidth) {
      return ScreenType.tablet;
    }

    return ScreenType.desktop;
  }
}

/// Conversion methods for various units based on the device's screen size and pixel density.
///
/// **cm()** - The respective value in centimeters.
///
/// **mm()** - The respective value in millimeters.
///
/// **Q()** - The respective value in quarter-millimeters.
///
/// **inches()** - The respective value in inches.
///
/// **pc()** - The respective value in picas (1/6th of 1 inch).
///
/// **pt()** - The respective value in points (1/72th of 1 inch).
///
/// **px()** - The respective value in pixels.
