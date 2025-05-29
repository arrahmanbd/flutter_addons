part of 'package:flutter_addons/flutter_addons.dart';

/// Global Debug utility
class Debug {
  /// If true, prints only raw messages (no emoji, no colors, no formatting)
  static bool simple = false;

  /// If true, includes timestamp in log
  static bool showTimestamp = false;

  /// Logs a message with styling
  static void log(
    Object? message, {
    LogLevel level = LogLevel.info,
    String? tag,
    String? emoji,
    int? ansiColorCode,
  }) {
    if (kReleaseMode) return;

    if (simple) {
      debugPrint('$message');
      return;
    }

    final levelName = level.name.toUpperCase().padRight(7);
    final label = tag != null ? '[$tag] ' : '';
    final chosenEmoji =
        level == LogLevel.custom ? (emoji ?? '') : _emoji(level);
    final chosenColor =
        level == LogLevel.custom ? (ansiColorCode ?? 15) : _ansiColor(level);

    final timestamp = DateTime.now().toIso8601String();
    final ts = showTimestamp ? '$timestamp ➤ ' : '';
    final formatted =
        '\x1B[38;5;${chosenColor}m'
        '$chosenEmoji $levelName $label$ts$message'
        '\x1B[0m';

    debugPrint(formatted);
  }

  /// Log shortcuts
  static void bug(Object? message, {String? tag}) =>
      log(message, level: LogLevel.debug, tag: tag);
  static void info(Object? message, {String? tag}) =>
      log(message, level: LogLevel.info, tag: tag);
  static void warning(Object? message, {String? tag}) =>
      log(message, level: LogLevel.warning, tag: tag);
  static void error(Object? message, {String? tag}) =>
      log(message, level: LogLevel.error, tag: tag);
  static void success(Object? message, {String? tag}) =>
      log(message, level: LogLevel.success, tag: tag);

  static void custom(
    Object? message, {
    required String emoji,
    required int ansiColorCode,
    String? tag,
  }) => log(
    message,
    level: LogLevel.custom,
    emoji: emoji,
    ansiColorCode: ansiColorCode,
    tag: tag,
  );

  /// Emojis per level
  static String _emoji(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return '🐞';
      case LogLevel.info:
        return 'ℹ️';
      case LogLevel.warning:
        return '💡';
      case LogLevel.error:
        return '💥';
      case LogLevel.success:
        return '✅';
      case LogLevel.custom:
        return '';
    }
  }

  static int _ansiColor(LogLevel level) {
    switch (level) {
      case LogLevel.debug:
        return 244; // Soft gray (subtle, less distracting)
      case LogLevel.info:
        return 38; // Medium cyan (cool and calm)
      case LogLevel.warning:
        return 208; // Orange (warning alert, but not harsh)
      case LogLevel.error:
        return 196; // Bright red (critical error alert)
      case LogLevel.success:
        return 82; // Lime green (fresh and positive)
      case LogLevel.custom:
        return 15; // White (default)
    }
  }
}

/// Log levels
enum LogLevel { debug, info, warning, error, success, custom }

void debug(String? message, {String? tag}) {
  final filePathRegex = RegExp(r'(package:[\w\d_\-/]+\.dart:\d+:\d+)');

  final highlighted = message?.replaceAllMapped(
    filePathRegex,
    (match) => '\x1B[31m${match.group(0)}\x1B[0m', // Red color
  );

  Debug.warning(highlighted, tag: tag ?? 'Debug');
}
