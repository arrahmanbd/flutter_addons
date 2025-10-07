part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on [BuildContext] to provide convenient access
/// to theme-related properties such as current theme mode.
/// [Professional Brand Design System]
/// Comprehensive theme extensions with actual brand color semantics
extension BrandThemeExtension on BuildContext {
  // Core theme access
  ThemeData get _theme => Theme.of(this);
  ColorScheme get colorScheme => _theme.colorScheme;
  TextTheme get textTheme => _theme.textTheme;

  /// Check if current theme is dark
  bool get isDark => _theme.brightness == Brightness.dark;
}

/// Brand Color System - Semantic color names for professional design
extension BrandColorsExtensions on BuildContext {
  // === BRAND CORE COLORS ===

  /// Primary brand color - Used for main brand elements, primary buttons, FABs
  Color get brandPrimary => colorScheme.primary;

  /// Secondary brand color - Used for secondary actions, accents
  Color get brandSecondary => colorScheme.secondary;

  /// Accent brand color - Used for highlights, CTAs, important indicators
  Color get brandAccent => colorScheme.tertiary;

  /// Success state color - Used for success messages, positive actions
  Color get brandSuccess => colorScheme.tertiaryContainer;

  /// Warning state color - Used for warnings, cautions
  Color get brandWarning => colorScheme.errorContainer;

  /// Error state color - Used for errors, destructive actions
  Color get brandError => colorScheme.error;

  // === SURFACE COLORS ===

  /// Main app background color
  Color get background => colorScheme.surface;

  /// Surface color for cards, dialogs, sheets
  Color get surface => colorScheme.surface;

  /// Elevated surface for raised elements
  Color get surfaceElevated => colorScheme.surfaceContainerHighest;

  // usefull for migration
  Color get inputBackground => colorScheme.surfaceContainerHigh;

  /// Highest elevation surface
  Color get surfaceHigh => colorScheme.surfaceContainerHighest;

  // === TEXT & CONTENT COLORS ===

  /// Primary text color - Main content, headlines
  Color get textPrimary => colorScheme.onSurface;

  /// Secondary text color - Subtitles, supporting text
  Color get textSecondary => colorScheme.onSurfaceVariant;

  /// Tertiary text color - Placeholders, disabled text
  Color get textTertiary => colorScheme.outline;

  /// Text on colored backgrounds (buttons, chips)
  Color get textOnColor => colorScheme.onPrimary;

  /// Inverse text color for dark backgrounds
  Color get textInverse => colorScheme.onSurface;

  // === INTERACTIVE ELEMENTS ===

  /// Primary button background
  Color get buttonPrimary => colorScheme.primary;

  /// Secondary button background
  Color get buttonSecondary => colorScheme.secondaryContainer;

  /// Outline button border color
  Color get buttonOutline => colorScheme.outline;

  /// Disabled button color
  Color get buttonDisabled => colorScheme.onSurface.withValues(alpha: 0.12);

  /// FAB background color
  Color get fabBackground => colorScheme.primaryContainer;

  // === BORDER & DIVIDER COLORS ===

  /// Default border color
  Color get border => colorScheme.outline;

  /// Focus border color
  Color get borderFocus => colorScheme.primary;

  /// Divider color for content separation
  Color get divider => colorScheme.outlineVariant;

  /// Subtle divider for less prominent separations
  Color get dividerSubtle => colorScheme.surfaceContainerHighest;

  // === FEEDBACK SURFACES ===

  /// Success background surface
  Color get surfaceSuccess => colorScheme.tertiaryContainer;

  /// Warning background surface
  Color get surfaceWarning => colorScheme.errorContainer;

  /// Error background surface
  Color get surfaceError => colorScheme.errorContainer;

  /// Info background surface
  Color get surfaceInfo => colorScheme.primaryContainer;

  // === SHADOW & OVERLAY ===

  /// Shadow color for elevations
  Color get shadow => colorScheme.shadow;

  /// Scrim color for dialogs, bottom sheets
  Color get scrim => colorScheme.scrim;

  /// Overlay color for backdrops
  Color get overlay => colorScheme.surfaceTint;

  // === BRAND GRADIENTS ===

  /// Primary brand gradient
  Gradient get brandGradient => LinearGradient(
    colors: [brandPrimary, brandAccent],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  /// Surface gradient for cards
  Gradient get surfaceGradient => LinearGradient(
    colors: [surface, surfaceElevated],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );
}

// /// Professional Text Color System with brand semantics
// extension BrandTextColors on BuildContext {
//   // === HEADLINE COLORS ===
//   Color get headlineColor => textTheme.headlineLarge?.color ?? textPrimary;

//   // === TITLE COLORS ===
//   Color get titleColor => textTheme.titleLarge?.color ?? textPrimary;

//   // === BODY COLORS ===
//   Color get bodyColor => textTheme.bodyLarge?.color ?? textPrimary;
//   Color get bodySecondary => textTheme.bodySmall?.color ?? textSecondary;

//   // === LABEL COLORS ===
//   Color get labelColor => textTheme.labelLarge?.color ?? textSecondary;
//   Color get labelOnColor => textTheme.labelMedium?.color ?? textOnColor;
//   Color get labelTertiary => textTheme.labelSmall?.color ?? textTertiary;

//   // === BRAND COLORS ===
//   Color get brand => brandPrimary;
//   Color get success => brandSuccess;
//   Color get warning => brandWarning;
//   Color get error => brandError;
// }
/// Adaptive Color System for professional theming
extension ProfessionalAdaptiveColors on BuildContext {
  /// Returns appropriate color based on theme brightness
  Color adaptive({required Color light, required Color dark}) =>
      isDark ? dark : light;

  /// Adaptive brand color with auto-generated dark variant
  Color adaptiveBrand(Color baseColor, [double darkAdjustment = -0.1]) {
    if (!isDark) return baseColor;

    final hsl = HSLColor.fromColor(baseColor);
    return hsl.withLightness(hsl.lightness + darkAdjustment).toColor();
  }

  /// Adaptive text color with proper contrast
  Color adaptiveText({Color? light, Color? dark}) {
    if (light != null && dark != null) {
      return adaptive(light: light, dark: dark);
    }

    return isDark ? Colors.white : Colors.black;
  }

  /// Adaptive surface color with elevation awareness
  Color adaptiveSurface([int elevation = 0]) {
    const lightSurfaces = [
      Color(0xFFFFFFFF), // 0dp
      Color(0xFFF8F9FA), // 1dp
      Color(0xFFF1F3F4), // 2dp
      Color(0xFFECEEF0), // 3dp
    ];

    const darkSurfaces = [
      Color(0xFF121212), // 0dp
      Color(0xFF1E1E1E), // 1dp
      Color(0xFF242424), // 2dp
      Color(0xFF272727), // 3dp
    ];

    final index = elevation.clamp(0, lightSurfaces.length - 1);
    return adaptive(light: lightSurfaces[index], dark: darkSurfaces[index]);
  }
}

/// Brand-specific styling extensions
extension BrandStyling on BuildContext {
  // === BORDER RADIUS ===

  /// Small radius for small elements (buttons, chips)
  BorderRadius get radiusSmall => const BorderRadius.all(Radius.circular(8));

  /// Medium radius for cards, dialogs
  BorderRadius get radiusMedium => const BorderRadius.all(Radius.circular(12));

  /// Large radius for large containers, modals
  BorderRadius get radiusLarge => const BorderRadius.all(Radius.circular(16));

  /// Extra large radius for hero elements
  BorderRadius get radiusXLarge => const BorderRadius.all(Radius.circular(24));

  // === SHADOWS ===

  /// Small shadow for elevated elements
  List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.1),
      blurRadius: 4,
      offset: const Offset(0, 1),
    ),
  ];

  /// Medium shadow for cards
  List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.15),
      blurRadius: 8,
      offset: const Offset(0, 2),
    ),
  ];

  /// Large shadow for dialogs, modals
  List<BoxShadow> get shadowLarge => [
    BoxShadow(
      color: shadow.withValues(alpha: 0.2),
      blurRadius: 16,
      offset: const Offset(0, 4),
    ),
  ];

  // === SPACING ===

  /// Small spacing (4px)
  double get spacingXS => 4;

  /// Medium spacing (8px)
  double get spacingSM => 8;

  /// Regular spacing (16px)
  double get spacingMD => 16;

  /// Large spacing (24px)
  double get spacingLG => 24;

  /// Extra large spacing (32px)
  double get spacingXL => 32;
}

/// Quick access to brand design tokens
extension BrandTokens on BuildContext {
  /// Get brand design tokens for consistent styling
  BrandDesignTokens get tokens => BrandDesignTokens(this);
}

/// Professional design tokens class
class BrandDesignTokens {
  final BuildContext context;

  BrandDesignTokens(this.context);

  // Colors
  Color get brandPrimary => context.brandPrimary;
  Color get brandSecondary => context.brandSecondary;
  Color get surface => context.surface;
  Color get textPrimary => context.textPrimary;

  // Typography
  TextStyle get headlineLarge => context.textTheme.headlineLarge!;
  TextStyle get bodyMedium => context.textTheme.bodyMedium!;
  TextStyle get labelLarge => context.textTheme.labelLarge!;

  // Spacing
  double get spacingMD => context.spacingMD;
  double get spacingLG => context.spacingLG;

  // Borders
  BorderRadius get radiusMedium => context.radiusMedium;
  List<BoxShadow> get shadowMedium => context.shadowMedium;
}

// === USAGE EXAMPLES ===

// class ProfessionalComponent extends StatelessWidget {
//   const ProfessionalComponent({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(context.spacingMD),
//       decoration: BoxDecoration(
//         color: context.surface,
//         borderRadius: context.radiusMedium,
//         boxShadow: context.shadowMedium,
//         gradient: context.surfaceGradient,
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Professional Headline',
//             style: context.textTheme.headlineMedium?.copyWith(
//               color: context.brandPrimary,
//             ),
//           ),
//           SizedBox(height: context.spacingSM),
//           Text(
//             'This uses professional brand color system with actual semantic names',
//             style: context.textTheme.bodyMedium?.copyWith(
//               color: context.textSecondary,
//             ),
//           ),
//           SizedBox(height: context.spacingMD),
//           Row(
//             children: [
//               ElevatedButton(
//                 onPressed: () {},
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: context.buttonPrimary,
//                   foregroundColor: context.textOnColor,
//                 ),
//                 child: const Text('Primary Action'),
//               ),
//               SizedBox(width: context.spacingSM),
//               OutlinedButton(
//                 onPressed: () {},
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(color: context.buttonOutline),
//                 ),
//                 child: Text(
//                   'Secondary',
//                   style: TextStyle(color: context.textPrimary),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
