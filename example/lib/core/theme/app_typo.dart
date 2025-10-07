import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts extends BrandTypo {
  @override
  String get fontFamily => GoogleFonts.ubuntu().fontFamily!;

  @override
  TextStyle get bodyLarge =>
      GoogleFonts.ubuntu(fontSize: 16.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get bodyMedium =>
      GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get bodySmall =>
      GoogleFonts.ubuntu(fontSize: 12.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get displayLarge =>
      GoogleFonts.ubuntu(fontSize: 34.sp, fontWeight: FontWeight.w700);

  @override
  TextStyle get displayMedium =>
      GoogleFonts.ubuntu(fontSize: 28.sp, fontWeight: FontWeight.w600);

  @override
  TextStyle get labelLarge =>
      GoogleFonts.ubuntu(fontSize: 18.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get labelMedium =>
      GoogleFonts.ubuntu(fontSize: 16.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get labelSmall =>
      GoogleFonts.ubuntu(fontSize: 14.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLarge =>
      GoogleFonts.ubuntu(fontSize: 24.sp, fontWeight: FontWeight.w700);

  @override
  TextStyle get titleMedium =>
      GoogleFonts.ubuntu(fontSize: 22.sp, fontWeight: FontWeight.w600);

  @override
  TextStyle get titleSmall =>
      GoogleFonts.ubuntu(fontSize: 20.sp, fontWeight: FontWeight.w600);
}
