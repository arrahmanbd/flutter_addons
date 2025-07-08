part of 'package:flutter_addons/flutter_addons.dart';

/// A design scaling utility to adapt your UI to different screen sizes.
///
/// Call [_DesignUtils.instance.init] once, preferably in your root widget tree.
class _DesignUtils {
  static final _DesignUtils _instance = _DesignUtils._internal();

  factory _DesignUtils() => _instance;
  static _DesignUtils get instance => _instance;

  _DesignUtils._internal();

  late double _designWidth;
  late double _designHeight;

  late double _screenWidth;
  late double _screenHeight;

  late double _scaleWidth;
  late double _scaleHeight;

  bool _initialized = false;

  /// Initialize the scaling factors with a reference design frame.
  ///
  /// Example: `DesignUtils.instance.init(designWidth: 375, designHeight: 812, mediaQuery: MediaQuery.of(context))`
  void init({
    required double designWidth,
    required double designHeight,
    required MediaQueryData mediaQuery,
    bool isLoggingEnabled = false,
  }) {
    assert(
      designWidth > 0 && designHeight > 0,
      'Design size must be greater than 0.',
    );

    _designWidth = designWidth;
    _designHeight = designHeight;

    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;

    _scaleWidth = max(_screenWidth / _designWidth, 0.0001);
    _scaleHeight = max(_screenHeight / _designHeight, 0.0001);

    _initialized = true;

    if (isLoggingEnabled) {
      _LogUtility.logDesignUtilsInit(
        designWidth: _designWidth,
        designHeight: _designHeight,
        screenWidth: _screenWidth,
        screenHeight: _screenHeight,
        scaleWidth: _scaleWidth,
        scaleHeight: _scaleHeight,
        mode: 'Design',
      );
      // debugPrint(
      //   '[DesignUtils] Initialized with:\n'
      //   'Design: $_designWidth x $_designHeight\n'
      //   'Screen: $_screenWidth x $_screenHeight\n'
      //   'Scale Width: $_scaleWidth\n'
      //   'Scale Height: $_scaleHeight',
      // );
    }
  }

  void _assertInitialized() {
    assert(
      _initialized,
      '[DesignUtils] not initialized. Call init() before using scaling methods.',
    );
  }

  /// Scale width based on design width and current screen width.
  double scaleWidth(num width) {
    _assertInitialized();
    if (width < 0) {
      throw RangeError('Width must be non-negative.');
    }
    return width.toDouble() * _scaleWidth;
  }

  /// Scale height based on design height and current screen height.
  double scaleHeight(num height) {
    _assertInitialized();
    if (height < 0) {
      throw RangeError('Height must be non-negative.');
    }
    return height.toDouble() * _scaleHeight;
  }

  /// Scale font size using the average scale and clamp within optional bounds.
  double scaleFont(num size, {double minScale = 0.9, double maxScale = 1.2}) {
    _assertInitialized();
    if (size < 0) {
      throw RangeError('Font size must be non-negative.');
    }
    final averageScale = (_scaleWidth + _scaleHeight) / 2;
    final scale = averageScale.clamp(minScale, maxScale);
    return size.toDouble() * scale;
  }

  /// Scale radius using the average scale and clamp within optional bounds.
  double scaleRadius(
    num radius, {
    double minScale = 0.9,
    double maxScale = 1.2,
  }) {
    _assertInitialized();
    if (radius < 0) {
      throw RangeError('Radius must be non-negative.');
    }
    final averageScale = (_scaleWidth + _scaleHeight) / 2;
    final scale = averageScale.clamp(minScale, maxScale);
    return radius.toDouble() * scale;
  }

  /// Exposed for debugging/testing.
  double get scaleWidthFactor {
    _assertInitialized();
    return _scaleWidth;
  }

  double get scaleHeightFactor {
    _assertInitialized();
    return _scaleHeight;
  }
}
