part of 'package:flutter_addons/flutter_addons.dart';

/// A helper class to manage component themes.

class SoulTheme {
  final ColorScheme colorScheme;
  final TextTheme textTheme;
  final BrandTypo typography;

  SoulTheme({
    required this.colorScheme,
    required this.textTheme,
    required this.typography,
  });

  /// Main theme data that can be used directly in MaterialApp
  ThemeData get themeData => ThemeData(
    useMaterial3: true,
    colorScheme: colorScheme,
    textTheme: textTheme,
    brightness: colorScheme.brightness,
    primaryColor: colorScheme.primary,
    scaffoldBackgroundColor: colorScheme.surface,
    highlightColor: colorScheme.primary.withAlpha(38), // 15% alpha
    dividerColor: colorScheme.onSecondaryContainer,
    fontFamily: typography.fontFamily,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    // App structure
    appBarTheme: appBarTheme,
    bottomNavigationBarTheme: bottomNavigationBarTheme,
    navigationBarTheme: navigationBarTheme,
    navigationRailTheme: navigationRailTheme,

    // Buttons
    buttonTheme: buttonTheme,
    textButtonTheme: textButtonTheme,
    elevatedButtonTheme: elevatedButtonTheme,
    outlinedButtonTheme: outlinedButtonTheme,
    filledButtonTheme: filledButtonTheme,
    iconButtonTheme: iconButtonTheme,
    floatingActionButtonTheme: floatingActionButtonTheme,

    // Inputs & selections
    inputDecorationTheme: inputDecorationTheme,
    checkboxTheme: checkboxTheme,
    radioTheme: radioTheme,
    switchTheme: switchTheme,
    sliderTheme: sliderTheme,

    // Surfaces
    cardTheme: cardTheme,
    dialogTheme: dialogTheme,
    bannerTheme: bannerTheme,
    snackBarTheme: snackBarTheme,
    popupMenuTheme: popupMenuTheme,

    // Indicators
    chipTheme: chipTheme,
    badgeTheme: badgeTheme,
    progressIndicatorTheme: progressIndicatorTheme,

    // Dividers
    dividerTheme: dividerTheme,

    // Visual density
    //visualDensity: VisualDensity.standard,

    // Platform adaptations
    platform: TargetPlatform.android,
  );

  /// Dark theme variant
  ThemeData get darkTheme => themeData.copyWith(brightness: Brightness.dark);

  /// Light theme variant
  ThemeData get lightTheme => themeData.copyWith(brightness: Brightness.light);

  // === APP STRUCTURE ===

  AppBarTheme get appBarTheme => AppBarTheme(
    backgroundColor: colorScheme.surface,
    foregroundColor: colorScheme.onSurface,
    elevation: 0,
    surfaceTintColor: Colors.transparent,
    centerTitle: true,
    titleTextStyle: textTheme.titleLarge?.copyWith(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
    ),
    iconTheme: IconThemeData(color: colorScheme.onSurfaceVariant, size: 24),
    actionsIconTheme: IconThemeData(
      color: colorScheme.onSurfaceVariant,
      size: 24,
    ),
    scrolledUnderElevation: 1,
  );

  BottomNavigationBarThemeData get bottomNavigationBarTheme =>
      BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        elevation: 3,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: textTheme.labelSmall?.copyWith(
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: textTheme.labelSmall,
        showSelectedLabels: true,
        showUnselectedLabels: true,
      );

  NavigationBarThemeData get navigationBarTheme => NavigationBarThemeData(
    backgroundColor: colorScheme.surface,
    indicatorColor: colorScheme.primaryContainer,
    iconTheme: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return IconThemeData(color: colorScheme.onPrimaryContainer);
      }
      return IconThemeData(color: colorScheme.onSurfaceVariant);
    }),
    labelTextStyle: WidgetStateProperty.resolveWith((states) {
      final style = textTheme.labelSmall;
      if (states.contains(WidgetState.selected)) {
        return style?.copyWith(
          color: colorScheme.onPrimaryContainer,
          fontWeight: FontWeight.w600,
        );
      }
      return style?.copyWith(color: colorScheme.onSurfaceVariant);
    }),
  );

  NavigationRailThemeData get navigationRailTheme => NavigationRailThemeData(
    backgroundColor: colorScheme.surface,
    indicatorColor: colorScheme.primaryContainer,
    selectedIconTheme: IconThemeData(color: colorScheme.onPrimaryContainer),
    unselectedIconTheme: IconThemeData(color: colorScheme.onSurfaceVariant),
    labelType: NavigationRailLabelType.selected,
  );

  // === BUTTONS ===

  ButtonThemeData get buttonTheme => ButtonThemeData(
    buttonColor: colorScheme.primary,
    textTheme: ButtonTextTheme.primary,
    layoutBehavior: ButtonBarLayoutBehavior.padded,
  );

  TextButtonThemeData get textButtonTheme => TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: colorScheme.primary,
      textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      disabledBackgroundColor: colorScheme.onSurface.withValues(alpha: 0.12),
      disabledForegroundColor: colorScheme.onSurface.withValues(alpha: 0.38),
      textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      elevation: 1,
      shadowColor: colorScheme.shadow,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: colorScheme.primary,
      side: BorderSide(color: colorScheme.outline),
      textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  FilledButtonThemeData get filledButtonTheme => FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: colorScheme.primaryContainer,
      foregroundColor: colorScheme.onPrimaryContainer,
      textStyle: textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600),
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  IconButtonThemeData get iconButtonTheme => IconButtonThemeData(
    style: IconButton.styleFrom(
      foregroundColor: colorScheme.onSurfaceVariant,
      hoverColor: colorScheme.onSurface.withValues(alpha: 0.08),
      focusColor: colorScheme.primary.withValues(alpha: 0.12),
      highlightColor: colorScheme.primary.withValues(alpha: 0.12),
      padding: EdgeInsets.all(8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
  );

  FloatingActionButtonThemeData get floatingActionButtonTheme =>
      FloatingActionButtonThemeData(
        backgroundColor: colorScheme.primaryContainer,
        foregroundColor: colorScheme.onPrimaryContainer,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 1,
        highlightElevation: 2,
      );

  // === INPUTS & SELECTIONS ===

  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
    filled: true,
    fillColor: colorScheme.surfaceContainerHighest,
    focusColor: colorScheme.primary,
    hoverColor: colorScheme.onSurface.withValues(alpha: 0.08),
    hintStyle: textTheme.bodyLarge?.copyWith(
      color: colorScheme.onSurfaceVariant,
    ),
    errorStyle: textTheme.bodySmall?.copyWith(color: colorScheme.error),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.outline),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.outline),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.primary, width: 2),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.error),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: colorScheme.error, width: 2),
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  );

  CheckboxThemeData get checkboxTheme => CheckboxThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return null;
    }),
    checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    side: BorderSide(color: colorScheme.outline),
  );

  RadioThemeData get radioTheme => RadioThemeData(
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.outline;
    }),
  );

  SwitchThemeData get switchTheme => SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.onPrimary;
      }
      return colorScheme.outline;
    }),
    trackColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.surfaceContainerHighest;
    }),
    trackOutlineColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return colorScheme.primary;
      }
      return colorScheme.outline;
    }),
  );

  SliderThemeData get sliderTheme => SliderThemeData(
    activeTrackColor: colorScheme.primary,
    inactiveTrackColor: colorScheme.surfaceContainerHighest,
    thumbColor: colorScheme.primary,
    overlayColor: colorScheme.primary.withValues(alpha: 0.12),
    valueIndicatorColor: colorScheme.primary,
    valueIndicatorTextStyle: textTheme.bodySmall?.copyWith(
      color: colorScheme.onPrimary,
    ),
  );

  // === SURFACES ===

  CardThemeData get cardTheme => CardThemeData(
    color: colorScheme.surface,
    shadowColor: colorScheme.shadow,
    surfaceTintColor: Colors.transparent,
    elevation: 1,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color: colorScheme.outline.withValues(alpha: 0.1),
        width: 1,
      ),
    ),
    margin: EdgeInsets.zero,
    clipBehavior: Clip.antiAlias,
  );

  DialogThemeData get dialogTheme => DialogThemeData(
    backgroundColor: colorScheme.surface,
    surfaceTintColor: Colors.transparent,
    elevation: 3,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    titleTextStyle: textTheme.headlineSmall?.copyWith(
      color: colorScheme.onSurface,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    ),
  );

  MaterialBannerThemeData get bannerTheme => MaterialBannerThemeData(
    backgroundColor: colorScheme.surface,
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onSurface,
    ),
    dividerColor: colorScheme.outline,
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  );

  SnackBarThemeData get snackBarTheme => SnackBarThemeData(
    backgroundColor: colorScheme.inverseSurface,
    contentTextStyle: textTheme.bodyMedium?.copyWith(
      color: colorScheme.onInverseSurface,
    ),
    actionTextColor: colorScheme.inversePrimary,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    elevation: 3,
  );

  PopupMenuThemeData get popupMenuTheme => PopupMenuThemeData(
    color: colorScheme.surface,
    surfaceTintColor: Colors.transparent,
    textStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
      side: BorderSide(
        color: colorScheme.outline.withValues(alpha: 0.1),
        width: 1,
      ),
    ),
    elevation: 2,
  );

  // === INDICATORS ===

  ChipThemeData get chipTheme => ChipThemeData(
    backgroundColor: colorScheme.surfaceContainerHighest,
    disabledColor: colorScheme.onSurface.withValues(alpha: 0.12),
    selectedColor: colorScheme.primaryContainer,
    secondarySelectedColor: colorScheme.primaryContainer,
    labelStyle: textTheme.labelMedium?.copyWith(
      color: colorScheme.onSurfaceVariant,
    ),
    secondaryLabelStyle: textTheme.labelMedium?.copyWith(
      color: colorScheme.onPrimaryContainer,
      fontWeight: FontWeight.w500,
    ),
    brightness: colorScheme.brightness,
    elevation: 0,
    shape: StadiumBorder(
      side: BorderSide(
        color: colorScheme.outline.withValues(alpha: 0.3),
        width: 1,
      ),
    ),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  );

  BadgeThemeData get badgeTheme => BadgeThemeData(
    backgroundColor: colorScheme.error,
    textColor: colorScheme.onError,
    textStyle: textTheme.labelSmall?.copyWith(
      color: colorScheme.onError,
      fontWeight: FontWeight.w600,
    ),
    alignment: Alignment.topRight,
    padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
    smallSize: 6,
    largeSize: 16,
  );

  ProgressIndicatorThemeData get progressIndicatorTheme =>
      ProgressIndicatorThemeData(
        linearTrackColor: colorScheme.surfaceContainerHighest,
        linearMinHeight: 4,
        circularTrackColor: colorScheme.surfaceContainerHighest,
        refreshBackgroundColor: colorScheme.surfaceContainerHighest,
      );

  // === DIVIDERS ===

  DividerThemeData get dividerTheme => DividerThemeData(
    color: colorScheme.outline.withValues(alpha: 0.3),
    thickness: 1,
    space: 1,
  );

  // === EXTENSIONS FOR CUSTOM COMPONENTS ===

  /// Extension method for custom shimmer effect colors
  Color get shimmerBaseColor => colorScheme.surfaceContainerHighest;

  Color get shimmerHighlightColor => colorScheme.surfaceContainerHighest;

  /// Extension method for custom status colors
  Color get successColor => colorScheme.tertiary;
  Color get warningColor => colorScheme.errorContainer;
  Color get infoColor => colorScheme.primaryContainer;

  /// Extension method for custom gradient
  Gradient get primaryGradient => LinearGradient(
    colors: [colorScheme.primary, colorScheme.primaryContainer],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Extension method for custom shadow
  List<BoxShadow> get mediumShadow => [
    BoxShadow(
      color: colorScheme.shadow.withValues(alpha: 0.1),
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];
}
// class SoulComponentThemes {
//   final ColorScheme colorScheme;
//   final TextTheme textTheme;

//   SoulComponentThemes({required this.colorScheme, required this.textTheme});

//   /// Returns a configured AppBar theme.
//   AppBarTheme get appBarTheme => AppBarTheme(
//     backgroundColor: colorScheme.primary,
//     foregroundColor: colorScheme.onPrimary,
//     elevation: 1,
//     titleTextStyle: textTheme.titleMedium?.copyWith(
//       color: colorScheme.onPrimary,
//     ),
//     iconTheme: IconThemeData(color: colorScheme.onPrimary),
//   );

//   /// Returns a configured Button theme.
//   ButtonThemeData get buttonTheme => ButtonThemeData(
//     buttonColor: colorScheme.primary,
//     textTheme: ButtonTextTheme.primary,
//   );

//   TextButtonThemeData get textButtonTheme => TextButtonThemeData(
//     style: TextButton.styleFrom(
//       backgroundColor: colorScheme.secondary,
//       foregroundColor: colorScheme.onSecondary,
//     ),
//   );

//   ElevatedButtonThemeData get elevatedButtonTheme => ElevatedButtonThemeData(
//     style: ElevatedButton.styleFrom(
//       backgroundColor: colorScheme.primary,
//       foregroundColor: colorScheme.onPrimary,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//       elevation: .35,
//     ),
//   );

//   OutlinedButtonThemeData get outlinedButtonTheme => OutlinedButtonThemeData(
//     style: OutlinedButton.styleFrom(
//       foregroundColor: colorScheme.primary,
//       side: BorderSide(color: colorScheme.primary),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
//     ),
//   );

//   /// Returns a configured SnackBar theme.
//   SnackBarThemeData get snackBarTheme => SnackBarThemeData(
//     backgroundColor: colorScheme.inverseSurface,
//     contentTextStyle: textTheme.bodyMedium?.copyWith(
//       color: colorScheme.onPrimary,
//     ),
//     actionTextColor: colorScheme.primary,
//     behavior: SnackBarBehavior.floating,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//     elevation: 2,
//   );

//   /// Returns a configured Card theme.
//   CardThemeData get cardTheme => CardThemeData(
//     color: colorScheme.surfaceContainer,
//     shadowColor: colorScheme.shadow,
//     elevation: 0.25,
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//     clipBehavior: Clip.antiAlias,
//   );

//   /// Returns a configured Input Decoration theme.
//   InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
//     filled: true,
//     fillColor: colorScheme.surfaceContainerLow,
//     border: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12.0),
//       borderSide: BorderSide(color: colorScheme.surfaceContainerLowest),
//     ),
//     enabledBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide(color: colorScheme.outline),
//     ),
//     focusedBorder: OutlineInputBorder(
//       borderRadius: BorderRadius.circular(4),
//       borderSide: BorderSide(color: colorScheme.primary),
//     ),
//   );

//   DialogThemeData get dialogTheme => DialogThemeData(
//     backgroundColor: colorScheme.surfaceContainer,
//     titleTextStyle: TextStyle(
//       color: colorScheme.onSurface,
//       fontSize: 24,
//       fontWeight: FontWeight.bold,
//     ),
//     contentTextStyle: textTheme.bodyMedium?.copyWith(
//       color: colorScheme.onSurface,
//     ),
//   );

//   MaterialBannerThemeData get bannerTheme => MaterialBannerThemeData(
//     backgroundColor: colorScheme.inverseSurface,
//     contentTextStyle: textTheme.bodyMedium?.copyWith(
//       color: colorScheme.onPrimary,
//     ),
//     dividerColor: colorScheme.outline,
//   );

//   BottomNavigationBarThemeData get bottomNavigationBarTheme =>
//       BottomNavigationBarThemeData(
//         backgroundColor: colorScheme.surface,
//         selectedItemColor: colorScheme.primary,
//         unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.6),
//       );

//   PopupMenuThemeData get popupMenuTheme => PopupMenuThemeData(
//     color: colorScheme.surface,
//     textStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
//   );

//   CheckboxThemeData get checkboxTheme => CheckboxThemeData(
//     checkColor: WidgetStateProperty.all(colorScheme.onPrimary),
//     fillColor: WidgetStateProperty.all(colorScheme.primary),
//     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//   );

//   ChipThemeData get chipTheme => ChipThemeData(
//     backgroundColor: colorScheme.surfaceContainer,
//     disabledColor: colorScheme.onSurface,
//     selectedColor: colorScheme.primaryContainer,
//     secondarySelectedColor: colorScheme.primary.withAlpha(12),
//     padding: EdgeInsets.all(4.0),
//     labelStyle: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurface),
//     secondaryLabelStyle: textTheme.bodyMedium?.copyWith(
//       color: colorScheme.onPrimary,
//     ),
//     brightness: colorScheme.brightness,
//     shape: StadiumBorder(
//       side: BorderSide(color: colorScheme.outline.withValues(alpha: 0.3)),
//     ),
//   );

//   FloatingActionButtonThemeData get floatingActionButtonTheme =>
//       FloatingActionButtonThemeData(
//         backgroundColor: colorScheme.primary,
//         foregroundColor: colorScheme.onPrimary,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
//         elevation: 0,
//       );
// }
