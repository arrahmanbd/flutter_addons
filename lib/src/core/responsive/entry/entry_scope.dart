part of 'package:flutter_addons/flutter_addons.dart';

/// ResponsiveScope widget
class ResponsiveScope extends StatefulWidget {
  const ResponsiveScope({
    super.key,
    this.app,
    required this.layoutBuilder,
    this.designFrame,
    this.scaleMode = ScaleMode.percent,
    this.onFlutterError,
    this.screenLock = AppOrientationLock.none,
    this.ownErrorScreen,
    this.enableDebugLogging = false,
    this.errorScreen = ErrorScreen.catHacker,
    this.pixelDebug = false,
    this.gridCount = 12,
  });

  final Widget Function(MediaInfo layout) layoutBuilder;
  final Widget? app;
  final ScaleMode scaleMode;
  final DesignFrame? designFrame;
  final AppOrientationLock screenLock;
  final bool enableDebugLogging;
  final FlutterExceptionHandler? onFlutterError;
  final Widget Function(FlutterErrorDetails error)? ownErrorScreen;
  final ErrorScreen errorScreen;
  final bool pixelDebug;
  final int gridCount;

  @override
  State<ResponsiveScope> createState() => _ResponsiveScopeState();
}

class _ResponsiveScopeState extends State<ResponsiveScope>
    with WidgetsBindingObserver {
  Orientation? _orientation;
  ScreenType? _screenType;
  Size? _screenSize;

  Timer? _resizeDebounce;
  bool _coreScaleInitialized = false;

  @override
  void initState() {
    super.initState();
    _setOrientationLock(widget.screenLock);
    WidgetsBinding.instance.addObserver(this);

    _ErrorHandlerService.setup(
      onFlutterError: widget.onFlutterError,
      errorScreen: widget.ownErrorScreen,
      errorScreenStyle: widget.errorScreen,
      enableDebugLogging: widget.enableDebugLogging,
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateScreenInfo(); // first-time initialization
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    // debounce to prevent rapid rebuilds
    _resizeDebounce?.cancel();
    _resizeDebounce = Timer(const Duration(milliseconds: 100), () {
      if (!mounted) return;
      _updateScreenInfo();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _resizeDebounce?.cancel();
    SystemChrome.setPreferredOrientations([]);
    super.dispose();
  }

  Future<void> _setOrientationLock(AppOrientationLock lock) async {
    try {
      if (lock != AppOrientationLock.none) {
        await SystemChrome.setPreferredOrientations(lock.orientations);
      }
    } catch (e, stack) {
      debugPrint('Failed to set orientation: $e');
      debugPrintStack(stackTrace: stack);
    }
  }

  void _updateScreenInfo() {
    final mq = MediaQuery.maybeOf(context);
    if (mq == null || mq.size.isEmpty) return;

    final newOrientation = mq.orientation;
    final newSize = mq.size;

    _ScreenUtils.initialize(mediaQuery: mq, context: context);
    final newScreenType = _ScreenUtils.screenType;

    final hasChanged =
        _orientation != newOrientation ||
        _screenType != newScreenType ||
        _screenSize != newSize;

    if (hasChanged) {
      setState(() {
        _orientation = newOrientation;
        _screenType = newScreenType;
        _screenSize = newSize;
      });

      if (!_coreScaleInitialized) {
        try {
          CoreScale.instance.init(
            rootContext: context,
            mode:
                widget.designFrame != null
                    ? ScaleMode.design
                    : widget.scaleMode,
            //designFrame: widget.designFrame ?? DesignFrame.mobileLarge,
            designFrame: _getDesignFrame(_orientation!),
            debugLog: widget.enableDebugLogging,
          );
          _coreScaleInitialized = true; // only initialize once
        } catch (e) {
          debugPrint('CoreScale init error: $e');
        }
      }

      if (widget.enableDebugLogging) {
        debugPrint(
          '📱 Orientation: $_orientation, Screen Type: $_screenType, '
          'Width: ${newSize.width}, Height: ${newSize.height}',
        );
      }
    }
  }

  DesignFrame _getDesignFrame(Orientation orientation) {
    final frame = widget.designFrame;
    if (frame != null && frame.width > 0 && frame.height > 0) {
      return orientation == Orientation.landscape ? frame.reversed : frame;
    }
    return DesignFrame.mobileLarge;
  }

  @override
  Widget build(BuildContext context) {
    if (_screenSize == null || _orientation == null || _screenType == null) {
      // Return placeholder until screen info is ready
      return const SizedBox.shrink();
    }

    final Widget layoutWidget =
        widget.app ?? widget.layoutBuilder(MediaInfo.fromThis(context));

    final dir = Directionality.maybeOf(context) ?? TextDirection.ltr;
    final wrapped = Directionality(textDirection: dir, child: layoutWidget);

    // Wrap in WidgetsApp + Theme + ScaffoldMessenger + Grid
    return _ScopeWrapper(
      wrapped: wrapped,
      debugBanner: widget.enableDebugLogging,
      showGrid: widget.pixelDebug,
      columnCount: widget.gridCount,
    );
  }
}
