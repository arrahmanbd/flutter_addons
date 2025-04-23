part of 'package:flutter_addons/flutter_addons.dart';

/// **Theme-Aware Common Styles**
class Shapes {
  /// **Outline Border**
  static InputBorder flatBorder(BuildContext context, {Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(color: color ?? context.outline, width: 1),
    );
  }

  /// **Button Style**
  static ButtonStyle buttonStyle(BuildContext context, {Color? background}) {
    return ElevatedButton.styleFrom(
      backgroundColor: background ?? context.primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
    );
  }

  /// **Card Style**
  static BoxDecoration cardDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.cardBackground,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.05),
          spreadRadius: 1,
          blurRadius: 5,
        ),
      ],
    );
  }

  /// **Box Shadow**
  static List<BoxShadow> softShadow() {
    return [
      BoxShadow(
        color: Colors.black.withValues(alpha: 0.08),
        blurRadius: 6,
        spreadRadius: 1,
        offset: const Offset(2, 2),
      ),
    ];
  }
}
