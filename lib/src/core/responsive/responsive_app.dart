part of 'package:flutter_addons/flutter_addons.dart';

/// A responsive wrapper that sets up error handling, scaling, and adaptive design
/// for your Flutter application.
///
/// This widget ensures that your app is displayed with consistent scaling across
/// different screen sizes by initializing a unified scaling system after layout.
///
/// It also configures global error handling and provides fallback UI for situations
/// where `MediaQuery` is unavailable.

class ResponsiveScope extends StatefulWidget {
  const ResponsiveScope({
    super.key,
    required this.layoutBuilder,
    this.designFrame,
    this.scaleMode = ScaleMode.percent,
    this.maxMobileWidth = 599,
    this.maxTabletWidth = 1024,
    this.screenLock = AppOrientationLock.none,
    this.onFlutterError,
    this.errorScreen,
    this.errorScreenStyle = ErrorScreenStyle.dessert,
    this.enableDebugLogging = false,
  });

  final Widget Function(LayoutInfo layout) layoutBuilder;
  final ScaleMode scaleMode;
  final Frame? designFrame;
  final double maxMobileWidth;
  final double maxTabletWidth;
  final bool enableDebugLogging;
  final FlutterExceptionHandler? onFlutterError;
  final Widget Function(FlutterErrorDetails error)? errorScreen;
  final ErrorScreenStyle errorScreenStyle;
  final AppOrientationLock screenLock;

  @override
  State<ResponsiveScope> createState() => _ResponsiveScopeState();
}

class _ResponsiveScopeState extends State<ResponsiveScope>
    with WidgetsBindingObserver {
  Size? _lastScreenSize;
  Timer? _resizeDebounce;
  bool _errorHandlersSet = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _setOrientation(widget.screenLock);
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
  void didChangeMetrics() {
    final contextSize = MediaQuery.of(context).size;
    if (_lastScreenSize != contextSize) {
      _resizeDebounce?.cancel();
      _resizeDebounce = Timer(const Duration(milliseconds: 150), () {
        _lastScreenSize = contextSize;
        _initScale(context, MediaQuery.of(context).orientation);
        if (mounted) setState(() {});
      });
    }
  }

  @override
  void dispose() {
    _resizeDebounce?.cancel();
    SystemChrome.setPreferredOrientations(AppOrientationLock.none.orientations);
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.maybeOf(context);
    final hasValidMediaQuery =
        mediaQuery != null &&
        mediaQuery.size.width > 0 &&
        mediaQuery.size.height > 0;

    final mediaQueryData =
        hasValidMediaQuery ? mediaQuery : _fallbackMediaQuery(context);

    final screenSize = mediaQueryData.size;
    final orientation = mediaQueryData.orientation;

    if (_lastScreenSize != screenSize) {
      _lastScreenSize = screenSize;
      _initScale(context, orientation);
    }

    return MediaQuery(
      data: mediaQueryData,
      child: WidgetsApp(
        debugShowCheckedModeBanner: false,
        color: Kolors.neutral100,
        builder: (context, _) {
          return Directionality(
            textDirection: TextDirection.ltr,
            child: widget.layoutBuilder(LayoutInfo.fromThis(context)),
          );
        },

        // widget.enableDebugLogging
        //     ? Banner(
        //       message: 'FlutterAddons',
        //       location: BannerLocation.topEnd,
        //       color: Kolors.cyan500,
        //       textStyle: const TextStyle(
        //         fontWeight: FontWeight.bold,
        //         fontSize: 12,
        //         letterSpacing: 1.5,
        //         color: Colors.white,
        //       ),
        //       child: _buildMainUI(context),
        //    )
        //
      ),
    );
  }

  void _initScale(BuildContext context, Orientation orientation) {
    _UnifiedScale().init(
      context: context,
      mode: widget.scaleMode,
      designSize: _getDesignFrame(orientation),
      maxMobileWidth: widget.maxMobileWidth,
      maxTabletWidth: widget.maxTabletWidth,
      debugLog: widget.enableDebugLogging,
    );
  }

  Frame _getDesignFrame(Orientation orientation) {
    final frame = widget.designFrame;
    if (frame != null && frame.width > 0 && frame.height > 0) {
      return orientation == Orientation.landscape ? frame.reversed : frame;
    }
    return const Frame(width: 360, height: 800);
  }

  MediaQueryData _fallbackMediaQuery(BuildContext context) {
    final view = View.of(context);
    final screenSize = view.physicalSize / view.devicePixelRatio;
    return MediaQueryData(
      size: screenSize,
      devicePixelRatio: view.devicePixelRatio,
    );
  }
}
