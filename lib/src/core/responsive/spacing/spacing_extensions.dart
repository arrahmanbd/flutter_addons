part of 'package:flutter_addons/flutter_addons.dart';

/// Provides convenient spacing extensions on [num] for unified margin, padding,
/// and sized box creation using a fixed unit.
extension UnifiedMarginPadding on num {
  // ---------------------------
  // Margin extensions
  // ---------------------------

  /// All sides margin: `m`
  EdgeInsets get m => EdgeInsets.all(toDouble());

  /// Margin top only: `mt`
  EdgeInsets get mt => EdgeInsets.only(top: toDouble());

  /// Margin bottom only: `mb`
  EdgeInsets get mb => EdgeInsets.only(bottom: toDouble());

  /// Margin left only: `ml`
  EdgeInsets get ml => EdgeInsets.only(left: toDouble());

  /// Margin right only: `mr`
  EdgeInsets get mr => EdgeInsets.only(right: toDouble());

  /// Margin horizontal (left & right): `mx`
  EdgeInsets get mx => EdgeInsets.symmetric(horizontal: toDouble());

  /// Margin vertical (top & bottom): `my`
  EdgeInsets get my => EdgeInsets.symmetric(vertical: toDouble());

  // ---------------------------
  // Padding extensions
  // ---------------------------

  /// All sides padding: `p`
  EdgeInsets get p => EdgeInsets.all(toDouble());

  /// Padding top only: `pt`
  EdgeInsets get pt => EdgeInsets.only(top: toDouble());

  /// Padding bottom only: `pb`
  EdgeInsets get pb => EdgeInsets.only(bottom: toDouble());

  /// Padding left only: `pl`
  EdgeInsets get pl => EdgeInsets.only(left: toDouble());

  /// Padding right only: `pr`
  EdgeInsets get pr => EdgeInsets.only(right: toDouble());

  /// Padding horizontal (left & right): `px`
  EdgeInsets get px => EdgeInsets.symmetric(horizontal: toDouble());

  /// Padding vertical (top & bottom): `py`
  EdgeInsets get py => EdgeInsets.symmetric(vertical: toDouble());

  // ---------------------------
  // SizedBox extensions
  // ---------------------------

  /// Horizontal space: `sx`
  SizedBox get sx => SizedBox(width: toDouble());

  /// Vertical space: `sy`
  SizedBox get sy => SizedBox(height: toDouble());

  /// Square space: `s` (width & height)
  SizedBox get s => SizedBox(width: toDouble(), height: toDouble());
}
