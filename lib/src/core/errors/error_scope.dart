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
        onFlutterError ??
        (FlutterErrorDetails details) {
          // Always show debug info, even if logging is disabled
          _alwaysShowDebugInfo(details);
          FlutterError.presentError(details);
        };

    ErrorWidget.builder = (FlutterErrorDetails details) {
      Widget screen;
      if (errorScreen != null) {
        screen = errorScreen(details);
      } else {
        switch (errorScreenStyle) {
          case ErrorScreen.pixelArt:
            screen = _PixelArtErrorScreen(details);
            break;
          case ErrorScreen.catHacker:
            screen = _CatHackerErrorScreen(details);
            break;
          case ErrorScreen.frost:
            screen = _FrostErrorScreen(details);
            break;
          case ErrorScreen.winDeath:
            screen = _WinDeath(details);
            break;
          case ErrorScreen.brokenRobot:
            screen = _AssistantErrorScreen(details);
            break;
          case ErrorScreen.simple:
            screen = _AppErrorScreen(details);
            break;
          case ErrorScreen.sifi:
            screen = _SciFiErrorScreen(details);
            break;
          case ErrorScreen.theater:
            screen = _TheaterErrorScreen(details);
            break;
          case ErrorScreen.dessert:
            screen = _Desert404ErrorScreen(details);
            break;
          case ErrorScreen.book:
            screen = _ScrollErrorScreen(details);
            break;
          case ErrorScreen.codeTerminal:
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

  static void _alwaysShowDebugInfo(FlutterErrorDetails details) {
    final exception = details.exception.toString();
    final stack = details.stack?.toString() ?? 'No stack trace available';
    final quote =
        AuthorSpeech.motivationalMessages[_random.nextInt(
          AuthorSpeech.motivationalMessages.length,
        )];

    const reset = '\x1B[0m';
    const bold = '\x1B[1m';
    const cyan = '\x1B[36m';
    const yellow = '\x1B[33m';

    // Styled box for motivational quote
    if (kDebugMode) {
      print('''
$bold$cyan━━━━━━━━━━━━━━━━━━━━━━[ Debug Motivation 💡 ]━━━━━━━━━━━━━━━━━━━━━━$reset
$yellow$quote$reset
$cyan━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$reset
''');
    }

    // Error and stack (kept readable outside the box)
    Debug.info(
      '────────────────────── Flutter Addons Error Report ───────────────────────',
    );
    Debug.info('Exception:');
    Debug.error('  $exception\n');

    Debug.info('Stack Trace (first 5 lines):');
    Debug.warning('  ${_previewStack(stack)}\n');

    Debug.success('✅  Search suggestion:');
    Debug.info('  ${_makeQuery(exception)}\n');

    Debug.info(
      ' 💡 Tip: Use try/catch or custom error boundaries to gracefully handle this.',
    );
    Debug.info(
      '───────────────────────────────────────────────────────────────────────────────',
    );
  }

  static String _previewStack(String stack, [int lines = 5]) {
    final linesList = stack.split('\n');
    return linesList.take(lines).join('\n   ') +
        (linesList.length > lines ? '\n   ...' : '');
  }

  static String _makeQuery(String exception) {
    var cleaned = exception.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.length > 50) cleaned = cleaned.substring(0, 50);
    return "https://www.google.com/search?q=${Uri.encodeComponent('$cleaned in Flutter')}";
  }
}
