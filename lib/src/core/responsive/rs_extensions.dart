part of 'package:flutter_addons/flutter_addons.dart';

// UnifiedScaler: A utility for strict scaling based on design dimensions, percent, and smart modes.
extension SmartScalerExtension on num {
  // ------------------------
  // Percent-based extensions
  // ------------------------

  /// Percent of screen height (0.5 ➝ 50% of height)
  double get ph => this * DeviceScreenUtils.height / 100;

  /// Percent of screen width
  double get pw => this * DeviceScreenUtils.width;

  /// Responsive radius from percent width
  double get pr => this * DeviceScreenUtils.width / 100;

  /// Responsive font size based on pixelRatio and aspectRatio
  double get pt =>
      this *
      (((ph + pw) +
              (DeviceScreenUtils.pixelRatio * DeviceScreenUtils.aspectRatio)) /
          2.08) /
      100;

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
  double get su => SmartUnitUtils.instance.scale(this);
  double get sx => SmartUnitUtils.instance.scaleX(this);
  double get sy => SmartUnitUtils.instance.scaleY(this);

  /// Smart font scaling
  double st([double textScaleFactor = 1.0]) =>
      SmartUnitUtils.instance.sp(this, textScaleFactor: textScaleFactor);

  // ------------------------
  // Unified extensions (auto-detect mode)
  // ------------------------

  /// Unified width/radius/text-size depending on current active ScaleMode
  double get w {
    switch (UnifiedScale().mode) {
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
    switch (UnifiedScale().mode) {
      case ScaleMode.smart:
        return sy;
      case ScaleMode.design:
        return dh;
      case ScaleMode.percent:
        return ph;
    }
  }

  // unified height
  double get rs {
    switch (UnifiedScale().mode) {
      case ScaleMode.smart:
        return min(sy, sx);
      case ScaleMode.design:
        return min(dw, dh);
      case ScaleMode.percent:
        return min(pw, ph);
    }
  }

  double get sp {
    final mode = UnifiedScale().mode;
    switch (mode) {
      case ScaleMode.smart:
        return st();
      case ScaleMode.design:
        return dt;
      case ScaleMode.percent:
        return pt;
    }
  }

  /// Unified scalable font size
  double usp([double textScaleFactor = 1.0]) {
    switch (UnifiedScale().mode) {
      case ScaleMode.smart:
        return st(textScaleFactor);
      case ScaleMode.design:
        return dt * textScaleFactor;
      case ScaleMode.percent:
        return pt * textScaleFactor;
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

  // ------------------------
  // Unified radius
  // ------------------------
  double get fs => sp; // fontSize shorthand
  double get r => rs; // radius shorthand
}
