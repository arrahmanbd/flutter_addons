part of 'package:flutter_addons/flutter_addons.dart';

/// Default implementation of SoulTypography
class DefaultTypography extends Typography {
  @override
  String get fontFamily => 'Roboto';

  @override
  TextStyle get bodyLarge =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodyMedium =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get bodySmall =>
      TextStyle(fontSize: 12.sp, fontStyle: FontStyle.normal);

  @override
  TextStyle get displayLarge =>
      TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold);

  @override
  TextStyle get displayMedium =>
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold);

  @override
  TextStyle get labelLarge =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w700);

  @override
  TextStyle get labelMedium =>
      TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600);

  @override
  TextStyle get labelSmall =>
      TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLarge =>
      TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700);

  @override
  TextStyle get titleMedium =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600);

  @override
  TextStyle get titleSmall =>
      TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500);
}
