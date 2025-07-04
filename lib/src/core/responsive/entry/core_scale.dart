part of 'package:flutter_addons/flutter_addons.dart';

class _CoreScale {
  static final _CoreScale _instance = _CoreScale._internal();

  factory _CoreScale() => _instance;

  _CoreScale._internal();

  late ScaleMode _mode;
  bool _initialized = false;
  bool _debugLog = false;
  late MediaQueryData _mediaQuery;

  void init({
    required BuildContext context,
    required ScaleMode mode,
    Frame? designFrame,
    double maxMobileWidth = 600,
    double maxTabletWidth = 1024,
    bool debugLog = false,
  }) {
    _mode = mode;
    _debugLog = debugLog;

    _log('[UnifiedScale] Initializing all scales');
    _mediaQuery = MediaQuery.of(context);
    _ScreenUtils.initialize(
      mediaQuery: _mediaQuery,
      maxMobileWidth: maxMobileWidth,
      maxTabletWidth: maxTabletWidth,
    );
    _log('[UnifiedScale] Percent scaling initialized.');
    _SmartUnitUtils.instance.init(
      context: context,
      designWidth: designFrame?.w ?? 375,
      designHeight: designFrame?.h ?? 812,
    );
    _log('[UnifiedScale] Smart scaling initialized.');
    if (debugLog) {
      Debug.success(
        '\nInitialization completed.\nActivated: $_mode,\n'
        'DesignSize: ${designFrame.toString()},\nMaxWidth: MT($maxMobileWidth x $maxTabletWidth)\nDevice Info: ${UIContext.osType.name} (${_mediaQuery.size.width} x ${_mediaQuery.size.height})',
      );
    }
    if (designFrame != null && designFrame.w > 0 && designFrame.h > 0) {
      _DesignUtils.instance.init(
        designWidth: designFrame.w,
        designHeight: designFrame.h,
        mediaQuery: _mediaQuery,
        isLoggingEnabled: debugLog,
      );
    } else {
      _log(
        '[UnifiedScale] Design-based scaling skipped due to invalid designSize.',
      );
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
    if (_debugLog) Debug.log(message);
  }
}
