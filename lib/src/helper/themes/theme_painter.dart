part of 'package:flutter_addons/flutter_addons.dart';

/// Manages the application's theme settings, including colors and typography.
/// Implements the [SoulThemeEngine] interface for centralized theme handling.
///
/// This class is used to create a custom theme for the application.
class ThemePainter implements SoulThemeEngine {
  /// The primary color palette for theming.
  final Palette colors;

  /// The typography styles used in the theme.
  final Typography typography;

  ThemePainter(this.colors, [Typography? typography])
    : typography = typography ?? DefaultTypography();

  @override
  ColorScheme get colorScheme => colors.colorScheme;

  @override
  TextTheme get textTheme => typography.toTextTheme(colorScheme);

  @override
  ThemeData get themeData => _buildThemeData();

  ThemeData _buildThemeData() {
    return ThemeData(
      colorScheme: colorScheme,
      brightness: colorScheme.brightness,
      primaryColor: colorScheme.primary,
      scaffoldBackgroundColor: colorScheme.surface,
      highlightColor: colorScheme.primary.withValues(alpha: 0.15),
      dividerColor: colorScheme.onSecondaryContainer,
      fontFamily: typography.fontFamily,
      textTheme: textTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,

      /// AppBar styling
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 1,
        titleTextStyle: typography.titleSmall.copyWith(
          color: colorScheme.onPrimary,
        ),
        iconTheme: IconThemeData(color: colorScheme.onPrimary),
      ),

      /// Button theme for consistency across buttons
      buttonTheme: ButtonThemeData(
        buttonColor: colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: colorScheme.secondary,
          foregroundColor: colorScheme.onSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: .35,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),

      /// Card theme for standardization of card UI
      cardTheme: CardTheme(
        color: colorScheme.surfaceContainer,
        shadowColor: colorScheme.shadow,
        elevation: 0.25,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        clipBehavior: Clip.antiAlias,
      ),

      /// Input decoration for text fields
      inputDecorationTheme: InputDecorationTheme(
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
      ),
      dialogTheme: DialogTheme(
        backgroundColor: colorScheme.surfaceContainer,
        titleTextStyle: TextStyle(
          color: colorScheme.onSurface,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onPrimary,
        ),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: colorScheme.inverseSurface,
        contentTextStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onPrimary,
        ),
        dividerColor: colorScheme.outline,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: colorScheme.surface,
        textStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
        fillColor: WidgetStateProperty.all(colorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: colorScheme.surfaceContainer,
        disabledColor: colorScheme.onSurface,
        selectedColor: colorScheme.primaryContainer,
        secondarySelectedColor: colorScheme.primary.withAlpha(12),
        padding: EdgeInsets.all(4.0),
        labelStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onSurface,
        ),
        secondaryLabelStyle: textTheme.bodyMedium?.copyWith(
          color: colorScheme.onPrimary,
        ),
        brightness: colorScheme.brightness,
        shape: StadiumBorder(
          side: BorderSide(color: colorScheme.outline.withValues(alpha: .3)),
        ),
      ),

      /// Floating Action Button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
      ),
    );
  }
}
