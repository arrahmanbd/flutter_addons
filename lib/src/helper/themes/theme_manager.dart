part of 'package:flutter_addons/flutter_addons.dart';

/// Manages the application's theme, including color schemes and text styles.
/// Implements the [ThemeEngine] interface.
class ThemeManager implements ThemeEngine {
  /// The current theme mode (light, dark, or system default).
  final ThemeMode mode;

  /// The primary color palette used in the theme.
  final Palette colors;

  /// The text theme for typography styling.
  final TextTheme? texts;

  /// A list of primary colors, which can be used for dynamic theme switching.
  final List<Palette>? primaryColors;

  /// Constructor for [ThemeManager], allowing customization of theme properties.
  ThemeManager(
    this.colors, {
    this.texts,
    this.mode = ThemeMode.system,
    this.primaryColors,
  });

  /// Returns the color scheme associated with the current theme.
  @override
  ColorScheme get colorSchema => colors.colorScheme;

  /// Returns the text theme, defaulting to system light/dark mode if not specified.
  @override
  TextTheme get textStyles =>
      texts ??
      (colors.colorScheme.brightness == Brightness.dark
          ? ThemeData.dark().textTheme
          : ThemeData.light().textTheme);

  /// Generates and returns the [ThemeData] for the application.
  @override
  ThemeData get themeData => _generateTheme(colors);

  /// Generates the theme data based on the provided color palette.
  ThemeData _generateTheme(Palette palette) {
    return ThemeData(
      colorScheme: palette.colorScheme,
      brightness: palette.colorScheme.brightness,
      primaryColor: palette.colorScheme.primary,
      primaryColorDark: palette.colorScheme.onPrimary,
      scaffoldBackgroundColor: palette.colorScheme.surface,
      highlightColor: palette.colorScheme.primary.withValues(alpha:0.15),
      dividerColor: palette.colorScheme.onSecondaryContainer,
      
      /// App bar styling
      appBarTheme: AppBarTheme(
        backgroundColor: palette.colorScheme.primary,
        foregroundColor: palette.colorScheme.onPrimary,
        elevation: 1,
        titleTextStyle: TextStyle(
          fontSize: 24,
          color: palette.colorScheme.onPrimary,
        ),
      ),
      
      /// Button theme for consistency across buttons
      buttonTheme: ButtonThemeData(
        buttonColor: palette.colorScheme.primary,
        textTheme: ButtonTextTheme.primary,
      ),
     
      
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: palette.colorScheme.secondary,
          foregroundColor: palette.colorScheme.onSecondary,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: palette.colorScheme.primary,
          foregroundColor: palette.colorScheme.onPrimary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: .35,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: palette.colorScheme.primary,
          side: BorderSide(color: palette.colorScheme.primary),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
      /// Card theme for standardization of card UI
      cardTheme: CardTheme(
        color: palette.colorScheme.surfaceContainer,
        shadowColor: palette.colorScheme.shadow,
        elevation: 0.25,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        clipBehavior: Clip.antiAlias,
      ),
      
      /// Input decoration for text fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: palette.colorScheme.surfaceContainerLow,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(
            color: palette.colorScheme.surfaceContainerLowest,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: palette.colorScheme.outline),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: palette.colorScheme.primary),
        ),
      ),
       dialogTheme: DialogTheme(
        backgroundColor: palette.colorScheme.surfaceContainer,
        titleTextStyle: TextStyle(
          color: palette.colorScheme.onSurface,
          fontSize: 24.sp,
          fontWeight: FontWeight.bold,
        ),
        contentTextStyle: textStyles.bodyMedium?.copyWith(
          color: palette.colorScheme.onSurface,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: palette.colorScheme.inverseSurface,
        contentTextStyle: textStyles.bodyMedium?.copyWith(
          color: palette.colorScheme.onPrimary,
        ),
      ),
      bannerTheme: MaterialBannerThemeData(
        backgroundColor: palette.colorScheme.inverseSurface,
        contentTextStyle: textStyles.bodyMedium?.copyWith(
          color: palette.colorScheme.onPrimary,
        ),
        dividerColor: palette.colorScheme.outline,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: palette.colorScheme.surface,
        selectedItemColor: palette.colorScheme.primary,
        unselectedItemColor: palette.colorScheme.onSurface.withValues(
          alpha: 0.6,
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: palette.colorScheme.surface,
        textStyle: textStyles.bodyMedium?.copyWith(
          color: palette.colorScheme.onSurface,
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        checkColor: WidgetStateProperty.all(palette.colorScheme.onPrimary),
        fillColor: WidgetStateProperty.all(palette.colorScheme.primary),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),

      chipTheme: ChipThemeData(
        backgroundColor: palette.colorScheme.surfaceContainer,
        disabledColor: palette.colorScheme.onSurface,
        selectedColor: palette.colorScheme.primaryContainer,
        secondarySelectedColor: palette.colorScheme.primary.withAlpha(12),
        padding: EdgeInsets.all(4.0),
        labelStyle: textStyles.bodyMedium?.copyWith(
          color: palette.colorScheme.onSurface,
        ),
        secondaryLabelStyle: textStyles.bodyMedium?.copyWith(
          color: palette.colorScheme.onPrimary,
        ),
        brightness: palette.colorScheme.brightness,
        shape: StadiumBorder(
          side: BorderSide(
            color: palette.colorScheme.outline.withValues(alpha: .3),
          ),
        ),
      ),

      /// Floating Action Button theme
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: palette.colorScheme.primary,
        foregroundColor: palette.colorScheme.onPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        elevation: 0,
      ),
    );
  }

  /// Creates a copy of the theme manager with optional modifications.
  ThemeManager copyWith({Palette? colors, TextTheme? texts, ThemeMode? mode}) {
    return ThemeManager(
      colors ?? this.colors,
      texts: texts ?? this.texts,
      mode: mode ?? this.mode,
    );
  }

  /// Factory constructor to initialize [ThemeManager] with a base theme.
  /// Can be initialized using a seed color, a swatch, or defaults to system mode.
  factory ThemeManager.init({
    ThemeMode mode = ThemeMode.system,
    Color? seedColor,
    MaterialColor? swatchColor,
  }) {
    if (seedColor != null) {
      return ThemeManager(Seed(seed: seedColor));
    }
    if (swatchColor != null) {
      return ThemeManager(Swatch(swatch: swatchColor));
    }
    return ThemeManager(mode == ThemeMode.dark ? DarkSoul() : LightSoul());
  }
}
