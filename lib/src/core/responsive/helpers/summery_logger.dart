part of 'package:flutter_addons/flutter_addons.dart';

class _LogUtility {
  static void logDesignUtilsInit({
    required double designWidth,
    required double designHeight,
    required double screenWidth,
    required double screenHeight,
    required double scaleWidth,
    required double scaleHeight,
    required String mode,
  }) {
    const reset = '\x1B[0m';
    const bold = '\x1B[1m';
    const cyan = '\x1B[36m';
    const yellow = '\x1B[33m';
    const green = '\x1B[32m';
    const magenta = '\x1B[35m';
    if (kDebugMode) {
      print('''
$bold$cyan━━━━━━━━━━━━━━━[ DesignUtils Initialized ]━━━━━━━━━━━━━━━$reset
${yellow}Scale Mode : $reset($magenta$mode$reset)
${yellow}Design Size : $reset($green$designWidth$reset, $green$designHeight$reset)
${yellow}Screen Size : $reset($green$screenWidth$reset, $green$screenHeight$reset)
${yellow}Scale Factor: $reset($magenta$scaleWidth$reset, $magenta$scaleHeight$reset)
$cyan━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━$reset
''');
    }
  }
}
