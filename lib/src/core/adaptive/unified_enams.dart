part of 'package:flutter_addons/flutter_addons.dart';

enum ScaleMode { smart, design, percent }

/// Defines the operating platform the app is currently running on.
enum DeviceType { android, ios, fuchsia, web, windows, mac, linux }

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
enum ErrorScreenStyle {
  pixelArt,
  catHacker,
  frost,
  blueCrash,
  brokenRobot,
  simple,
  codeTerminal,
  sifi,
  theater,
  dessert,
  book,
}
