part of 'package:flutter_addons/flutter_addons.dart';

/// A singleton utility for responsive sizing based on device dimensions,
/// respecting orientation and design reference sizes.
///
/// Initialize once with the design dimensions and context.
/// Provides scaling on X, Y, and shortest axis, plus scaled font size.
class _SmartUnitUtils {
  _SmartUnitUtils._();

  static final _SmartUnitUtils instance = _SmartUnitUtils._();

  late double _screenWidth;
  late double _screenHeight;
  late double _shortestSide;

  late double _designWidth;
  late double _designHeight;

  bool _initialized = false;

  /// Initializes the utility with the current device context and design size.
  ///
  /// [designWidth] and [designHeight] should match your design mockup dimensions.
  void init({
    required BuildContext context,
    double designWidth = 375,
    double designHeight = 812,
  }) {
    final mq = MediaQuery.of(context);

    _screenWidth = mq.size.width;
    _screenHeight = mq.size.height;

    // Shortest side dynamically considers orientation.
    _shortestSide = _screenWidth < _screenHeight ? _screenWidth : _screenHeight;

    _designWidth = designWidth;
    _designHeight = designHeight;

    _initialized = true;
  }

  void _assertInitialized() {
    assert(_initialized, 'SmartUnitUtils not initialized. Call init() first.');
  }

  /// Scales a value based on the shortest side of the screen
  /// relative to the design width.
  double scale(num value) {
    _assertInitialized();
    return value * _shortestSide / _designWidth;
  }

  /// Scales font size considering device text scaling.
  ///
  /// [textScaleFactor] defaults to 1.0 (no additional scaling).
  double sp(num fontSize, {double textScaleFactor = 1.0}) {
    _assertInitialized();
    return scale(fontSize) * textScaleFactor;
  }

  /// Scales horizontally relative to design width.
  double scaleX(num value) {
    _assertInitialized();
    return value * _screenWidth / _designWidth;
  }

  /// Scales vertically relative to design height.
  double scaleY(num value) {
    _assertInitialized();
    return value * _screenHeight / _designHeight;
  }
}
