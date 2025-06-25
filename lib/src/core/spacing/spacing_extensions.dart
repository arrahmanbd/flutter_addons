part of 'package:flutter_addons/flutter_addons.dart';

/// Unified spacing extensions using responsive scale units:
/// - `r` = uniform responsive unit (e.g., diagonal or average scale)
/// - `w` = responsive width unit
/// - `h` = responsive height unit
extension UnifiedMarginPadding on num {
  // Margin
  EdgeInsets get m => EdgeInsets.all(r); // margin all sides
  EdgeInsets get mt => EdgeInsets.only(top: h); // margin top
  EdgeInsets get mb => EdgeInsets.only(bottom: h); // margin bottom
  EdgeInsets get ml => EdgeInsets.only(left: w); // margin left
  EdgeInsets get mr => EdgeInsets.only(right: w); // margin right
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: w); // margin horizontal
  EdgeInsets get my => EdgeInsets.symmetric(vertical: h); // margin vertical

  // Padding
  EdgeInsets get p => EdgeInsets.all(r); // padding all sides
  EdgeInsets get pt => EdgeInsets.only(top: h); // padding top
  EdgeInsets get pb => EdgeInsets.only(bottom: h); // padding bottom
  EdgeInsets get pl => EdgeInsets.only(left: w); // padding left
  EdgeInsets get pr => EdgeInsets.only(right: w); // padding right
  EdgeInsets get px =>
      EdgeInsets.symmetric(horizontal: w); // padding horizontal
  EdgeInsets get py => EdgeInsets.symmetric(vertical: h); // padding vertical

  // SizedBox Spacing
  SizedBox get s => SizedBox(height: h, width: w);
  SizedBox get sx => SizedBox(width: w);
  SizedBox get sy => SizedBox(height: h);
}
