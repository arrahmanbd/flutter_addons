part of 'package:flutter_addons/flutter_addons.dart';

/// A responsive wrapper widget with optional global error handling.
///  includes a BSOD-style fallback error screen.

class ResponsiveApp extends StatelessWidget {
  const ResponsiveApp({
    super.key,
    required this.builder,
    this.designSize,
    this.scaleMode = ScaleMode.percent,
    this.maxMobileWidth = 599,
    this.maxTabletWidth = 1024,
    this.onFlutterError,
    this.errorScreen,
    this.debugLog = false,
    this.errorScreenStyle = ErrorScreenStyle.dessert,
  });

  /// Your custom app builder that receives context, orientation, and screen type.
  final ResponsiveBuilderType builder;

  /// Scaling strategy: percent, design, or smart.
  final ScaleMode scaleMode;

  /// Optional design size for `design` or `smart` mode.
  final Size? designSize;

  /// Custom max widths for screen type logic.
  final double maxMobileWidth;
  final double maxTabletWidth;

  /// Whether to enable debug output.
  final bool debugLog;

  /// Optional Flutter error handler.
  final FlutterExceptionHandler? onFlutterError;

  /// Optional custom error screen override.
  final Widget Function(FlutterErrorDetails error)? errorScreen;

  /// Style used when rendering fallback error screen.
  final ErrorScreenStyle errorScreenStyle;

  @override
  Widget build(BuildContext context) {
    _setupGlobalErrorHandlers();
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
          return const SizedBox.shrink();
        }

        final orientation = MediaQuery.of(context).orientation;
        final screenType = _resolveScreenType(constraints.maxWidth);

        // Unified scale init
        UnifiedScale().init(
          context: context,
          constraints: constraints,
          orientation: orientation,
          mode: scaleMode,
          designSize: designSize,
          maxMobileWidth: maxMobileWidth,
          maxTabletWidth: maxTabletWidth,
          debugLog: debugLog,
        );

        return builder(context, orientation, screenType);
      },
    );
  }

  ScreenType _resolveScreenType(double width) {
    if (width <= maxMobileWidth) return ScreenType.mobile;
    if (width <= maxTabletWidth) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  void _setupGlobalErrorHandlers() {
    FlutterError.onError =
        onFlutterError ??
        (FlutterErrorDetails details) {
          FlutterError.presentError(details);
        };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      if (errorScreen != null) return errorScreen!(details);

      final exception = details.exception.toString();
      Debug.info('💥 Exception: $exception');
      Debug.info('🔍 Help: ${_makeQuery(exception)}');

      late final Widget screen;
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

      return Material(color: Colors.transparent, child: screen);
    };
  }

  String _makeQuery(String exception) {
    String cleaned = exception.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.length > 50) cleaned = cleaned.substring(0, 50);
    return "https://www.google.com/search?q=${Uri.encodeComponent('$cleaned in Flutter')}";
  }
}
