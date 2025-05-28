part of 'package:flutter_addons/flutter_addons.dart';

/// A responsive wrapper widget with optional global error handling.
///  includes a BSOD-style fallback error screen.

/// Responsive app wrapper with error handling and animated orientation switching.
class ResponsiveApp extends StatefulWidget {
  const ResponsiveApp({
    super.key,
    required this.layoutBuilder,
    this.designFrame,
    this.scaleMode = ScaleMode.percent,
    this.maxMobileWidth = 599,
    this.maxTabletWidth = 1024,
    this.onFlutterError,
    this.errorScreen,
    this.enableDebugLogging = false,
    this.errorScreenStyle = ErrorScreenStyle.dessert,
  });

  final ResponsiveBuilderType layoutBuilder;
  final ScaleMode scaleMode;
  final Frame? designFrame;
  final double maxMobileWidth;
  final double maxTabletWidth;
  final bool enableDebugLogging;
  final FlutterExceptionHandler? onFlutterError;
  final Widget Function(FlutterErrorDetails error)? errorScreen;
  final ErrorScreenStyle errorScreenStyle;

  @override
  State<ResponsiveApp> createState() => _ResponsiveAppState();
}

class _ResponsiveAppState extends State<ResponsiveApp>
    with WidgetsBindingObserver {
  bool _errorHandlersSet = false;
  Orientation? _lastOrientation;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  /// Called when device metrics or orientation changes.
  @override
  void didChangeMetrics() {
    final orientation = MediaQuery.of(context).orientation;
    if (orientation != _lastOrientation) {
      setState(() => _lastOrientation = orientation);
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Kolors.neutral100,
      builder: (context, _) {
        final mediaQuery = MediaQuery.maybeOf(context);
        final hasValidSize =
            mediaQuery?.size.width != 0 && mediaQuery?.size.height != 0;

        final child = Directionality(
          textDirection: TextDirection.ltr,
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
                return const SizedBox.shrink();
              }

              final orientation = MediaQuery.of(context).orientation;
              final screenType = _ScreenTypeResolver.resolve(
                width: constraints.maxWidth,
                maxMobileWidth: widget.maxMobileWidth,
                maxTabletWidth: widget.maxTabletWidth,
              );

              if (widget.enableDebugLogging) {
                debugPrint(
                  '📱 Orientation: $orientation, '
                  'Screen Type: $screenType, '
                  'Width: ${constraints.maxWidth}, '
                  'Height: ${constraints.maxHeight}',
                );
              }

              _UnifiedScale().init(
                context: context,
                constraints: constraints,
                orientation: orientation,
                mode: widget.scaleMode,
                designSize: _getDesignFrame(orientation),
                maxMobileWidth: widget.maxMobileWidth,
                maxTabletWidth: widget.maxTabletWidth,
                debugLog: widget.enableDebugLogging,
              );

              return widget.layoutBuilder(context, orientation, screenType);
            },
          ),
        );

        // If MediaQuery is missing or invalid, wrap with a fallback
        if (mediaQuery == null || !hasValidSize) {
          return MediaQuery(
            data: const MediaQueryData(
              size: Size(360, 800),
              devicePixelRatio: 2.0,
            ),
            child: child,
          );
        }

        return child;
      },
    );
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
}

class _ErrorHandlerService {
  static bool _initialized = false;

  static void setup({
    FlutterExceptionHandler? onFlutterError,
    Widget Function(FlutterErrorDetails error)? errorScreen,
    required ErrorScreenStyle errorScreenStyle,
    required bool enableDebugLogging,
  }) {
    if (_initialized) return;
    _initialized = true;

    FlutterError.onError =
        onFlutterError ??
        (FlutterErrorDetails details) {
          FlutterError.presentError(details);
        };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      Widget screen;

      if (errorScreen != null) {
        screen = errorScreen(details);
      } else {
        if (enableDebugLogging) {
          debugPrint('💥 Exception: ${details.exception}');
          debugPrint('🔍 Help: ${_makeQuery(details.exception.toString())}');
        }

        switch (errorScreenStyle) {
          case ErrorScreenStyle.pixelArt:
            screen = _PixelArtErrorScreen(details);
            break;
          case ErrorScreenStyle.catHacker:
            screen = _CatHackerErrorScreen(details);
            break;
          case ErrorScreenStyle.frost:
            screen = _FrostErrorScreen(details);
            break;
          case ErrorScreenStyle.blueCrash:
            screen = _BlueScreenOfDeath(details);
            break;
          case ErrorScreenStyle.brokenRobot:
            screen = _AssistantErrorScreen(details);
            break;
          case ErrorScreenStyle.simple:
            screen = _AppErrorScreen(details);
            break;
          case ErrorScreenStyle.sifi:
            screen = _SciFiErrorScreen(details);
            break;
          case ErrorScreenStyle.theater:
            screen = _TheaterErrorScreen(details);
            break;
          case ErrorScreenStyle.dessert:
            screen = _Desert404ErrorScreen(details);
            break;
          case ErrorScreenStyle.book:
            screen = _ScrollErrorScreen(details);
            break;
          case ErrorScreenStyle.codeTerminal:
            screen = _TerminalErrorScreen(details);
            break;
        }
      }

      // Ensure a Directionality context for all error screens
      return Directionality(
        textDirection: TextDirection.ltr,
        child: Material(color: Colors.transparent, child: screen),
      );
    };
  }

  static String _makeQuery(String exception) {
    var cleaned = exception.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.length > 50) cleaned = cleaned.substring(0, 50);
    return "https://www.google.com/search?q=${Uri.encodeComponent('$cleaned in Flutter')}";
  }
}

class _ScreenTypeResolver {
  static ScreenType resolve({
    required double width,
    required double maxMobileWidth,
    double? maxTabletWidth,
  }) {
    if (width <= maxMobileWidth) return ScreenType.mobile;
    if (maxTabletWidth == null || width <= maxTabletWidth) {
      return ScreenType.tablet;
    }
    return ScreenType.desktop;
  }
}
