part of 'package:flutter_addons/flutter_addons.dart';

/// Singleton class that initializes and coordinates all scaling modes.
///
/// Use [CoreScale.instance.init] once on startup.
class CoreScale {
  static final CoreScale _instance = CoreScale._internal();

  factory CoreScale() => _instance;

  static CoreScale get instance => _instance;

  CoreScale._internal();

  late ScaleMode _mode;
  bool _initialized = false;
  bool _debugLog = false;
  late MediaQueryData _mediaQuery;

  Frame? _designFrame;

  /// Initializes CoreScale once at app startup.
  /// Sets mode, design frame, and enables logging if needed.
  void init({
    required BuildContext rootContext,
    required ScaleMode mode,
    Frame? designFrame,
    bool debugLog = false,
  }) {
    if (_initialized) {
      if (debugLog) _log('[CoreScale] Already initialized, skipping init.');
      return;
    }

    _mode = mode;
    _debugLog = debugLog;
    _designFrame = designFrame;

    _mediaQuery = MediaQuery.of(rootContext);
    _log('[CoreScale] Initializing with mode: $_mode');
    ThemeHelper.init(rootContext);
    // Initialize percent-based scaling
    _ScreenUtils.initialize(mediaQuery: _mediaQuery);

    // Initialize or update design-based scaling only if designFrame is valid
    // and the current mode is ScaleMode.design
    if (_mode == ScaleMode.design &&
        _designFrame != null &&
        _designFrame!.w > 0 &&
        _designFrame!.h > 0) {
      _DesignUtils.instance.init(
        designWidth: _designFrame!.w,
        designHeight: _designFrame!.h,
        mediaQuery: _mediaQuery,
        isLoggingEnabled: _debugLog,
      );
      _log('[CoreScale] Design-based scaling initialized or updated.');
    } else {
      _log(
        '[CoreScale] Design frame invalid or not provided — skipping design scaling.',
      );
    }

    _initialized = true;
    _log(
      '[CoreScale] Initialization complete: '
      'Screen: ${_mediaQuery.size.width} x ${_mediaQuery.size.height}',
    );
  }

  /// Updates CoreScale on screen size/orientation changes.
  /// Should be called every time MediaQuery changes (e.g., on resize).
  /// Does NOT reset mode or designFrame.
  void update({required BuildContext context}) {
    if (!_initialized) {
      throw FlutterError(
        '[CoreScale] update() called before init(). Please call init() first.',
      );
    }

    _mediaQuery = MediaQuery.of(context);
    _log('[CoreScale] Updating MediaQuery info.');

    // Update ScreenUtils with new media query info
    _ScreenUtils.initialize(mediaQuery: _mediaQuery);

    // Update DesignUtils scaling if design frame exists
    if (_designFrame != null && _designFrame!.w > 0 && _designFrame!.h > 0) {
      _DesignUtils.instance.init(
        designWidth: _designFrame!.w,
        designHeight: _designFrame!.h,
        mediaQuery: _mediaQuery,
        isLoggingEnabled: _debugLog,
      );
      _log('[CoreScale] Design-based scaling updated.');
    }

    _log(
      '[CoreScale] Update complete: Screen: ${_mediaQuery.size.width} x ${_mediaQuery.size.height}',
    );
  }

  ScaleMode get mode {
    _assertInitialized();
    return _mode;
  }

  void setMode(ScaleMode mode) {
    _assertInitialized();
    _mode = mode;
    _log('[CoreScale] Mode changed to: $_mode');
  }

  void enableLog(bool enable) {
    _debugLog = enable;
    _log('[CoreScale] Logging ${enable ? "enabled" : "disabled"}');
  }

  void _assertInitialized() {
    assert(_initialized, '[CoreScale] is not initialized. Call init() first.');
  }

  void _log(String message) {
    if (_debugLog) Debug.log(message);
  }
}
