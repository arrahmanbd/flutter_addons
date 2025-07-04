part of 'package:flutter_addons/flutter_addons.dart';

enum ScaleMode { smart, design, percent }

/// Defines the operating platform the app is currently running on.
enum OSType { android, ios, fuchsia, web, windows, mac, linux, unknown }

/// Defines the general screen size category for the current device.
enum ScreenType { mobile, tablet, desktop }

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

/// Defines the orientation of the device.
