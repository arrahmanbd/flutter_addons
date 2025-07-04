part of 'package:flutter_addons/flutter_addons.dart';

class Frame {
  final double w;
  final double h;
  const Frame({required this.w, required this.h});

  /// Returns a new Frame with width and height swapped
  Frame get reversed => Frame(w: h, h: w);

  @override
  String toString() => 'Frame(width: $w, height: $h)';

  /// Common design frame presets representing popular device sizes or breakpoints
  static const Frame mobileSmall = Frame(
    w: 320,
    h: 568,
  ); // iPhone SE, small mobiles
  static const Frame mobileMedium = Frame(
    w: 375,
    h: 667,
  ); // iPhone 8, typical mobiles
  static const Frame mobileLarge = Frame(
    w: 414,
    h: 896,
  ); // iPhone 11 Pro Max, large mobiles

  static const Frame tabletPortrait = Frame(w: 768, h: 1024); // iPad portrait
  static const Frame tabletLandscape = Frame(w: 1024, h: 768); // iPad landscape

  static const Frame desktopSmall = Frame(
    w: 1366,
    h: 768,
  ); // Typical small desktop window
  static const Frame desktopMedium = Frame(w: 1440, h: 900); // Medium desktop
  static const Frame desktopLarge = Frame(w: 1920, h: 1080); // Full HD desktop

  /// You can add custom frames as per your app’s target devices or design specs.
}
