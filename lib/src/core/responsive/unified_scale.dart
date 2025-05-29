part of 'package:flutter_addons/flutter_addons.dart';

class Frame {
  final double width;
  final double height;

  const Frame({required this.width, required this.height});

  /// Returns a new Frame with width and height swapped
  Frame get reversed => Frame(width: height, height: width);

  @override
  String toString() => 'Frame(width: $width, height: $height)';
}

class _UnifiedScale {
  static final _UnifiedScale _instance = _UnifiedScale._internal();

  factory _UnifiedScale() => _instance;

  _UnifiedScale._internal();

  late ScaleMode _mode;
  bool _initialized = false;
  bool _debugLog = false;
  late MediaQueryData _mediaQuery;

  void init({
    required BuildContext context,
    required ScaleMode mode,
    Frame? designSize,
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
      designWidth: designSize?.width ?? 375,
      designHeight: designSize?.height ?? 812,
    );
    _log('[UnifiedScale] Smart scaling initialized.');
    if (debugLog) {
      Debug.success(
        '\nInitialization completed.\nActivated: $_mode,\n'
        'DesignSize: ${designSize.toString()},\nMaxWidth: MT($maxMobileWidth x $maxTabletWidth)\nDevice Info: ${UIContext.osType.name} (${_mediaQuery.size.width} x ${_mediaQuery.size.height})',
      );
    }
    if (designSize != null && designSize.width > 0 && designSize.height > 0) {
      _DesignUtils.instance.init(
        designWidth: designSize.width,
        designHeight: designSize.height,
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
