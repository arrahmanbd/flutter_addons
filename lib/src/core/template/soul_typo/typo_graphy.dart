part of 'package:flutter_addons/flutter_addons.dart';

class DefaultTypography extends Typography {
  @override
  String get fontFamily => 'Roboto';

  @override
  TextStyle get bodyText =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get bodySmall =>
      TextStyle(fontSize: 16.sp, fontStyle: FontStyle.normal);

  @override
  TextStyle get titleText =>
      TextStyle(fontSize: 36.sp, fontWeight: FontWeight.bold);

  @override
  TextStyle get displayText =>
      TextStyle(fontSize: 28.sp, fontWeight: FontWeight.bold);

  @override
  TextStyle get labelText =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w700);
}
