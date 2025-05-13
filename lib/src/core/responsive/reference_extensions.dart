part of 'package:flutter_addons/flutter_addons.dart';
/// Provides `.w`, `.h`, `.ts` (text scale), and layout helpers on `num`.
extension ResponsiveScale on num {
  /// Responsive width (based on screen width or design frame)
  double get w => _safe(() => _DesignScale.instance.setWidth(this));

  /// Responsive height (based on screen height or design frame)
  double get h => _safe(() => _DesignScale.instance.setHeight(this));

  /// Responsive text size (uses min of width/height scaling)
  double get ts => _safe(() => _DesignScale.instance.setFont(this));

  /// Responsive scale (min of w and h)
  double get rs => min(w, h);

  /// Horizontal spacing using SizedBox
  SizedBox get horizontalSpace => SizedBox(width: w);

  /// Vertical spacing using SizedBox
  SizedBox get verticalSpace => SizedBox(height: h);

  // square box
  SizedBox get squareBox => SizedBox(width: w, height: h);


  T _safe<T>(T Function() compute) {
    try {
      return compute();
    } catch (e) {
      debugPrint('ResponsiveScale error: $e');
      rethrow;
    }
  }
}
