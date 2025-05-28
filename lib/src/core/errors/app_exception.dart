part of 'package:flutter_addons/flutter_addons.dart';

class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final ErrorMapper errorMapper;

  AppException(this.message, [this.stackTrace, ErrorMapper? errorMapper])
    : errorMapper = errorMapper ?? DefaultErrorMapper();

  @override
  String toString() {
    return message;
  }

  // Factory constructor to create an AppException based on the error and stack trace
  factory AppException.fromError(
    Exception error, {
    StackTrace? stackTrace,
    required ErrorMapper errorMapper,
  }) {
    final message = errorMapper.mapError(error, stackTrace);
    return AppException(message, stackTrace, errorMapper);
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
          Debug.error('💥 Exception: ${details.exception}');
          Debug.info('🔍 Help: ${_makeQuery(details.exception.toString())}');
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
