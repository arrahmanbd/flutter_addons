part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class for responsive UI scaling based on a design frame (e.g., Figma/AdobeXD).
///

class _DesignUtils {
  static _DesignUtils? _instance;

  late final double _designWidth;
  late final double _designHeight;

  late final double _screenWidth;
  late final double _screenHeight;

  late final double _scaleWidth;
  late final double _scaleHeight;

  _DesignUtils._internal();

  /// Singleton accessor
  static _DesignUtils get instance {
    return _instance ??= _DesignUtils._internal();
  }

  /// Initializes the scaling utility with design reference dimensions and MediaQueryData.
  ///
  /// [designWidth] and [designHeight] should match your design frame (e.g., 360x800).
  /// [mediaQuery] should be obtained once, e.g., MediaQuery.of(context).
  void init({
    required double designWidth,
    required double designHeight,
    required MediaQueryData mediaQuery,
  }) {
    assert(
      designWidth > 0 && designHeight > 0,
      'Design size must be greater than 0.',
    );

    _designWidth = designWidth;
    _designHeight = designHeight;

    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;

    _scaleWidth = _screenWidth / _designWidth;
    _scaleHeight = _screenHeight / _designHeight;
  }

  void _assertInitialized() {
    if (!(_designWidth > 0 && _designHeight > 0)) {
      throw FlutterError('_DesignUtils is not initialized. Call init() first.');
    }
  }

  /// Converts a width value from design frame to device size
  double setWidth(num width) {
    _assertInitialized();
    if (width < 0) throw ArgumentError('Width must be positive.');
    return width * _scaleWidth;
  }

  /// Converts a height value from design frame to device size
  double setHeight(num height) {
    _assertInitialized();
    if (height < 0) throw ArgumentError('Height must be positive.');
    return height * _scaleHeight;
  }

  /// Converts a font size using the minimum scale factor
  double setFont(num size) {
    _assertInitialized();
    if (size < 0) throw ArgumentError('Font size must be positive.');
    return size * min(_scaleWidth, _scaleHeight);
  }

  /// Converts a radius value from design frame to device size
  double setRadius(num radius) {
    _assertInitialized();
    if (radius < 0) throw ArgumentError('Radius must be positive.');
    return radius * _scaleWidth;
  }
}
