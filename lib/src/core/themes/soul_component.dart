part of 'package:flutter_addons/flutter_addons.dart';

/// A helper class to manage component themes.
class SoulComponentThemes {
  final ColorScheme colorScheme;
  final TextTheme textTheme;

  SoulComponentThemes({required this.colorScheme, required this.textTheme});

  /// Returns a configured AppBar theme.
  AppBarTheme get appBarTheme => AppBarTheme(
    backgroundColor: colorScheme.primary,
    foregroundColor: colorScheme.onPrimary,
    elevation: 1,
    titleTextStyle: textTheme.titleMedium?.copyWith(
      color: colorScheme.onPrimary,
    ),
    iconTheme: IconThemeData(color: colorScheme.onPrimary),
  );

  /// Returns a configured Button theme.
  ButtonThemeData get buttonTheme => ButtonThemeData(
    buttonColor: colorScheme.primary,
    textTheme: ButtonTextTheme.primary,
  );

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      backgroundColor: colorScheme.secondary,
      foregroundColor: colorScheme.onSecondary,
    ),
  );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      elevation: .35,
    ),
  );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      side: BorderSide(color: colorScheme.primary),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
    ),
  );

  /// Returns a configured Card theme.
  CardTheme get cardTheme => CardTheme(
    color: colorScheme.surfaceContainer,
    shadowColor: colorScheme.shadow,
    elevation: 0.25,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    clipBehavior: Clip.antiAlias,
  );

  /// Returns a configured Input Decoration theme.
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceContainerLow,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12.0),
      borderSide: BorderSide(color: colorScheme.surfaceContainerLowest),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: colorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(color: colorScheme.primary),
    ),
  );

  DialogTheme get dialogTheme => DialogTheme(
    backgroundColor: colorScheme.surfaceContainer,
    titleTextStyle: TextStyle(
      color: colorScheme.onSurface,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
    ),
  );

  SnackBarThemeData get snackBarTheme => SnackBarThemeData(
    backgroundColor: colorScheme.inverseSurface,
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onPrimary,
    ),
  );

  MaterialBannerThemeData get bannerTheme => MaterialBannerThemeData(
    backgroundColor: colorScheme.inverseSurface,
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onPrimary,
    ),
    dividerColor: colorScheme.outline,
  );

  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
      );

  PopupMenuThemeData get popupMenuTheme => PopupMenuThemeData(
    color: colorScheme.surface,
    textStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
  );

  CheckboxThemeData get checkboxTheme => CheckboxThemeData(
    checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
    fillColor: WidgetStateProperty.all(colorScheme.primary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
  );

  ChipThemeData get chipTheme => ChipThemeData(
    backgroundColor: colorScheme.surfaceContainer,
    disabledColor: colorScheme.onSurface,
    selectedColor: colorScheme.primaryContainer,
    secondarySelectedColor: colorScheme.primary.withAlpha(12),
    padding: EdgeInsets.all(4.0),
    labelStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
    secondaryLabelStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onPrimary,
    ),
    brightness: colorScheme.brightness,
    shape: StadiumBorder(
      side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.3)),
    ),
  );

  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
      );
}
