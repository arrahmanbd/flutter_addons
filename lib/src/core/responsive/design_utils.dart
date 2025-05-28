part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class for responsive UI scaling based on a design frame (e.g., Figma/AdobeXD).
///

class _DesignUtils {
  static _DesignUtils? _instance;

  late double _designWidth;
  late double _designHeight;

  late double _screenWidth;
  late double _screenHeight;

  late double _scaleWidth;
  late double _scaleHeight;

  _DesignUtils._internal();

  static _DesignUtils get instance {
    return _instance ??= _DesignUtils._internal();
  }

  void init({
    required double designWidth,
    required double designHeight,
    required MediaQueryData mediaQuery,
  }) {
    assert(designWidth > 0 && designHeight > 0, 'Design size must be greater than 0.');

    _designWidth = designWidth;
    _designHeight = designHeight;

    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;

    _scaleWidth = _screenWidth / _designWidth;
    _scaleHeight = _screenHeight / _designHeight;
  }

  void _assertInitialized() {
    if (_scaleWidth == 0 || _scaleHeight == 0) {
      throw FlutterError('_DesignUtils is not initialized. Call init() first.');
    }
  }

  double setWidth(num width) {
    _assertInitialized();
    if (width < 0) throw ArgumentError('Width must be positive.');
    return width * _scaleWidth;
  }

  double setHeight(num height) {
    _assertInitialized();
    if (height < 0) throw ArgumentError('Height must be positive.');
    return height * _scaleHeight;
  }

  double setFont(num size) {
    _assertInitialized();
    if (size < 0) throw ArgumentError('Font size must be positive.');
    return size * min(_scaleWidth, _scaleHeight);
  }

  double setRadius(num radius) {
    _assertInitialized();
    if (radius < 0) throw ArgumentError('Radius must be positive.');
    return radius * _scaleWidth;
  }
}
