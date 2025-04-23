part of 'package:flutter_addons/flutter_addons.dart';

extension IntMarginPadding on int {
  // Margin
  EdgeInsets get m => EdgeInsets.all(w); // margin all sides
  EdgeInsets get mt => EdgeInsets.only(top: h); // margin top
  EdgeInsets get mb => EdgeInsets.only(bottom: h); // margin bottom
  EdgeInsets get ml => EdgeInsets.only(left: w); // margin left
  EdgeInsets get mr => EdgeInsets.only(right: w); // margin right
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: w); // margin horizontal
  EdgeInsets get my => EdgeInsets.symmetric(vertical: h); // margin vertical

  // Padding
  EdgeInsets get p => EdgeInsets.all(w); // padding all sides
  EdgeInsets get pt => EdgeInsets.only(top: h); // padding top
  EdgeInsets get pb => EdgeInsets.only(bottom: h); // padding bottom
  EdgeInsets get pl => EdgeInsets.only(left: w); // padding left
  EdgeInsets get pr => EdgeInsets.only(right: w); // padding right
  EdgeInsets get px =>
      EdgeInsets.symmetric(horizontal: w); // padding horizontal
  EdgeInsets get py => EdgeInsets.symmetric(vertical: h); // padding vertical

  // SizedBox
  SizedBox get s =>
      SizedBox(height: h, width: w); // SizedBox with both height and width
}
