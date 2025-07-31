import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class AppLightColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.light;

  @override
  Color get background => Kolors.neutral50;            // #F9FAFB – soft white

  @override
  Color get cardBackground => Kolors.neutral100;       // #F1F5F9 – light card

  @override
  Color get dividerColor => Kolors.neutral200;         // #E5E7EB – subtle divider

  @override
  Color get foreground => Kolors.neutral900;           // #0F172A – strong text

  @override
  Color get inputBackground => Kolors.neutral100;      // matches card

  @override
  Color get outlineColor => Kolors.neutral300;         // #CBD5E1 – soft borders

  @override
  Color get primaryColor => Kolors.blue600;            // #2563EB – elegant blue

  @override
  Color get secondaryButton => Kolors.neutral300;      // #D1D5DB – ghost buttons

  @override
  Color get secondaryContent => Kolors.neutral600;     // #475569 – muted text

  @override
  Color get shadowColor => Kolors.neutral900.withOpacity(0.08);  // light shadow
}
class AppDarkColors extends ThemeKolors {
  @override
  Brightness get themeMode => Brightness.dark;

  @override
  Color get background => Kolors.neutral900;           // #0F172A – very dark blue-gray

  @override
  Color get cardBackground => Kolors.neutral800;       // #1E293B – dark card bg

  @override
  Color get dividerColor => Kolors.neutral700;         // #334155 – soft divider

  @override
  Color get foreground => Kolors.neutral100;           // #F1F5F9 – clean light text

  @override
  Color get inputBackground => Kolors.neutral800;      // consistent with card

  @override
  Color get outlineColor => Kolors.neutral600;         // #475569 – focus border

  @override
  Color get primaryColor => Kolors.emerald500;         // #10B981 – elegant accent

  @override
  Color get secondaryButton => Kolors.neutral700;      // #374151 – muted button

  @override
  Color get secondaryContent => Kolors.neutral400;     // #94A3B8 – faded content

  @override
  Color get shadowColor => Kolors.neutral900.withOpacity(0.5);  // subtle elevation
}
