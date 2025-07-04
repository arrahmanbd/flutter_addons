part of 'package:flutter_addons/flutter_addons.dart';

/// Unified spacing extensions using responsive scale units:
/// - `r` = uniform responsive unit (e.g., diagonal or average scale)
/// - `w` = responsive width unit
/// - `h` = responsive height unit
extension UnifiedMarginPadding on num {
  // Margin
  EdgeInsets get m => EdgeInsets.symmetric(horizontal: w, vertical: h);
  EdgeInsets get mt => EdgeInsets.only(top: h);
  EdgeInsets get mb => EdgeInsets.only(bottom: h);
  EdgeInsets get ml => EdgeInsets.only(left: w);
  EdgeInsets get mr => EdgeInsets.only(right: w);
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: w);
  EdgeInsets get my => EdgeInsets.symmetric(vertical: h);

  // Padding
  EdgeInsets get p => EdgeInsets.symmetric(horizontal: w, vertical: h);
  EdgeInsets get pt => EdgeInsets.only(top: h);
  EdgeInsets get pb => EdgeInsets.only(bottom: h);
  EdgeInsets get pl => EdgeInsets.only(left: w);
  EdgeInsets get pr => EdgeInsets.only(right: w);
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: w);
  EdgeInsets get py => EdgeInsets.symmetric(vertical: h);

  // SizedBox
  SizedBox get sx => SizedBox(width: w);
  SizedBox get sy => SizedBox(height: h);
  SizedBox get s => SizedBox(height: h); // safer to pick vertical default
}
