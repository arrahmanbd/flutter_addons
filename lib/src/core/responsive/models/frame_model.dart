part of 'package:flutter_addons/flutter_addons.dart';

class DesignFrame {
  final double width;
  final double height;
  const DesignFrame({required this.width, required this.height});

  /// Returns a new Frame with width and height swapped
  DesignFrame get reversed => DesignFrame(width: height, height: width);

  @override
  String toString() => 'Frame(width: $width, height: $height)';

  /// Common design frame presets representing popular device sizes or breakpoints
  static const DesignFrame mobileSmall = DesignFrame(
    width: 320,
    height: 568,
  ); // iPhone SE, small mobiles
  static const DesignFrame mobileMedium = DesignFrame(
    width: 375,
    height: 667,
  ); // iPhone 8, typical mobiles
  static const DesignFrame mobileLarge = DesignFrame(
    width: 414,
    height: 896,
  ); // iPhone 11 Pro Max, large mobiles

  static const DesignFrame tabletPortrait = DesignFrame(
    width: 768,
    height: 1024,
  ); // iPad portrait
  static const DesignFrame tabletLandscape = DesignFrame(
    width: 1024,
    height: 768,
  ); // iPad landscape

  static const DesignFrame desktopSmall = DesignFrame(
    width: 1366,
    height: 768,
  ); // Typical small desktop window
  static const DesignFrame desktopMedium = DesignFrame(
    width: 1440,
    height: 900,
  ); // Medium desktop
  static const DesignFrame desktopLarge = DesignFrame(
    width: 1920,
    height: 1080,
  ); // Full HD desktop

  /// You can add custom frames as per your app’s target devices or design specs.
}
