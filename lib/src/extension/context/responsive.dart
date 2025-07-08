part of 'package:flutter_addons/flutter_addons.dart';

extension ResponsiveExtension on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get getWidth => screenSize.width;
  double get getHeight => screenSize.height;

  bool get isMobile => getWidth < Breakpoints.sm;

  bool get isTablet => getWidth >= Breakpoints.sm && getWidth < Breakpoints.md;

  bool get isLaptop => getWidth >= Breakpoints.md && getWidth < Breakpoints.lg;

  bool get isDesktop => getWidth >= Breakpoints.lg && getWidth < Breakpoints.xl;

  bool get isLargeDesktop => getWidth >= Breakpoints.xl;

  bool get isPortrait =>
      MediaQuery.of(this).orientation == Orientation.portrait;

  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;

  /// Combined helpers if you want to group them:
  bool get isSmallDevice => isMobile || isTablet;
  bool get isBigScreen => isLaptop || isDesktop || isLargeDesktop;
}

extension SafeAreaInsets on BuildContext {
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
  EdgeInsets get viewPadding => MediaQuery.of(this).padding;
  EdgeInsets get viewInsets => MediaQuery.of(this).viewInsets;
}
