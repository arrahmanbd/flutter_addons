part of 'package:flutter_addons/flutter_addons.dart';

/// Extension for converting units and handling responsive sizing based on device dimensions.
extension ResponsiveSpacing on num {
  /// Converts the value to centimeters (cm).
  double get cm => this * 37.8;

  /// Converts the value to millimeters (mm).
  double get mm => this * 3.78;

  /// Converts the value to quarter-millimeters (Q).
  double get Q => this * 0.945;

  /// Converts the value to inches (in).
  double get inches => this * 96;

  /// Converts the value to picas (pc), where 1 pica = 1/6 inch.
  double get pc => this * 16;

  /// Converts the value to points (pt), where 1 pt = 1/72 inch.
  double get pt => this * inches / 72;

  /// Converts the value to pixels (px). Default unit.
  double get px => toDouble();

  /// Converts the value to a percentage of the available height after `SafeArea`.
  double get sh => this * _ScreenUtils.safeHeight / 100;

  /// Converts the value to a percentage of the available width after `SafeArea`.
  double get sw => this * _ScreenUtils.safeWidth / 100;

  /// Converts the value to scalable pixels (spa) with an alternate formula.
  double get spa =>
      this * (((ph + pw) + (240 * _ScreenUtils.aspectRatio)) / 2.08) / 100;

  /// Converts the value to density-independent pixels (dp) for consistent sizing across devices.
  double get dp => this * (pw * 160) / _ScreenUtils.pixelRatio;

  /// Converts the value to a percentage of the viewport's smaller dimension (height/width).
  double get vmin => this * min(_ScreenUtils.height, _ScreenUtils.width) / 100;

  /// Converts the value to a percentage of the viewport's larger dimension (height/width).
  double get vmax => this * max(_ScreenUtils.height, _ScreenUtils.width) / 100;
}
