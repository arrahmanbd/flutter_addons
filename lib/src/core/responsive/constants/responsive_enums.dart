part of 'package:flutter_addons/flutter_addons.dart';

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

/// Defines the orientation of the device.
