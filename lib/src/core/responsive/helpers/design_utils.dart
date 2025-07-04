part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class for responsive UI scaling based on a design frame (e.g., Figma/AdobeXD).

class _DesignUtils {
  static _DesignUtils? _instance;

  late final double _designWidth;
  late final double _designHeight;

  late final double _screenWidth;
  late final double _screenHeight;

  late final double _scaleWidth;
  late final double _scaleHeight;

  bool _initialized = false;

  _DesignUtils._internal();

  /// Singleton instance accessor
  static _DesignUtils get instance => _instance ??= _DesignUtils._internal();

  /// Initialize with design dimensions and current screen info
  void init({
    required double designWidth,
    required double designHeight,
    required MediaQueryData mediaQuery,
    bool isLoggingEnabled = false,
  }) {
    assert(
      designWidth > 0 && designHeight > 0,
      'Design width and height must be greater than zero.',
    );

    _designWidth = designWidth;
    _designHeight = designHeight;

    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;

    // Use max with small epsilon to avoid division by zero or zero scale
    _scaleWidth = max(_screenWidth / _designWidth, 0.0001);
    _scaleHeight = max(_screenHeight / _designHeight, 0.0001);

    _initialized = true;

    if (isLoggingEnabled) {
      _LogUtiity.logDesignUtilsInit(
        designWidth: designWidth,
        designHeight: designHeight,
        screenWidth: _screenWidth,
        screenHeight: _screenHeight,
        scaleWidth: _scaleWidth,
        scaleHeight: _scaleHeight,
      );
    }
  }

  void _assertInitialized() {
    if (!_initialized) {
      throw FlutterError(
        '[DesignUtils] is not initialized. Please call init() before using it.',
      );
    }
  }

  /// Scale width based on design width and actual screen width
  double setWidth(num width) {
    _assertInitialized();
    if (width < 0) throw ArgumentError('Width must be non-negative.');
    return width * _scaleWidth;
  }

  /// Scale height based on design height and actual screen height
  double setHeight(num height) {
    _assertInitialized();
    if (height < 0) throw ArgumentError('Height must be non-negative.');
    return height * _scaleHeight;
  }

  /// Scale font size using average scale of width and height and clamp for min/max limits
  double setFont(num size, {double minScale = 0.9, double maxScale = 1.2}) {
    _assertInitialized();
    if (size < 0) throw ArgumentError('Font size must be non-negative.');

    final averageScale = (_scaleWidth + _scaleHeight) / 2;
    final scale = averageScale.clamp(minScale, maxScale);

    return size * scale;
  }

  /// Scale radius using average scale of width and height and clamp for min/max limits
  double setRadius(num radius, {double minScale = 0.9, double maxScale = 1.2}) {
    _assertInitialized();
    if (radius < 0) throw ArgumentError('Radius must be non-negative.');

    final averageScale = (_scaleWidth + _scaleHeight) / 2;
    final scale = averageScale.clamp(minScale, maxScale);

    return radius * scale;
  }
}
