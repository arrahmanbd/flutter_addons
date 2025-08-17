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
          if (enableDebugLogging) {
            _showDebugInfo(details);
          }
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

  static void _showDebugInfo(FlutterErrorDetails details) {
    if (!kDebugMode) return; // Only in debug mode

    final exception = details.exception.toString();
    final stack = details.stack?.toString() ?? 'No stack trace available';

    // Pick a random motivational quote
    final quote =
        AuthorSpeech.motivationalMessages[_random.nextInt(
          AuthorSpeech.motivationalMessages.length,
        )];

    // Header
    _printDivider('💡 DEBUG MOTIVATION', emoji: '💡', length: 80);
    Debug.log('💬 Quote: $quote');
    _printDivider('', emoji: '💡', length: 80);

    // Exception
    print('🚨 Exception:');
    print('  $exception\n');

    // Stack preview (first 5 lines)
    print('📝 Stack Trace (first 5 lines):');
    print('  ${_previewStack(stack)}\n');

    // Suggested search link
    print('🔍 Quick Search Suggestion:');
    print('  ${_makeQuery(exception)}\n');

    // Tip
    print(
      '💡 Tip: Use try/catch or custom error boundaries to gracefully handle errors.\n',
    );

    // Footer
    _printDivider('🏁 END OF ERROR REPORT', emoji: '🏁', length: 80);
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

  static void _printDivider(
    String title, {
    String emoji = '─',
    int length = 60,
  }) {
    final lineLength = ((length - title.length - 2) ~/ 2).clamp(0, length);
    final line = emoji * lineLength;
    print('$line $title $line');
  }
}
