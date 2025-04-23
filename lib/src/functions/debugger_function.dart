part of 'package:flutter_addons/flutter_addons.dart';

/// Log levels
enum LogLevel { debug, info, warning, error, success }

/// Global Debug utility
class Debug {
  static void log(Object? message, {LogLevel level = LogLevel.info}) {
    if (kReleaseMode) return; // Avoid logging in release mode

    String emoji;
    Color color;

    switch (level) {
      case LogLevel.debug:
        emoji = '🐞';
        color = Colors.blue;
        break;
      case LogLevel.info:
        emoji = '📢';
        color = Colors.green;
        break;
      case LogLevel.warning:
        emoji = '💡';
        color = Colors.orange;
        break;
      case LogLevel.error:
        emoji = '💥';
        color = Colors.red;
        break;
      case LogLevel.success:
        emoji = '🏆';
        color = Colors.lightGreen;
        break;
    }

    debugPrint('\x1B[38;5;${_ansiColor(color)}m$emoji $message\x1B[0m');
  }

  /// Log debug message
  static void bug(Object? message) => log(message, level: LogLevel.debug);

  /// Log info message
  static void info(Object? message) => log(message, level: LogLevel.info);

  /// Log warning message
  static void warning(Object? message) => log(message, level: LogLevel.warning);

  /// Log error message
  static void error(Object? message) => log(message, level: LogLevel.error);

  /// Log success message
  static void success(Object? message) => log(message, level: LogLevel.success);

  /// Convert MaterialColor to ANSI color code
  static int _ansiColor(Color color) {
    if (color == Colors.red) return 196;
    if (color == Colors.green) return 46;
    if (color == Colors.blue) return 21;
    if (color == Colors.orange) return 214;
    if (color == Colors.lightGreen) return 154;
    return 15; // Default white
  }
}

/// Easy access
void dbug(String? message) {
  // Regular expression to match file paths (package:some_package/some_file.dart:line_number:column_number)
  final filePathRegex = RegExp(r'(package:[\w\d_\-]+(?:/[\w\d_\-]+)+:\d+:\d+)');
  final highlightedMessage = message?.replaceAllMapped(
    filePathRegex,
    (match) => '\x1B[31m${match.group(0)}\x1B[0m',
  ); // Red for the error location
  return Debug.warning(highlightedMessage);
}

///usage
///Debug.bug("This is a bug message");
// Debug.info("This is an info message");
// Debug.warning("This is a warning message");
// Debug.error("This is an error message");
// Debug.success("This is a success message");
