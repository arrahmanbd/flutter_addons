part of 'package:flutter_addons/flutter_addons.dart';

/// A responsive wrapper widget with optional global error handling.
///  includes a BSOD-style fallback error screen.

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

  /// Custom app builder that receives context, orientation, and screen type.
  final ResponsiveBuilderType layoutBuilder;

  /// Scaling strategy: percent, design, or smart.
  final ScaleMode scaleMode;

  /// Optional design size for `design` or `smart` mode.
  final Frame? designFrame;

  /// Custom max widths for screen type logic.
  final double maxMobileWidth;
  final double maxTabletWidth;

  /// Whether to enable debug output.
  final bool enableDebugLogging;

  /// Optional Flutter error handler.
  final FlutterExceptionHandler? onFlutterError;

  /// Optional custom error screen override.
  final Widget Function(FlutterErrorDetails error)? errorScreen;

  /// Style used when rendering fallback error screen.
  final ErrorScreenStyle errorScreenStyle;

  @override
  State<ResponsiveApp> createState() => _ResponsiveAppState();
}

class _ResponsiveAppState extends State<ResponsiveApp> {
  bool _errorHandlersSet = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_errorHandlersSet) {
      _setupGlobalErrorHandlers();
      _errorHandlersSet = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: Kolors.neutral100,
      builder:
          (context, _) => Directionality(
            textDirection: TextDirection.ltr,
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
                  return const SizedBox.shrink();
                }

                final orientation = MediaQuery.of(context).orientation;
                final screenType = _resolveScreenType(constraints.maxWidth);
                if (widget.enableDebugLogging) {
                  debugPrint(
                    '📱 Orientation: $orientation, '
                    'Screen Type: $screenType, '
                    'Width: ${constraints.maxWidth}, '
                    'Height: ${constraints.maxHeight}',
                  );
                }
                UnifiedScale().init(
                  context: context,
                  constraints: constraints,
                  orientation: orientation,
                  mode: widget.scaleMode,
                  designSize:
                      (widget.designFrame != null &&
                              widget.designFrame!.width > 0 &&
                              widget.designFrame!.height > 0)
                          ? (orientation == Orientation.landscape
                              ? widget.designFrame!.reversed
                              : widget.designFrame!)
                          : const Frame(
                            width: 360,
                            height: 800,
                          ), // fallback or default
                  maxMobileWidth: widget.maxMobileWidth,
                  maxTabletWidth: widget.maxTabletWidth,
                  debugLog: widget.enableDebugLogging,
                );

                return widget.layoutBuilder(context, orientation, screenType);
              },
            ),
          ),
    );
  }

  ScreenType _resolveScreenType(double width) =>
      width <= widget.maxMobileWidth
          ? ScreenType.mobile
          : width <= widget.maxTabletWidth
          ? ScreenType.tablet
          : ScreenType.desktop;

  void _setupGlobalErrorHandlers() {
    FlutterError.onError =
        widget.onFlutterError ??
        (FlutterErrorDetails details) {
          FlutterError.presentError(details);
        };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      if (widget.errorScreen != null) return widget.errorScreen!(details);

      final exception = details.exception.toString();
      if (widget.enableDebugLogging) {
        debugPrint('💥 Exception: $exception');
        debugPrint('🔍 Help: ${_makeQuery(exception)}');
      }

      final Widget screen;
      switch (widget.errorScreenStyle) {
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

      return Material(color: Colors.transparent, child: screen);
    };
  }

  String _makeQuery(String exception) {
    var cleaned = exception.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.length > 50) cleaned = cleaned.substring(0, 50);
    return "https://www.google.com/search?q=${Uri.encodeComponent('$cleaned in Flutter')}";
  }
}
