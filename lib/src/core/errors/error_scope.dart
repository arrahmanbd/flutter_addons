part of 'package:flutter_addons/flutter_addons.dart';

class _ErrorHandlerService {
  static bool _initialized = false;
  static final _random = Random();

  static void setup({
    FlutterExceptionHandler? onFlutterError,
    Widget Function(FlutterErrorDetails error)? errorScreen,
    required ErrorScreen errorScreenStyle,
    required bool enableDebugLogging,
  }) {
    if (_initialized) return;
    _initialized = true;

    FlutterError.onError =
        onFlutterError ?? _defaultErrorHandler(enableDebugLogging);
    ErrorWidget.builder = _buildErrorWidget(errorScreen, errorScreenStyle);

    ConsoleLogger.debug(
      'ErrorHandlerService initialized',
      tag: 'ERROR_HANDLER',
    );
  }

  static FlutterExceptionHandler _defaultErrorHandler(bool enableDebugLogging) {
    return (FlutterErrorDetails details) {
      if (enableDebugLogging) {
        _showDebugInfo(details);
      }
      FlutterError.presentError(details);
    };
  }

  static ErrorWidgetBuilder _buildErrorWidget(
    Widget Function(FlutterErrorDetails error)? customErrorScreen,
    ErrorScreen errorScreenStyle,
  ) {
    return (FlutterErrorDetails details) {
      final screen =
          customErrorScreen != null
              ? customErrorScreen(details)
              : _buildThemedErrorScreen(details, errorScreenStyle);

      return Directionality(
        textDirection: TextDirection.ltr,
        child: Material(color: Colors.transparent, child: screen),
      );
    };
  }

  static Widget _buildThemedErrorScreen(
    FlutterErrorDetails details,
    ErrorScreen style,
  ) {
    ConsoleLogger.debug(
      'Building error screen: ${style.name}',
      tag: 'ERROR_UI',
    );

    switch (style) {
      case ErrorScreen.pixelArt:
        return _PixelArtErrorScreen(details);
      case ErrorScreen.catHacker:
        return _CatHackerErrorScreen(details);
      case ErrorScreen.frost:
        return _FrostErrorScreen(details);
      case ErrorScreen.winDeath:
        return _WinDeath(details);
      case ErrorScreen.brokenRobot:
        return _AssistantErrorScreen(details);
      case ErrorScreen.simple:
        return _AppErrorScreen(details);
      case ErrorScreen.sifi:
        return _SciFiErrorScreen(details);
      case ErrorScreen.theater:
        return _TheaterErrorScreen(details);
      case ErrorScreen.dessert:
        return _Desert404ErrorScreen(details);
      case ErrorScreen.book:
        return _ScrollErrorScreen(details);
      case ErrorScreen.codeTerminal:
        return _TerminalErrorScreen(details);
    }
  }

  static void _showDebugInfo(FlutterErrorDetails details) {
    if (!kDebugMode) return;

    final exception = details.exception.toString();
    final stack = details.stack?.toString() ?? 'No stack trace available';
    final quote = _getRandomMotivationalQuote();

    _printDebugReport(exception, stack, quote);
  }

  static String _getRandomMotivationalQuote() {
    return AuthorSpeech.motivationalMessages[_random.nextInt(
      AuthorSpeech.motivationalMessages.length,
    )];
  }

  static void _printDebugReport(String exception, String stack, String quote) {
    ConsoleLogger.section('🚨 FLUTTER ERROR DETECTED', color: 'red');

    // Header with motivational quote
    ConsoleLogger.keyValue(
      '💬 Motivation',
      quote,
      keyColor: 'cyan',
      valueColor: 'white',
    );
    ConsoleLogger.separator(color: 'blue', length: 60);

    // Exception details
    ConsoleLogger.section('EXCEPTION DETAILS', color: 'yellow');
    ConsoleLogger.error(exception, tag: 'EXCEPTION');
    ConsoleLogger.separator(color: 'blue', length: 60);

    // Stack trace preview
    ConsoleLogger.section('STACK TRACE PREVIEW', color: 'magenta');
    ConsoleLogger.warning(_previewStack(stack), tag: 'STACK');
    ConsoleLogger.separator(color: 'blue', length: 60);

    // Search suggestion
    ConsoleLogger.section('QUICK SEARCH', color: 'green');
    final searchUrl = _generateSearchQuery(exception);
    ConsoleLogger.info(searchUrl, tag: 'SEARCH');
    ConsoleLogger.keyValue(
      'Search Tip',
      'Copy this URL to quickly find solutions online',
      keyColor: 'yellow',
      valueColor: 'white',
    );
    ConsoleLogger.separator(color: 'blue', length: 60);

    // Helpful tip
    ConsoleLogger.section('DEVELOPER TIP', color: 'cyan');
    ConsoleLogger.info(
      'Use try/catch blocks or custom error boundaries '
      'to gracefully handle errors in production.',
      tag: 'TIP',
    );

    // Additional debug info
    ConsoleLogger.debug(
      'Error occurred at: ${DateTime.now()}',
      tag: 'TIMESTAMP',
    );
    ConsoleLogger.debug(
      'Platform: ${Platform.operatingSystem}',
      tag: 'PLATFORM',
    );

    // Footer
    ConsoleLogger.section('END OF ERROR REPORT 🏁', color: 'red');
  }

  static String _previewStack(String stack, [int lines = 8]) {
    final linesList = stack.split('\n');
    final preview = linesList.take(lines).join('\n');
    final hasMore =
        linesList.length > lines
            ? '\n... (${linesList.length - lines} more lines)'
            : '';

    return '$preview$hasMore';
  }

  static String _generateSearchQuery(String exception) {
    final cleaned = exception
        .replaceAll(RegExp(r'\s+'), ' ')
        .trim()
        .substring(0, min(exception.length, 50));

    final encodedQuery = Uri.encodeComponent('$cleaned in Flutter');
    return 'https://www.google.com/search?q=$encodedQuery';
  }
}
