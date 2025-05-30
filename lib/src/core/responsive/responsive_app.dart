part of 'package:flutter_addons/flutter_addons.dart';

class ResponsiveScope extends StatefulWidget {
  const ResponsiveScope({
    super.key,
    required this.layoutBuilder,
    this.designFrame,
    this.scaleMode = ScaleMode.percent,
    this.maxMobileWidth = 599,
    this.maxTabletWidth = 1024,
    this.onFlutterError,
    this.screenLock = AppOrientationLock.none,
    this.errorScreen,
    this.enableDebugLogging = false,
    this.errorScreenStyle = ErrorScreenStyle.dessert,
  });

  final Widget Function(LayoutInfo layout) layoutBuilder;
  final ScaleMode scaleMode;
  final Frame? designFrame;
  final double maxMobileWidth;
  final double maxTabletWidth;
  final AppOrientationLock screenLock;
  final bool enableDebugLogging;
  final FlutterExceptionHandler? onFlutterError;
  final Widget Function(FlutterErrorDetails error)? errorScreen;
  final ErrorScreenStyle errorScreenStyle;

  @override
  State<ResponsiveScope> createState() => _ResponsiveScopeState();
}

class _ResponsiveScopeState extends State<ResponsiveScope>
    with WidgetsBindingObserver {
  bool _errorHandlersSet = false;
  Orientation? _orientation;
  ScreenType? _screenType;
  Size? _screenSize;

  @override
  void initState() {
    super.initState();
    _setOrientation(widget.screenLock);
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _setOrientation(AppOrientationLock lock) async {
    if (lock == AppOrientationLock.none) return;
    try {
      await SystemChrome.setPreferredOrientations(lock.orientations);
    } catch (e, stackTrace) {
      debugPrint('Failed to set orientation: $e');
      debugPrintStack(stackTrace: stackTrace);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Safe place to access inherited widgets like MediaQuery
    _updateScreenInfo();

    if (!_errorHandlersSet) {
      _ErrorHandlerService.setup(
        onFlutterError: widget.onFlutterError,
        errorScreen: widget.errorScreen,
        errorScreenStyle: widget.errorScreenStyle,
        enableDebugLogging: widget.enableDebugLogging,
      );
      _errorHandlersSet = true;
    }
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations(AppOrientationLock.none.orientations);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _updateScreenInfo();
  }

  void _updateScreenInfo() {
    final mq = MediaQuery.maybeOf(context);
    if (mq == null || mq.size.width == 0 || mq.size.height == 0) return;

    final newOrientation = mq.orientation;
    final newScreenType = _resolveScreenType(
      mq.size.width,
      widget.maxMobileWidth,
      widget.maxTabletWidth,
    );

    if (newOrientation != _orientation ||
        newScreenType != _screenType ||
        _screenSize != mq.size) {
      setState(() {
        _orientation = newOrientation;
        _screenType = newScreenType;
        _screenSize = mq.size;
      });

      if (widget.enableDebugLogging) {
        Debug.warning(
          '📱 Orientation: $_orientation, '
          'Screen Type: $_screenType, '
          'Width: ${mq.size.width}, '
          'Height: ${mq.size.height}',
        );
      }

      // Init scaling (you can add your own logic)
      _UnifiedScale().init(
        context: context,
        mode: widget.scaleMode,
        designSize: _getDesignFrame(_orientation!),
        maxMobileWidth: widget.maxMobileWidth,
        maxTabletWidth: widget.maxTabletWidth,
        debugLog: widget.enableDebugLogging,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.maybeOf(context);
    final hasValidSize = mq != null && mq.size.width > 0 && mq.size.height > 0;

    final isLayoutReady =
        _orientation != null &&
        _screenSize != null &&
        _screenType != null &&
        hasValidSize;

    final layoutWidget =
        isLayoutReady
            ? widget.layoutBuilder(LayoutInfo.fromThis(context))
            : const SizedBox(); // Or a splash/loading screen

    final wrapped = Directionality(
      textDirection: TextDirection.ltr,
      child: layoutWidget,
    );

    // Use default fallback media query if needed
    if (!hasValidSize) {
      return MediaQuery(
        data: const MediaQueryData(size: Size(360, 800), devicePixelRatio: 2.0),
        child: wrapped,
      );
    }

    return wrapped;
  }

  Frame _getDesignFrame(Orientation orientation) {
    if (widget.designFrame != null &&
        widget.designFrame!.width > 0 &&
        widget.designFrame!.height > 0) {
      return orientation == Orientation.landscape
          ? widget.designFrame!.reversed
          : widget.designFrame!;
    }
    return const Frame(width: 360, height: 800);
  }

  static ScreenType _resolveScreenType(
    double width,
    double maxMobileWidth,
    double maxTabletWidth,
  ) {
    if (width <= maxMobileWidth) return ScreenType.mobile;
    if (width <= maxTabletWidth) return ScreenType.tablet;
    return ScreenType.desktop;
  }
}
