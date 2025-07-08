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
  bool? blur = false,
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
      child: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
          child: Container(
            color: Colors.white.withValues(alpha: 0.7),
            margin: EdgeInsets.only(top: topPadding),
            child: child,
          ),
        ),
      ),
    ),
  );
}
