part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on `BuildContext` for responsive design.
/// This extension provides methods to get screen dimensions, pixel ratio,
/// and orientation. It also includes boolean properties to check the screen size
/// categories (extra small, small, medium, large, extra large).
/// This is useful for creating responsive UIs that adapt to different screen sizes
/// and orientations.

extension ResponsiveExtension on BuildContext {
  /// Get screen width
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Get screen height
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Get pixel ratio
  double get pixelRatio => MediaQuery.of(this).devicePixelRatio;

  /// Get shortest side (useful for responsive UI)
  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  /// Check if the device is in portrait mode
  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  /// Check if the device is in landscape mode
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Extra small screens (phones, less than 576px)
  bool get isXs => screenWidth < 576;

  /// Small screens (phones, 576px and up)
  bool get isSm => screenWidth >= 576 && screenWidth < 768;

  /// Medium screens (tablets, 768px and up)
  bool get isMd => screenWidth >= 768 && screenWidth < 992;

  /// Large screens (desktops, 992px and up)
  bool get isLg => screenWidth >= 992 && screenWidth < 1200;

  /// Extra large screens (large desktops, 1200px and up)
  bool get isXl => screenWidth >= 1200;
}
