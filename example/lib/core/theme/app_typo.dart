import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts extends AppTypo {
  @override
  String get fontFamily => GoogleFonts.poppins().fontFamily!;

  @override
  TextStyle get bodyLarge =>
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get bodyMedium =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get bodySmall =>
      GoogleFonts.poppins(fontSize: 12.sp, fontWeight: FontWeight.w400);

  @override
  TextStyle get displayLarge =>
      GoogleFonts.poppins(fontSize: 34.sp, fontWeight: FontWeight.w700);

  @override
  TextStyle get displayMedium =>
      GoogleFonts.poppins(fontSize: 28.sp, fontWeight: FontWeight.w600);

  @override
  TextStyle get labelLarge =>
      GoogleFonts.poppins(fontSize: 18.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get labelMedium =>
      GoogleFonts.poppins(fontSize: 16.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get labelSmall =>
      GoogleFonts.poppins(fontSize: 14.sp, fontWeight: FontWeight.w500);

  @override
  TextStyle get titleLarge =>
      GoogleFonts.poppins(fontSize: 24.sp, fontWeight: FontWeight.w700);

  @override
  TextStyle get titleMedium =>
      GoogleFonts.poppins(fontSize: 22.sp, fontWeight: FontWeight.w600);

  @override
  TextStyle get titleSmall =>
      GoogleFonts.poppins(fontSize: 20.sp, fontWeight: FontWeight.w600);
}
