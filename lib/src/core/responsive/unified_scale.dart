part of 'package:flutter_addons/flutter_addons.dart';

class Frame {
  final double width;
  final double height;

  const Frame({required this.width, required this.height});

  /// Returns a new Frame with width and height swapped
  Frame get reversed => Frame(width: height, height: width);

  @override
  String toString() => 'Frame(width: $width, height: $height)';

  /// Common design frame presets representing popular device sizes or breakpoints
  static const Frame mobileSmall = Frame(
    width: 320,
    height: 568,
  ); // iPhone SE, small mobiles
  static const Frame mobileMedium = Frame(
    width: 375,
    height: 667,
  ); // iPhone 8, typical mobiles
  static const Frame mobileLarge = Frame(
    width: 414,
    height: 896,
  ); // iPhone 11 Pro Max, large mobiles

  static const Frame tabletPortrait = Frame(
    width: 768,
    height: 1024,
  ); // iPad portrait
  static const Frame tabletLandscape = Frame(
    width: 1024,
    height: 768,
  ); // iPad landscape

  static const Frame desktopSmall = Frame(
    width: 1366,
    height: 768,
  ); // Typical small desktop window
  static const Frame desktopMedium = Frame(
    width: 1440,
    height: 900,
  ); // Medium desktop
  static const Frame desktopLarge = Frame(
    width: 1920,
    height: 1080,
  ); // Full HD desktop

  /// You can add custom frames as per your app’s target devices or design specs.
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
      designWidth: designFrame?.width ?? 375,
      designHeight: designFrame?.height ?? 812,
    );
    _log('[UnifiedScale] Smart scaling initialized.');
    if (debugLog) {
      Debug.success(
        '\nInitialization completed.\nActivated: $_mode,\n'
        'DesignSize: ${designFrame.toString()},\nMaxWidth: MT($maxMobileWidth x $maxTabletWidth)\nDevice Info: ${UIContext.osType.name} (${_mediaQuery.size.width} x ${_mediaQuery.size.height})',
      );
    }
    if (designFrame != null &&
        designFrame.width > 0 &&
        designFrame.height > 0) {
      _DesignUtils.instance.init(
        designWidth: designFrame.width,
        designHeight: designFrame.height,
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
