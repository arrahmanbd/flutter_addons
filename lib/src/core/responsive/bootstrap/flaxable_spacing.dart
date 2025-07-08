part of 'package:flutter_addons/flutter_addons.dart';

class FlexSpacing {
  static EdgeInsets zero = EdgeInsets.zero;

  static EdgeInsets only({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return EdgeInsets.only(left: left, right: right, top: top, bottom: bottom);
  }

  static EdgeInsets fromLTRB(
    double left,
    double top,
    double right,
    double bottom,
  ) {
    return FlexSpacing.only(bottom: bottom, top: top, right: right, left: left);
  }

  static EdgeInsets all(double spacing) {
    return FlexSpacing.only(
      bottom: spacing,
      top: spacing,
      right: spacing,
      left: spacing,
    );
  }

  static EdgeInsets left(double spacing) {
    return FlexSpacing.only(left: spacing);
  }

  static EdgeInsets nLeft(double spacing) {
    return FlexSpacing.only(top: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsets top(double spacing) {
    return FlexSpacing.only(top: spacing);
  }

  static EdgeInsets nTop(double spacing) {
    return FlexSpacing.only(left: spacing, bottom: spacing, right: spacing);
  }

  static EdgeInsets right(double spacing) {
    return FlexSpacing.only(right: spacing);
  }

  static EdgeInsets nRight(double spacing) {
    return FlexSpacing.only(top: spacing, bottom: spacing, left: spacing);
  }

  static EdgeInsets bottom(double spacing) {
    return FlexSpacing.only(bottom: spacing);
  }

  static EdgeInsets nBottom(double spacing) {
    return FlexSpacing.only(top: spacing, left: spacing, right: spacing);
  }

  static EdgeInsets horizontal(double spacing) {
    return FlexSpacing.only(left: spacing, right: spacing);
  }

  static EdgeInsets x(double spacing) {
    return FlexSpacing.only(left: spacing, right: spacing);
  }

  static EdgeInsets xy(double xSpacing, double ySpacing) {
    return FlexSpacing.only(
      left: xSpacing,
      right: xSpacing,
      top: ySpacing,
      bottom: ySpacing,
    );
  }

  static EdgeInsets y(double spacing) {
    return FlexSpacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsets vertical(double spacing) {
    return FlexSpacing.only(top: spacing, bottom: spacing);
  }

  static EdgeInsets symmetric({double vertical = 0, double horizontal = 0}) {
    return FlexSpacing.only(
      top: vertical,
      right: horizontal,
      left: horizontal,
      bottom: vertical,
    );
  }

  static SizedBox height(double height) {
    return SizedBox(height: height);
  }

  static double fullWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static SizedBox width(double width) {
    return SizedBox(width: width);
  }

  static Widget empty() {
    return SizedBox(width: 0, height: 0);
  }

  static double safeAreaTop(BuildContext context) {
    return MediaQuery.of(context).padding.top;
  }
}
