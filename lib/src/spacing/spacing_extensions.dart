part of 'package:flutter_addons/flutter_addons.dart';

extension IntMarginPadding on int {
  // Margin
  EdgeInsets get m => EdgeInsets.all(pw); // margin all sides
  EdgeInsets get mt => EdgeInsets.only(top: ph); // margin top
  EdgeInsets get mb => EdgeInsets.only(bottom: ph); // margin bottom
  EdgeInsets get ml => EdgeInsets.only(left: pw); // margin left
  EdgeInsets get mr => EdgeInsets.only(right: pw); // margin right
  EdgeInsets get mx =>
      EdgeInsets.symmetric(horizontal: pw); // margin horizontal
  EdgeInsets get my => EdgeInsets.symmetric(vertical: ph); // margin vertical

  // Padding
  EdgeInsets get p => EdgeInsets.all(pw); // padding all sides
  EdgeInsets get pt => EdgeInsets.only(top: ph); // padding top
  EdgeInsets get pb => EdgeInsets.only(bottom: ph); // padding bottom
  EdgeInsets get pl => EdgeInsets.only(left: pw); // padding left
  EdgeInsets get pr => EdgeInsets.only(right: pw); // padding right
  EdgeInsets get px =>
      EdgeInsets.symmetric(horizontal: pw); // padding horizontal
  EdgeInsets get py => EdgeInsets.symmetric(vertical: ph); // padding vertical

  // SizedBox
  SizedBox get s =>
      SizedBox(height: ph, width: pw); // SizedBox with both height and width
}
