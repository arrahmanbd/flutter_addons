part of 'package:flutter_addons/flutter_addons.dart';

/// A customizable AppBar widget with support for safe area padding,
/// transparency, status bar styling, and height configuration.

PreferredSize buildNewAppBar(
  BuildContext context, {
  required Widget child,
  bool applySafeAreaPadding = true,
  double height = 60.0,
  Color? statusBarColor,
  Brightness? statusBarIconBrightness,
}) {
  final double topPadding =
      applySafeAreaPadding ? context.viewPadding.top : 0.0;

  final brightness =
      statusBarIconBrightness ??
      (Theme.of(context).brightness == Brightness.dark
          ? Brightness.light
          : Brightness.dark);

  final style = SystemUiOverlayStyle(
    statusBarColor: statusBarColor ?? Colors.transparent,
    statusBarIconBrightness: brightness,
    statusBarBrightness:
        brightness == Brightness.dark ? Brightness.light : Brightness.dark,
  );

  return PreferredSize(
    preferredSize: Size.fromHeight(height.h),
    child: AnnotatedRegion<SystemUiOverlayStyle>(
      value: style,
      child: Container(margin: EdgeInsets.only(top: topPadding), child: child),
    ),
  );
}
