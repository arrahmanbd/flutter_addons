part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class providing global access to the current device's
/// layout properties such as screen dimensions, orientation, and pixel density.
class DeviceScreenUtils {
  static late BoxConstraints boxConstraints;
  static late Orientation orientation;
  static late DeviceType deviceType;
  static late ScreenType screenType;

  static late double width;
  static late double height;
  static late double safeWidth;
  static late double safeHeight;

  static late double aspectRatio;
  static late double pixelRatio;

  /// Initializes the device's layout data using constraints, orientation, and mediaQuery.
  static void initialize(
    BoxConstraints constraints,
    Orientation orientation,
    MediaQueryData mediaQuery,
    double maxMobileWidth, [
    double? maxTabletWidth,
  ]) {
    boxConstraints = constraints;
    DeviceScreenUtils.orientation = orientation;

    width = constraints.maxWidth;
    height = constraints.maxHeight;

    final padding = mediaQuery.viewPadding;
    safeWidth = width - padding.horizontal;
    safeHeight = height - padding.vertical;

    aspectRatio = width / height;
    pixelRatio = mediaQuery.devicePixelRatio;

    deviceType = _resolveDeviceType();

    screenType = _resolveScreenType(maxMobileWidth, maxTabletWidth);
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
    final primaryAxis = orientation == Orientation.portrait ? width : height;

    if (primaryAxis <= maxMobileWidth) return ScreenType.mobile;

    if (maxTabletWidth == null || primaryAxis <= maxTabletWidth) {
      return ScreenType.tablet;
    }

    return ScreenType.desktop;
  }
}
