part of 'package:flutter_addons/flutter_addons.dart';

extension SizeExtension on num {
  ///[UIUtils.setWidth]
  double get w => UIUtils().setWidth(this);

  ///[UIUtils.setHeight]
  double get h => UIUtils().setHeight(this);

  ///[UIUtils.radius]
  double get r => UIUtils().radius(this);

  ///[UIUtils.diagonal]
  double get dg => UIUtils().diagonal(this);

  ///[UIUtils.diameter]
  double get dm => UIUtils().diameter(this);

  ///[UIUtils.setSp]
  double get sp => UIUtils().setSp(this);

  ///smart size :  it check your value - if it is bigger than your value it will set your value
  ///for example, you have set 16.sm() , if for your screen 16.sp() is bigger than 16 , then it will set 16 not 16.sp()
  ///I think that it is good for save size balance on big sizes of screen
  double get spMin => min(toDouble(), sp);

  @Deprecated('use spMin instead')
  double get sm => min(toDouble(), sp);

  double get spMax => max(toDouble(), sp);

  ///屏幕宽度的倍数
  ///Multiple of screen width
  double get sw => UIUtils().screenWidth * this;

  ///屏幕高度的倍数
  ///Multiple of screen height
  double get sh => UIUtils().screenHeight * this;

  ///[UIUtils.setHeight]
  SizedBox get verticalSpace => UIUtils().setVerticalSpacing(this);

  ///[UIUtils.setVerticalSpacingFromWidth]
  SizedBox get verticalSpaceFromWidth =>
      UIUtils().setVerticalSpacingFromWidth(this);

  ///[UIUtils.setWidth]
  SizedBox get horizontalSpace => UIUtils().setHorizontalSpacing(this);

  ///[UIUtils.radius]
  SizedBox get horizontalSpaceRadius =>
      UIUtils().setHorizontalSpacingRadius(this);

  ///[UIUtils.radius]
  SizedBox get verticalSpacingRadius =>
      UIUtils().setVerticalSpacingRadius(this);

  ///[UIUtils.diameter]
  SizedBox get horizontalSpaceDiameter =>
      UIUtils().setHorizontalSpacingDiameter(this);

  ///[UIUtils.diameter]
  SizedBox get verticalSpacingDiameter =>
      UIUtils().setVerticalSpacingDiameter(this);

  ///[UIUtils.diagonal]
  SizedBox get horizontalSpaceDiagonal =>
      UIUtils().setHorizontalSpacingDiagonal(this);

  ///[UIUtils.diagonal]
  SizedBox get verticalSpacingDiagonal =>
      UIUtils().setVerticalSpacingDiagonal(this);
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r =>
      copyWith(top: top.r, bottom: bottom.r, right: right.r, left: left.r);

  EdgeInsets get dm =>
      copyWith(top: top.dm, bottom: bottom.dm, right: right.dm, left: left.dm);

  EdgeInsets get dg =>
      copyWith(top: top.dg, bottom: bottom.dg, right: right.dg, left: left.dg);

  EdgeInsets get w =>
      copyWith(top: top.w, bottom: bottom.w, right: right.w, left: left.w);

  EdgeInsets get h =>
      copyWith(top: top.h, bottom: bottom.h, right: right.h, left: left.h);
}

extension BorderRadiusExtension on BorderRadius {
  /// Creates adapt BorderRadius using r [SizeExtension].
  BorderRadius get r => copyWith(
    bottomLeft: bottomLeft.r,
    bottomRight: bottomRight.r,
    topLeft: topLeft.r,
    topRight: topRight.r,
  );

  BorderRadius get w => copyWith(
    bottomLeft: bottomLeft.w,
    bottomRight: bottomRight.w,
    topLeft: topLeft.w,
    topRight: topRight.w,
  );

  BorderRadius get h => copyWith(
    bottomLeft: bottomLeft.h,
    bottomRight: bottomRight.h,
    topLeft: topLeft.h,
    topRight: topRight.h,
  );
}

extension RadiusExtension on Radius {
  /// Creates adapt Radius using r [SizeExtension].
  Radius get r => Radius.elliptical(x.r, y.r);

  Radius get dm => Radius.elliptical(x.dm, y.dm);

  Radius get dg => Radius.elliptical(x.dg, y.dg);

  Radius get w => Radius.elliptical(x.w, y.w);

  Radius get h => Radius.elliptical(x.h, y.h);
}

extension BoxConstraintsExtension on BoxConstraints {
  /// Creates adapt BoxConstraints using r [SizeExtension].
  BoxConstraints get r => copyWith(
    maxHeight: maxHeight.r,
    maxWidth: maxWidth.r,
    minHeight: minHeight.r,
    minWidth: minWidth.r,
  );

  /// Creates adapt BoxConstraints using h-w [SizeExtension].
  BoxConstraints get hw => copyWith(
    maxHeight: maxHeight.h,
    maxWidth: maxWidth.w,
    minHeight: minHeight.h,
    minWidth: minWidth.w,
  );

  BoxConstraints get w => copyWith(
    maxHeight: maxHeight.w,
    maxWidth: maxWidth.w,
    minHeight: minHeight.w,
    minWidth: minWidth.w,
  );

  BoxConstraints get h => copyWith(
    maxHeight: maxHeight.h,
    maxWidth: maxWidth.h,
    minHeight: minHeight.h,
    minWidth: minWidth.h,
  );
}
