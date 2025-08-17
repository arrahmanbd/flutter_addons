part of 'package:flutter_addons/flutter_addons.dart';

///  Experimental Version
///  Still on test Mode
///  Expected: 3.0.0
/// ==========================

// class ResponsiveScope extends StatefulWidget {
//   const ResponsiveScope({
//     super.key,
//     this.app,
//     required this.layoutBuilder,
//     this.designFrame,
//     this.scaleMode = ScaleMode.percent,
//     this.onFlutterError,
//     this.screenLock = AppOrientationLock.none,
//     this.ownErrorScreen,
//     this.enableDebugLogging = false,
//     this.errorScreen = ErrorScreen.catHacker,
//   });

//   final Widget Function(MediaInfo layout) layoutBuilder;
//   final Widget? app;
//   final ScaleMode scaleMode;
//   final DesignFrame? designFrame;
//   final AppOrientationLock screenLock;
//   final bool enableDebugLogging;
//   final FlutterExceptionHandler? onFlutterError;
//   final Widget Function(FlutterErrorDetails error)? ownErrorScreen;
//   final ErrorScreen errorScreen;

//   @override
//   State<ResponsiveScope> createState() => _ResponsiveScopeState();
// }

// class _ResponsiveScopeState extends State<ResponsiveScope>
//     with WidgetsBindingObserver {
//   Orientation? _orientation;
//   ScreenType? _screenType;
//   Size? _screenSize;

//   Timer? _resizeDebounce;

//   @override
//   void initState() {
//     super.initState();
//     _setOrientationLock(widget.screenLock);
//     WidgetsBinding.instance.addObserver(this);

//     _ErrorHandlerService.setup(
//       onFlutterError: widget.onFlutterError,
//       errorScreen: widget.ownErrorScreen,
//       errorScreenStyle: widget.errorScreen,
//       enableDebugLogging: widget.enableDebugLogging,
//     );
//   }

//   Future<void> _setOrientationLock(AppOrientationLock lock) async {
//     try {
//       if (lock != AppOrientationLock.none) {
//         await SystemChrome.setPreferredOrientations(lock.orientations);
//       }
//     } catch (e, stack) {
//       debugPrint('Failed to set orientation: $e');
//       debugPrintStack(stackTrace: stack);
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateScreenInfo();
//   }

//   @override
//   void didChangeMetrics() {
//     super.didChangeMetrics();
//     _resizeDebounce?.cancel();
//     _resizeDebounce = Timer(Duration.zero, () {
//       SchedulerBinding.instance.addPostFrameCallback(
//         (_) => _updateScreenInfo(),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _resizeDebounce?.cancel();
//     SystemChrome.setPreferredOrientations([]);
//     super.dispose();
//   }

//   void _updateScreenInfo() {
//     final mq = MediaQuery.maybeOf(context);
//     if (mq == null || mq.size.isEmpty) return;

//     final newOrientation = mq.orientation;
//     final newSize = mq.size;

//     _ScreenUtils.initialize(mediaQuery: mq, context: context);
//     final newScreenType = _ScreenUtils.screenType;

//     final screenSizeChanged = _screenSize != newSize;

//     if (newOrientation != _orientation ||
//         newScreenType != _screenType ||
//         screenSizeChanged) {
//       setState(() {
//         _orientation = newOrientation;
//         _screenType = newScreenType;
//         _screenSize = newSize;
//       });

//       if (widget.enableDebugLogging) {
//         debugPrint(
//           '📱 Orientation: $_orientation, Screen Type: $_screenType, '
//           'Width: ${newSize.width}, Height: ${newSize.height}',
//         );
//       }

//       try {
//         CoreScale.instance.init(
//           rootContext: context,
//           mode:
//               widget.designFrame != null ? ScaleMode.design : widget.scaleMode,
//           designFrame: _getDesignFrame(newOrientation),
//           debugLog: widget.enableDebugLogging,
//         );
//       } catch (e) {
//         debugPrint('CoreScale init error: $e');
//       }
//     }
//   }

//   DesignFrame _getDesignFrame(Orientation orientation) {
//     final frame = widget.designFrame;
//     if (frame != null && frame.width > 0 && frame.height > 0) {
//       return orientation == Orientation.landscape ? frame.reversed : frame;
//     }
//     return DesignFrame.mobileLarge;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mq = MediaQuery.maybeOf(context);
//     final hasValidSize = mq != null && mq.size.width > 0 && mq.size.height > 0;

//     final isLayoutReady =
//         _orientation != null && _screenSize != null && _screenType != null;

//     final Widget layoutWidget =
//         (widget.app != null && isLayoutReady && hasValidSize)
//             ? widget.app!
//             : widget.layoutBuilder.call(MediaInfo.fromThis(context));

//     final dir = Directionality.maybeOf(context) ?? TextDirection.ltr;

//     final wrapped = Directionality(textDirection: dir, child: layoutWidget);

//     /// Wrap in WidgetsApp + Theme + ScaffoldMessenger
//     final appWrapper = _ScopeWrapper(wrapped: wrapped);

//     if (!hasValidSize) {
//       return MediaQuery(
//         data: const MediaQueryData(size: Size(360, 800), devicePixelRatio: 2.0),
//         child: appWrapper,
//       );
//     }

//     return appWrapper;
//   }
// }

//============
// Optimized Version: 2.4.5
//===========
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

  @override
  State<ResponsiveScope> createState() => _ResponsiveScopeState();
}

class _ResponsiveScopeState extends State<ResponsiveScope>
    with WidgetsBindingObserver {
  Orientation? _orientation;
  ScreenType? _screenType;
  Size? _screenSize;

  Timer? _resizeDebounce;

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

  Future<void> _setOrientationLock(AppOrientationLock lock) async {
    try {
      if (lock != AppOrientationLock.none) {
        await SystemChrome.setPreferredOrientations(lock.orientations);
      }
    } catch (e, stack) {
      Debug.error('Failed to set orientation: $e');
      debugPrintStack(stackTrace: stack);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateScreenInfo();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _resizeDebounce?.cancel();
    _resizeDebounce = Timer(Duration.zero, () {
      SchedulerBinding.instance.addPostFrameCallback(
        (_) => _updateScreenInfo(),
      );
    });
  }

  @override
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _resizeDebounce?.cancel();

    // Optionally reset to default orientation lock on dispose
    SystemChrome.setPreferredOrientations([]);

    super.dispose();
  }

  void _updateScreenInfo() {
    final mq = MediaQuery.maybeOf(context);
    if (mq == null || mq.size.isEmpty) return;

    final newOrientation = mq.orientation;
    final newSize = mq.size;

    _ScreenUtils.initialize(mediaQuery: mq, context: context);
    final newScreenType = _ScreenUtils.screenType;

    final screenSizeChanged = _screenSize != newSize;

    if (newOrientation != _orientation ||
        newScreenType != _screenType ||
        screenSizeChanged) {
      setState(() {
        _orientation = newOrientation;
        _screenType = newScreenType;
        _screenSize = newSize;
      });

      if (widget.enableDebugLogging) {
        Debug.warning(
          '📱 Orientation: $_orientation, '
          'Screen Type: $_screenType, '
          'Width: ${newSize.width}, '
          'Height: ${newSize.height}',
        );
      }

      try {
        CoreScale.instance.init(
          rootContext: context,
          mode:
              widget.designFrame != null ? ScaleMode.design : widget.scaleMode,
          designFrame: _getDesignFrame(newOrientation),
          debugLog: widget.enableDebugLogging,
        );
      } catch (e) {
        Debug.error(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.maybeOf(context);
    final hasValidSize = mq != null && mq.size.width > 0 && mq.size.height > 0;

    final isLayoutReady =
        _orientation != null && _screenSize != null && _screenType != null;

    final Widget layoutWidget =
        (widget.app != null && isLayoutReady && hasValidSize)
            ? widget.app!
            : widget.layoutBuilder.call(MediaInfo.fromThis(context));

    final dir = Directionality.maybeOf(context) ?? TextDirection.ltr;

    final wrapped = Directionality(textDirection: dir, child: layoutWidget);

    if (!hasValidSize) {
      return MediaQuery(
        data: const MediaQueryData(size: Size(360, 800), devicePixelRatio: 2.0),
        child: wrapped,
      );
    }

    return wrapped;
  }

  DesignFrame _getDesignFrame(Orientation orientation) {
    final frame = widget.designFrame;
    if (frame != null && frame.width > 0 && frame.height > 0) {
      return orientation == Orientation.landscape ? frame.reversed : frame;
    }
    return DesignFrame.mobileLarge;
  }
}
