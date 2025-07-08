part of 'package:flutter_addons/flutter_addons.dart';

class ResponsiveScope extends StatefulWidget {
  const ResponsiveScope({
    super.key,
    required this.layoutBuilder,
    this.designFrame,
    this.scaleMode = ScaleMode.percent,
    this.onFlutterError,
    this.screenLock = AppOrientationLock.none,
    this.ownErrorScreen,
    this.enableDebugLogging = false,
    this.errorScreen = ErrorScreen.codeTerminal,
  });

  /// **[DEPRECATED]**: `layoutBuilder` will be removed in the next update.
  /// Please migrate to the new responsive system once it becomes available.
  /// Note: The current implementation causes route restarts on responsive changes.
  /// Builds the layout using the provided layout info (media, screen type, orientation).
  final Widget Function(MediaInfo layout) layoutBuilder;

  /// Defines how the UI should scale.
  final ScaleMode scaleMode;

  /// Optional design reference frame for scaling.
  final Frame? designFrame;

  /// Locks the screen orientation.
  final AppOrientationLock screenLock;

  /// Enable debug logging.
  final bool enableDebugLogging;

  /// Optional Flutter error handler override.
  final FlutterExceptionHandler? onFlutterError;

  /// Optional custom error screen builder.
  final Widget Function(FlutterErrorDetails error)? ownErrorScreen;

  /// Error screen style.
  final ErrorScreen errorScreen;

  @override
  State<ResponsiveScope> createState() => _ResponsiveScopeState();
}

class _ResponsiveScopeState extends State<ResponsiveScope>
    with WidgetsBindingObserver {
  Orientation? _orientation;
  ScreenType? _screenType;
  Size? _screenSize;

  bool _errorHandlersSet = false;
  Timer? _resizeDebounce;

  @override
  void initState() {
    super.initState();
    _setOrientationLock(widget.screenLock);
    WidgetsBinding.instance.addObserver(this);
  }

  Future<void> _setOrientationLock(AppOrientationLock lock) async {
    if (lock == AppOrientationLock.none) return;
    try {
      await SystemChrome.setPreferredOrientations(lock.orientations);
    } catch (e, stack) {
      Debug.error('Failed to set orientation: $e');
      debugPrintStack(stackTrace: stack);
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _updateScreenInfo();

    if (!_errorHandlersSet) {
      _ErrorHandlerService.setup(
        onFlutterError: widget.onFlutterError,
        errorScreen: widget.ownErrorScreen,
        errorScreenStyle: widget.errorScreen,
        enableDebugLogging: widget.enableDebugLogging,
      );
      _errorHandlersSet = true;
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _resizeDebounce?.cancel();
    _resizeDebounce = Timer(
      const Duration(milliseconds: 150),
      _updateScreenInfo,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _resizeDebounce?.cancel();
    SystemChrome.setPreferredOrientations(AppOrientationLock.none.orientations);
    super.dispose();
  }

  void _updateScreenInfo() {
    final mq = MediaQuery.maybeOf(context);
    if (mq == null || mq.size.isEmpty) return;

    final newOrientation = mq.orientation;

    // *** Centralized ScreenUtils***
    _ScreenUtils.initialize(mediaQuery: mq, context: context);
    final newScreenType = _ScreenUtils.screenType;

    final screenSizeChanged = _screenSize != mq.size;

    if (newOrientation != _orientation ||
        newScreenType != _screenType ||
        screenSizeChanged) {
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

      try {
        CoreScale.instance.init(
          context: context,
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

    final layoutWidget =
        isLayoutReady && hasValidSize
            ? widget.layoutBuilder(MediaInfo.fromThis(context))
            : const SizedBox();

    final wrapped = Directionality(
      textDirection: TextDirection.ltr,
      child: layoutWidget,
    );

    if (!hasValidSize) {
      return MediaQuery(
        data: const MediaQueryData(size: Size(360, 800), devicePixelRatio: 2.0),
        child: wrapped,
      );
    }

    return wrapped;
  }

  Frame _getDesignFrame(Orientation orientation) {
    final frame = widget.designFrame;
    if (frame != null && frame.w > 0 && frame.h > 0) {
      return orientation == Orientation.landscape ? frame.reversed : frame;
    }
    return Frame.mobileLarge;
  }
}

/// A widget that adapts its layout responsively based on screen size, orientation,
/// and scale mode. It also handles screen orientation locking, error screens,
// /// and unified scaling logic.
// class ResponsiveScope extends StatefulWidget {
//   const ResponsiveScope({
//     super.key,
//     required this.layoutBuilder,
//     this.designFrame,
//     this.scaleMode = ScaleMode.percent,
//     this.maxMobileWidth = 599,
//     this.maxTabletWidth = 1024,
//     this.onFlutterError,
//     this.screenLock = AppOrientationLock.none,
//     this.ownErrorScreen,
//     this.enableDebugLogging = false,
//     this.errorScreen = ErrorScreen.winDeath,
//   });

//   /// Builds the layout using provided layout information.
//   final Widget Function(MediaInfo layout) layoutBuilder;

//   /// Defines how the UI should scale.
//   final ScaleMode scaleMode;

//   /// Design reference frame for scaling.
//   final Frame? designFrame;

//   /// Maximum width threshold for mobile layout.
//   final double maxMobileWidth;

//   /// Maximum width threshold for tablet layout.
//   final double maxTabletWidth;

//   /// Orientation lock mode.
//   final AppOrientationLock screenLock;

//   /// Enables debug logging during screen updates.
//   final bool enableDebugLogging;

//   /// Flutter error handler override.
//   final FlutterExceptionHandler? onFlutterError;

//   /// Widget builder for custom error screen UI.
//   final Widget Function(FlutterErrorDetails error)? ownErrorScreen;

//   /// Styling configuration for the error screen.
//   final ErrorScreen errorScreen;

//   @override
//   State<ResponsiveScope> createState() => _ResponsiveScopeState();
// }

// class _ResponsiveScopeState extends State<ResponsiveScope>
//     with WidgetsBindingObserver {
//   Orientation? _orientation;
//   ScreenType? _screenType;
//   Size? _screenSize;

//   bool _errorHandlersSet = false;
//   Timer? _resizeDebounce;

//   @override
//   void initState() {
//     super.initState();
//     _setOrientationLock(widget.screenLock);
//     WidgetsBinding.instance.addObserver(this);
//   }

//   Future<void> _setOrientationLock(AppOrientationLock lock) async {
//     if (lock == AppOrientationLock.none) return;
//     try {
//       await SystemChrome.setPreferredOrientations(lock.orientations);
//     } catch (e, stack) {
//       Debug.error(' Failed to set orientation: $e');
//       debugPrintStack(stackTrace: stack);
//     }
//   }

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     _updateScreenInfo(); // Initial update

//     if (!_errorHandlersSet) {
//       _ErrorHandlerService.setup(
//         onFlutterError: widget.onFlutterError,
//         errorScreen: widget.ownErrorScreen,
//         errorScreenStyle: widget.errorScreen,
//         enableDebugLogging: widget.enableDebugLogging,
//       );
//       _errorHandlersSet = true;
//     }
//   }

//   @override
//   void didChangeMetrics() {
//     super.didChangeMetrics();
//     _resizeDebounce?.cancel();
//     _resizeDebounce = Timer(
//       const Duration(milliseconds: 150),
//       _updateScreenInfo,
//     );
//   }

//   @override
//   void dispose() {
//     WidgetsBinding.instance.removeObserver(this);
//     _resizeDebounce?.cancel();
//     SystemChrome.setPreferredOrientations(AppOrientationLock.none.orientations);
//     super.dispose();
//   }

//   void _updateScreenInfo() {
//     final mq = MediaQuery.maybeOf(context);
//     if (mq == null || mq.size.isEmpty) return;

//     final newOrientation = mq.orientation;

//     // *** Used centralized ScreenUtils***
//     _ScreenUtils.initialize(mediaQuery: mq, context: context);
//     final newScreenType = _ScreenUtils.screenType;

//     final screenSizeChanged = _screenSize != mq.size;

//     if (newOrientation != _orientation ||
//         newScreenType != _screenType ||
//         screenSizeChanged) {
//       setState(() {
//         _orientation = newOrientation;
//         _screenType = newScreenType;
//         _screenSize = mq.size;
//       });

//       if (widget.enableDebugLogging) {
//         Debug.warning(
//           '📱 Orientation: $_orientation, '
//           'Screen Type: $_screenType, '
//           'Width: ${mq.size.width}, '
//           'Height: ${mq.size.height}',
//         );
//       }
//       try {
//         CoreScale.instance.init(
//           context: context,
//           mode:
//               widget.designFrame != null ? ScaleMode.design : widget.scaleMode,
//           designFrame: _getDesignFrame(newOrientation),

//           debugLog: widget.enableDebugLogging,
//         );
//       } catch (e) {
//         Debug.error(e);
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final mq = MediaQuery.maybeOf(context);
//     final hasValidSize = mq != null && mq.size.width > 0 && mq.size.height > 0;

//     final isLayoutReady =
//         _orientation != null && _screenSize != null && _screenType != null;

//     final layoutWidget =
//         isLayoutReady && hasValidSize
//             ? widget.layoutBuilder(MediaInfo.fromThis(context))
//             : const SizedBox();

//     final wrapped = Directionality(
//       textDirection: TextDirection.ltr,
//       child: layoutWidget,
//     );

//     if (!hasValidSize) {
//       return MediaQuery(
//         data: const MediaQueryData(size: Size(360, 800), devicePixelRatio: 2.0),
//         child: wrapped,
//       );
//     }

//     return wrapped;
//   }

//   Frame _getDesignFrame(Orientation orientation) {
//     final frame = widget.designFrame;
//     if (frame != null && frame.w > 0 && frame.h > 0) {
//       return orientation == Orientation.landscape ? frame.reversed : frame;
//     }
//     return Frame.mobileLarge;
//   }
// }
