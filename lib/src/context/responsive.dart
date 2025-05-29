part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on `BuildContext` for screen size and platform breakpoints.
extension ResponsiveExtension on BuildContext {
  double get getWidth => MediaQuery.of(this).size.width;
  double get getHeight => MediaQuery.of(this).size.height;
  double get _shortestSide => MediaQuery.of(this).size.shortestSide;

  bool get isTablet => _shortestSide >= 600;

  bool get isDesktop =>
      getWidth >= 992 &&
      defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS;

  bool get isMobile => !isTablet && !isDesktop;

  bool get isSm => getWidth >= 576 && getWidth < 768;
  bool get isMd => getWidth >= 768 && getWidth < 992;
  bool get isLg => getWidth >= 992 && getWidth < 1200;
  bool get isXl => getWidth >= 1200;
}

extension DeviceContext on BuildContext {
  Orientation get orientation => MediaQuery.of(this).orientation;
  bool get isPortrait => orientation == Orientation.portrait;
  bool get isLandscape => orientation == Orientation.landscape;

  /// Returns true if the keyboard is currently open.
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
}

extension SafeAreaInsets on BuildContext {
  EdgeInsets get viewPadding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}
