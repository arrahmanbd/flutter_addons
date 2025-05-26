part of 'package:flutter_addons/flutter_addons.dart';

class UnifiedScale {
  static final UnifiedScale _instance = UnifiedScale._internal();

  factory UnifiedScale() => _instance;

  UnifiedScale._internal();

  late ScaleMode _mode;
  bool _initialized = false;
  bool _debugLog = false;

  void init({
    required BuildContext context,
    required BoxConstraints constraints,
    required Orientation orientation,
    required ScaleMode mode,
    Size? designSize,
    double maxMobileWidth = 600,
    double maxTabletWidth = 1024,
    bool debugLog = false,
  }) {
    if (_initialized) {
      if (debugLog) debugPrint('[UnifiedScale] Already initialized. Skipping.');
      return;
    }

    _mode = mode;
    _debugLog = debugLog;

    _log('[UnifiedScale] Initializing mode: $_mode');

    switch (_mode) {
      case ScaleMode.percent:
        DeviceUtils.setScreenSize(
          context,
          constraints,
          orientation,
          maxMobileWidth,
          maxTabletWidth,
        );
        _log('[UnifiedScale] Percent-based scaling initialized.');
        break;

      case ScaleMode.design:
        if (designSize == null ||
            designSize.width <= 0 ||
            designSize.height <= 0) {
          debugPrint('[UnifiedScale] Warning: Invalid designSize passed.');
        } else {
          _DesignUtils.instance.init(
            designWidth: designSize.width,
            designHeight: designSize.height,
            context: context,
          );
          _log('[UnifiedScale] Design-based scaling initialized.');
        }
        break;

      case ScaleMode.smart:
        SmartUnitUtils.instance.init(
          context: context,
          designWidth: designSize?.width ?? 375,
          designHeight: designSize?.height ?? 812,
        );
        _log('[UnifiedScale] Smart-based scaling initialized.');
        break;
    }

    _initialized = true;
  }

  ScaleMode get mode {
    assert(_initialized, 'UnifiedScale not initialized! Call init() first.');
    return _mode;
  }

  void setMode(ScaleMode mode) {
    assert(
      _initialized,
      'UnifiedScale must be initialized before changing mode.',
    );
    _mode = mode;
    _log('[UnifiedScale] Mode changed to: $_mode');
  }

  void enableLog(bool enable) {
    _debugLog = enable;
    _log('[UnifiedScale] Logging ${enable ? "enabled" : "disabled"}');
  }

  void _log(String message) {
    if (_debugLog) debugPrint(message);
  }
}
