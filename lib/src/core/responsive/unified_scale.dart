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


class UnifiedScale {
  static final UnifiedScale _instance = UnifiedScale._internal();

  factory UnifiedScale() => _instance;

  UnifiedScale._internal();

  late ScaleMode _mode;
  bool _initialized = false;
  bool _debugLog = false;
  late MediaQueryData _mediaQuery;

  void init({
    required BuildContext context,
    required BoxConstraints constraints,
    required Orientation orientation,
    required ScaleMode mode,
    Frame? designSize,
    double maxMobileWidth = 600,
    double maxTabletWidth = 1024,
    bool debugLog = false,
  }) {
    // if (_initialized) {
    //   if (debugLog) debugPrint('[UnifiedScale] Already initialized. Skipping.');
    //   return;
    // }

    _mode = mode;
    _debugLog = debugLog;

    _log('[UnifiedScale] Initializing all scale utilities');

    // Initialize MediaQuery once
    _mediaQuery = MediaQueryData.fromView(
      WidgetsBinding.instance.platformDispatcher.views.first,
    );
    final orientation = _mediaQuery.orientation;
    // Initialize DeviceUtils (percent scaling)
    DeviceScreenUtils.initialize(
      constraints,
      orientation,
      _mediaQuery,
      maxMobileWidth,
      maxTabletWidth,
    );
    _log('[UnifiedScale] Percent-based scaling initialized.');

    // Initialize DesignScale (design scaling), if designSize is valid
    if (designSize != null && designSize.width > 0 && designSize.height > 0) {
      _DesignUtils.instance.init(
        designWidth: designSize.width,
        designHeight: designSize.height,
        mediaQuery: _mediaQuery,
      );
      _log(
        '[UnifiedScale] Design-based scaling initialized with designSize: $designSize',
      );
    } else {
      _log(
        '[UnifiedScale] Design-based scaling skipped due to invalid designSize.',
      );
    }

    // Initialize SmartUnitUtils (smart scaling)
    SmartUnitUtils.instance.init(
      context: context,
      designWidth: designSize?.width ?? 375,
      designHeight: designSize?.height ?? 812,
    );
    _log('[UnifiedScale] Smart-based scaling initialized.');

    _initialized = true;
    _log('[UnifiedScale] Initialization complete. Active mode: $_mode');
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
