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

  late Orientation _orientation;
  late Brightness _brightness;
  late TextScaler _textScaler;
  late double _devicePixelRatio;
  late EdgeInsets _padding;
  late EdgeInsets _viewInsets;
  late bool _highContrast;

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
    _shortestSide = _screenWidth < _screenHeight ? _screenWidth : _screenHeight;

    _designWidth = designWidth;
    _designHeight = designHeight;

    _orientation = mq.orientation;
    _brightness = mq.platformBrightness; 
    _textScaler = mq.textScaler;
    _devicePixelRatio = mq.devicePixelRatio;
    _padding = mq.padding;
    _viewInsets = mq.viewInsets;
    _highContrast = mq.highContrast;

    _initialized = true;
  }

  void _assertInitialized() {
    assert(_initialized, 'SmartUnitUtils not initialized. Call init() first.');
  }

  double scale(num value) {
    _assertInitialized();
    return value * _shortestSide / _designWidth;
  }

  double scaleText(num fontSize) {
    _assertInitialized();
    return _textScaler.scale(scale(fontSize));
  }

  double scaleX(num value) {
    _assertInitialized();
    return value * _screenWidth / _designWidth;
  }

  double scaleY(num value) {
    _assertInitialized();
    return value * _screenHeight / _designHeight;
  }

  // Additional getters

  Brightness get brightness {
    _assertInitialized();
    return _brightness;
  }

  bool get isDarkMode {
    _assertInitialized();
    return _brightness == Brightness.dark;
  }

  Orientation get orientation {
    _assertInitialized();
    return _orientation;
  }

  double get devicePixelRatio {
    _assertInitialized();
    return _devicePixelRatio;
  }

  EdgeInsets get padding {
    _assertInitialized();
    return _padding;
  }

  EdgeInsets get viewInsets {
    _assertInitialized();
    return _viewInsets;
  }

  TextScaler get textScaler {
    _assertInitialized();
    return _textScaler;
  }

  bool get highContrast {
    _assertInitialized();
    return _highContrast;
  }
}
