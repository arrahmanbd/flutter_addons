part of 'package:flutter_addons/flutter_addons.dart';

/// Enum for OS type.
enum OSType { android, ios, web, windows, mac, linux, fuchsia }

enum UiMessageType { snackbar, alert, bottomSheet }

/// Enum for screen type.
enum ScreenType { mobile, tablet, desktop }

enum ScaleMode { design, percent }

/// unified widget function
typedef ResponsiveBuilderType =
    Widget Function(
      BuildContext context,
      Orientation orientation,
      ScreenType screenType,
    );

/// error page design
enum ErrorScreen {
  pixelArt,
  catHacker,
  frost,
  winDeath,
  brokenRobot,
  simple,
  codeTerminal,
  sifi,
  theater,
  dessert,
  book,
}

enum ResponsiveTransition { fade, slide, scale, slideScale, rotation, flip }
