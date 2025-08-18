part of 'package:flutter_addons/flutter_addons.dart';

// Functional widget that provides responsive metadata (device, orientation, screen)
/// and allows building adaptive layouts with a single builder function.

class MediaInfo {
  final BuildContext context;
  final bool isLandscape;
  final bool isPortrait;
  final bool isMobile;
  final bool isTablet;
  final bool isDesktop;

  const MediaInfo({
    required this.context,
    required this.isLandscape,
    required this.isPortrait,
    required this.isMobile,
    required this.isTablet,
    required this.isDesktop,
  });
  factory MediaInfo.fromBaseContext(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final orientation = mediaQuery.orientation;
    final width = mediaQuery.size.width;
    return MediaInfo(
      context: context,
      isLandscape: orientation == Orientation.landscape,
      isPortrait: orientation == Orientation.portrait,
      isMobile: width < 600, // Mobile if width < 600
      isTablet: width >= 600 && width < 1200, // Tablet if 600 <= width < 1200
      isDesktop: width >= 1200, // Desktop if width >= 1200
    );
  }

  factory MediaInfo.fromThis(BuildContext context) {
    return MediaInfo(
      context: context,
      isLandscape: _ScreenUtils.orientation == Orientation.landscape,
      isPortrait: _ScreenUtils.orientation == Orientation.portrait,
      isMobile: _ScreenUtils._screenType == ScreenType.mobile,
      isTablet: _ScreenUtils._screenType == ScreenType.tablet,
      isDesktop: _ScreenUtils._screenType == ScreenType.desktop,
    );
  }
}
