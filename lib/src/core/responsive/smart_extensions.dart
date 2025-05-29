part of 'package:flutter_addons/flutter_addons.dart';

// UnifiedScaler: A utility for strict scaling based on design dimensions, percent, and smart modes.
extension SmartScalerExtension on num {
  // ------------------------
  // Percent-based extensions
  // ------------------------

  /// Percent of screen height (0.5 ➝ 50% of height)
  double get ph => _ScreenUtils.percentHeight(toDouble());

  /// Percent of screen width
  double get pw => _ScreenUtils.percentWidth(toDouble());

  /// Responsive radius from percent width
  double get pr => _ScreenUtils.percentRadius(toDouble());

  /// Responsive font size based on pixelRatio and aspectRatio
  double get pt => _ScreenUtils.percentFontSize(toDouble());

  // double get prs => min(_ScreenUtils.percentSafeHeight(toDouble())/ _ScreenUtils.percentSafeWidth(toDouble()), 1.0) * toDouble();
  // ------------------------
  // Design-based extensions
  // ------------------------

  /// Design-mode responsive width
  double get dw => _safe(() => _DesignUtils.instance.setWidth(this));

  /// Design-mode responsive height
  double get dh => _safe(() => _DesignUtils.instance.setHeight(this));

  /// Design-mode responsive font size
  double get dt => _safe(() => _DesignUtils.instance.setFont(this));

  /// Design-mode responsive radius
  double get dr => _safe(() => _DesignUtils.instance.setRadius(this));

  /// Responsive scale (min of width/height)
  // double get rs => min(dw, dh);

  // ------------------------
  // Smart-based extensions
  // ------------------------

  /// Smart unit scale based on shortest side
  double get su => _SmartUnitUtils.instance.scale(this);
  double get sx => _SmartUnitUtils.instance.scaleX(this);
  double get sy => _SmartUnitUtils.instance.scaleY(this);

  /// Smart font scaling
  double get st => _SmartUnitUtils.instance.scaleText(this);

  // ------------------------
  // Unified extensions (auto-detect mode)
  // ------------------------

  /// Unified width/radius/text-size depending on current active ScaleMode
  double get w {
    switch (_UnifiedScale().mode) {
      case ScaleMode.smart:
        return sx;
      case ScaleMode.design:
        return dw;
      case ScaleMode.percent:
        return pw;
    }
  }

  // unified height
  double get h {
    switch (_UnifiedScale().mode) {
      case ScaleMode.smart:
        return sy;
      case ScaleMode.design:
        return dh;
      case ScaleMode.percent:
        return ph;
    }
  }

  // ------------------------
  // Unified radius
  // ------------------------
  double get r {
    switch (_UnifiedScale().mode) {
      case ScaleMode.smart:
        return min(sy, sx);
      case ScaleMode.design:
        return min(dw, dh);
      case ScaleMode.percent:
        return min(pw, ph);
    }
  }

  double get sp {
    final mode = _UnifiedScale().mode;
    switch (mode) {
      case ScaleMode.smart:
        return st;
      case ScaleMode.design:
        return dt;
      case ScaleMode.percent:
        return pt;
    }
  }

  // ------------------------
  // Safe executor to avoid uninit crashes
  // ------------------------

  T _safe<T>(T Function() compute) {
    try {
      return compute();
    } catch (e) {
      debugPrint('ResponsiveScale error: $e');
      rethrow;
    }
  }
}

class UIContext {
  /// Returns the current screen width.
  static double get width => _ScreenUtils.width;

  /// Returns the current screen height.
  static double get height => _ScreenUtils.height;

  /// Returns the current safe width (excluding system UI).
  static double get safeWidth => _ScreenUtils.safeWidth;

  /// Returns the current safe height (excluding system UI).
  static double get safeHeight => _ScreenUtils.safeHeight;

  /// Returns the current pixel ratio.
  static double get pixelRatio => _ScreenUtils.pixelRatio;

  /// Returns the current aspect ratio.
  static double get aspectRatio => _ScreenUtils.aspectRatio;

  static Orientation get orientation => _ScreenUtils.orientation;

  static bool get isLandscape => orientation == Orientation.landscape;
  static bool get isPortrait => orientation == Orientation.portrait;

  /// Returns the current device type.
  /// Returns the current screen type.
  static ScreenType get deviceType => _ScreenUtils.screenType;
  static OSType get osType => _ScreenUtils.osType;

  /// Returns the current device pixel ratio.
  static bool get isMobile => deviceType == ScreenType.mobile;
  static bool get isTablet => deviceType == ScreenType.tablet;
  static bool get isDesktop => deviceType == ScreenType.desktop;

  /// Returns the current orientation.
}
