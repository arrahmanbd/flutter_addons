part of 'package:flutter_addons/flutter_addons.dart';

/// Unified spacing extensions using responsive scale unit (r)
extension UnifiedMarginPadding on int {
  // Margin
  EdgeInsets get m => EdgeInsets.all(r); // margin all sides
  EdgeInsets get mt => EdgeInsets.only(top: r); // margin top
  EdgeInsets get mb => EdgeInsets.only(bottom: r); // margin bottom
  EdgeInsets get ml => EdgeInsets.only(left: r); // margin left
  EdgeInsets get mr => EdgeInsets.only(right: r); // margin right
  EdgeInsets get mx =>
      EdgeInsets.symmetric(horizontal: r); // margin horizontal (x)
  EdgeInsets get my => EdgeInsets.symmetric(vertical: r); // margin vertical (y)

  // Padding
  EdgeInsets get p => EdgeInsets.all(r); // padding all sides
  EdgeInsets get pt => EdgeInsets.only(top: r); // padding top
  EdgeInsets get pb => EdgeInsets.only(bottom: r); // padding bottom
  EdgeInsets get pl => EdgeInsets.only(left: r); // padding left
  EdgeInsets get pr => EdgeInsets.only(right: r); // padding right
  EdgeInsets get px =>
      EdgeInsets.symmetric(horizontal: r); // padding horizontal (x)
  EdgeInsets get py =>
      EdgeInsets.symmetric(vertical: r); // padding vertical (y)

  // Unified square SizedBox
  SizedBox get s => SizedBox(height: r, width: r);
}
