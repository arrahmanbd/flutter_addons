part of 'package:flutter_addons/flutter_addons.dart';

/// Unified spacing extensions using responsive scale unit (rs)
extension UnifiedMarginPadding on int {
  // Margin
  EdgeInsets get m => EdgeInsets.all(rs);            // margin all sides
  EdgeInsets get mt => EdgeInsets.only(top: rs);     // margin top
  EdgeInsets get mb => EdgeInsets.only(bottom: rs);  // margin bottom
  EdgeInsets get ml => EdgeInsets.only(left: rs);    // margin left
  EdgeInsets get mr => EdgeInsets.only(right: rs);   // margin right
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: rs); // margin horizontal (x)
  EdgeInsets get my => EdgeInsets.symmetric(vertical: rs);   // margin vertical (y)

  // Padding
  EdgeInsets get p => EdgeInsets.all(rs);            // padding all sides
  EdgeInsets get pt => EdgeInsets.only(top: rs);     // padding top
  EdgeInsets get pb => EdgeInsets.only(bottom: rs);  // padding bottom
  EdgeInsets get pl => EdgeInsets.only(left: rs);    // padding left
  EdgeInsets get pr => EdgeInsets.only(right: rs);   // padding right
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: rs); // padding horizontal (x)
  EdgeInsets get py => EdgeInsets.symmetric(vertical: rs);   // padding vertical (y)


  // Unified square SizedBox
  SizedBox get s => SizedBox(height: rs, width: rs);
}
