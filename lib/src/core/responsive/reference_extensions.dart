part of 'package:flutter_addons/flutter_addons.dart';

/// An extension on num to provide responsive scaling utilities.
extension ResponsiveScale on num {
  /// Returns the minimum of the responsive width and height.
  double get rs {
    try {
      return min(w, h);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Returns the responsive width.
  double get w {
    try {
      return _DesignScale.instance.setWidth(this);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Returns the responsive height.
  double get h {
    try {
      return _DesignScale.instance.setHeight(this);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  /// Returns the responsive font size.
  double get ts {
    try {
      return _DesignScale.instance.setRt(this);
    } catch (e) {
      _handleError(e);
      rethrow;
    }
  }

  void _handleError(dynamic error) {
    debugPrint('ResponsiveScale encountered an error: $error');
  }

  /// Returns a SizedBox with responsive height.
  SizedBox get verticalSpace {
    return SizedBox(height: h);
  }

  /// Returns a SizedBox with responsive width.
  SizedBox get horizontalSpace {
    return SizedBox(width: w);
  }
}
