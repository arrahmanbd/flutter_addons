part of 'package:flutter_addons/flutter_addons.dart';

/// A utility class for responsive UI scaling based on a design frame (e.g., Figma/AdobeXD).
class _DesignScale {
  static _DesignScale? _instance;
  late bool _adaptive;
  late double _designWidth;
  late double _designHeight;
  BuildContext? _context;

  _DesignScale._internal();

  /// Singleton accessor
  static _DesignScale get instance {
    return _instance ??= _DesignScale._internal();
  }

  /// Initializes the scaling utility with design reference dimensions and context.
  ///
  /// [designWidth] and [designHeight] should match your design frame (e.g., 360x800).
  void init({
    required double designWidth,
    required double designHeight,
    required BuildContext context,
    required bool makeAdaptive,
  }) {
    assert(
      designWidth > 0 && designHeight > 0,
      'Design size must be greater than 0.',
    );
    _designWidth = designWidth;
    _designHeight = designHeight;
    _context = context;
    _adaptive = makeAdaptive;
  }

  /// Current build context
  BuildContext get _ctx {
    if (_context == null) {
      throw FlutterError('DesignScale.init() must be called before use.');
    }
    return _context!;
  }

  MediaQueryData get _mediaQuery => MediaQuery.of(_ctx);

  /// Actual device width and height
  double get _screenWidth => _mediaQuery.size.width;
  double get _screenHeight => _mediaQuery.size.height;

  /// Scale factor relative to design dimensions
  double get _scaleWidth => _screenWidth / _designWidth;
  double get _scaleHeight => _screenHeight / _designHeight;

  /// Converts a width value from design frame to device size
  double setWidth(num width) {
    if (width < 0) throw ArgumentError('Width must be positive.');
    return _adaptive ? (width / _designWidth) * 100.pw : width * _scaleWidth;
  }

  /// Converts a height value from design frame to device size
  double setHeight(num height) {
    if (height < 0) throw ArgumentError('Height must be positive.');
    return _adaptive
        ? (height / _designHeight) * 100.ph
        : height * _scaleHeight;
  }

  /// Converts a font size using the minimum scale factor
  double setFont(num size) {
    if (size < 0) throw ArgumentError('Font size must be positive.');
    return size * min(_scaleWidth, _scaleHeight);
  }
}
