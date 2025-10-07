part of 'package:flutter_addons/flutter_addons.dart';

/// Using Console Logger for colorful and structured logging in the console.
/// Supports different log levels, section headers, key-value pairs, and more.
/// Inspired by various logging libraries but implemented from scratch for simplicity.
/// 
/// 
/// 
// class _LogUtility {
//   static void logDesignUtilsInit({
//     required double designWidth,
//     required double designHeight,
//     required double screenWidth,
//     required double screenHeight,
//     required double scaleWidth,
//     required double scaleHeight,
//     required String mode,
//   }) {
//     const reset = '\x1B[0m';
//     const bold = '\x1B[1m';
//     const cyan = '\x1B[36m';
//     const yellow = '\x1B[33m';
//     const green = '\x1B[32m';
//     const magenta = '\x1B[35m';
//     if (kDebugMode) {
//       print('''
// $bold$cyan━━━━━━━━━━━━━━━[ DesignUtils Initialized ]━━━━━━━━━━━━━━━$reset
// ${yellow}Scale Mode : $reset($magenta$mode$reset)
// ${yellow}Design Size : $reset($green$designWidth$reset, $green$designHeight$reset)
// ${yellow}Screen Size : $reset($green$screenWidth$reset, $green$screenHeight$reset)
// ${yellow}Scale Factor: $reset($magenta$scaleWidth$reset, $magenta$scaleHeight$reset)
// $cyan━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$reset
// ''');
//     }
//   }
// }


class ConsoleLogger {
  // ANSI color codes
  static const String _reset = '\x1B[0m';
  static const String _bold = '\x1B[1m';
  static const String _black = '\x1B[30m';
  static const String _red = '\x1B[31m';
  static const String _green = '\x1B[32m';
  static const String _yellow = '\x1B[33m';
  static const String _blue = '\x1B[34m';
  static const String _magenta = '\x1B[35m';
  static const String _cyan = '\x1B[36m';
  static const String _white = '\x1B[37m';
  
  // static const String _bgBlack = '\x1B[40m';
  // static const String _bgRed = '\x1B[41m';
  // static const String _bgGreen = '\x1B[42m';
  // static const String _bgYellow = '\x1B[43m';
  // static const String _bgBlue = '\x1B[44m';
  // static const String _bgMagenta = '\x1B[45m';
  // static const String _bgCyan = '\x1B[46m';
  // static const String _bgWhite = '\x1B[47m';

  // Log levels
  static const int _levelDebug = 0;
  static const int _levelInfo = 1;
  static const int _levelWarning = 2;
  static const int _levelError = 3;

  static bool _enabled = true;
  static int _minLogLevel = _levelDebug;

  /// Enable or disable all logging
  static void setEnabled(bool enabled) {
    _enabled = enabled;
  }

  /// Set minimum log level to display
  static void setMinLogLevel(int level) {
    _minLogLevel = level;
  }

  /// Your original design utils log method
  static void logDesignUtilsInit({
    required double designWidth,
    required double designHeight,
    required double screenWidth,
    required double screenHeight,
    required double scaleWidth,
    required double scaleHeight,
    required String mode,
  }) {
    if (!_enabled || !kDebugMode) return;

    if (kDebugMode) {
      print('''
$_bold$_cyan━━━━━━━━━━━━━━━[ DesignUtils Initialized ]━━━━━━━━━━━━━━━$_reset
${_yellow}Scale Mode : $_reset($_magenta$mode$_reset)
${_yellow}Design Size : $_reset($_green$designWidth$_reset, $_green$designHeight$_reset)
${_yellow}Screen Size : $_reset($_green$screenWidth$_reset, $_green$screenHeight$_reset)
${_yellow}Scale Factor: $_reset($_magenta$scaleWidth$_reset, $_magenta$scaleHeight$_reset)
$_cyan━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$_reset
''');
    }
  }

  /// General purpose debug log
  static void debug(String message, {String tag = 'DEBUG'}) {
    if (_enabled && _minLogLevel <= _levelDebug && kDebugMode) {
      if (kDebugMode) {
        print('$_bold$_blue[$tag]$_reset $message');
      }
    }
  }

  /// Info log
  static void info(String message, {String tag = 'INFO'}) {
    if (_enabled && _minLogLevel <= _levelInfo && kDebugMode) {
      if (kDebugMode) {
        print('$_bold$_green[$tag]$_reset $message');
      }
    }
  }

  /// Warning log
  static void warning(String message, {String tag = 'WARNING'}) {
    if (_enabled && _minLogLevel <= _levelWarning && kDebugMode) {
      if (kDebugMode) {
        print('$_bold$_yellow[$tag]$_reset $message');
      }
    }
  }

  /// Error log
  static void error(String message, {String tag = 'ERROR'}) {
    if (_enabled && _minLogLevel <= _levelError && kDebugMode) {
      if (kDebugMode) {
        print('$_bold$_red[$tag]$_reset $message');
      }
    }
  }

  /// Success log
  static void success(String message, {String tag = 'SUCCESS'}) {
    if (_enabled && kDebugMode) {
      if (kDebugMode) {
        print('$_bold$_green[$tag]$_reset $message');
      }
    }
  }

  /// Section header for organized logging
  static void section(String title, {String color = 'cyan'}) {
    if (!_enabled || !kDebugMode) return;

    final colorCode = _getColorCode(color);
    final line = '━' * (title.length + 10);
    if (kDebugMode) {
      print('$_bold$colorCode$line$_reset');
    }
    if (kDebugMode) {
      print('$_bold$colorCode     $title     $_reset');
    }
    if (kDebugMode) {
      print('$_bold$colorCode$line$_reset');
    }
  }

  /// Key-value pair logging
  static void keyValue(String key, dynamic value, {String keyColor = 'yellow', String valueColor = 'green'}) {
    if (!_enabled || !kDebugMode) return;

    final keyColorCode = _getColorCode(keyColor);
    final valueColorCode = _getColorCode(valueColor);
    if (kDebugMode) {
      print('$keyColorCode$key: $_reset$valueColorCode$value$_reset');
    }
  }

  /// Colorful separator line
  static void separator({String color = 'cyan', int length = 50}) {
    if (!_enabled || !kDebugMode) return;

    final colorCode = _getColorCode(color);
    final line = '━' * length;
    if (kDebugMode) {
      print('$_bold$colorCode$line$_reset');
    }
  }

  /// Helper method to get color code from string
  static String _getColorCode(String color) {
    switch (color.toLowerCase()) {
      case 'black': return _black;
      case 'red': return _red;
      case 'green': return _green;
      case 'yellow': return _yellow;
      case 'blue': return _blue;
      case 'magenta': return _magenta;
      case 'cyan': return _cyan;
      case 'white': return _white;
      default: return _white;
    }
  }
}

// Extension for easy logging on any object
extension LogExtension on Object {
  void logDebug([String tag = 'DEBUG']) {
    ConsoleLogger.debug(toString(), tag: tag);
  }

  void logInfo([String tag = 'INFO']) {
    ConsoleLogger.info(toString(), tag: tag);
  }

  void logWarning([String tag = 'WARNING']) {
    ConsoleLogger.warning(toString(), tag: tag);
  }

  void logError([String tag = 'ERROR']) {
    ConsoleLogger.error(toString(), tag: tag);
  }

  void logSuccess([String tag = 'SUCCESS']) {
    ConsoleLogger.success(toString(), tag: tag);
  }
}


/// Example usage:
/// ```dart
// New helper methods
// ConsoleLogger.debug('This is a debug message');
// ConsoleLogger.info('App started successfully');
// ConsoleLogger.warning('This feature is deprecated');
// ConsoleLogger.error('Network request failed');
// ConsoleLogger.success('User logged in successfully');

// // Using extensions
// 'User data loaded'.logInfo('AUTH');
// 'Cache cleared'.logSuccess('STORAGE');

// // Section headers
// ConsoleLogger.section('API Configuration');

// // Key-value logging
// ConsoleLogger.keyValue('API Base URL', 'https://api.example.com');
// ConsoleLogger.keyValue('Timeout', '30s');

// // Separators
// ConsoleLogger.separator(color: 'magenta', length: 30);`