part of 'package:flutter_addons/flutter_addons.dart';

/// The builder function is called with the current context,
///  What if I have a figma frame size of 360x800?
///
/// The design size is used to calculate the percentage of the screen size.
///  Here is the formula.
/// If user provides:

// designFrame: Size(360, 800)
// Then:
// 16.px width ➝ (16 / 360) * 100 = 4.44.w
// 16.px height ➝ (16 / 800) * 100 = 2.00.h
// 16.px font ➝ (16 / 360) * 100 = 4.44.sp (use width-based scaling for font)
typedef ResponsiveBuilderType =
    Widget Function(
      BuildContext context,
      Orientation orientation,
      ScreenType screenType,
    );

class BaseResponsiveWidget extends StatelessWidget {
  const BaseResponsiveWidget({
    super.key,
    required this.builder,
    this.maxMobileWidth = 599,
    this.maxTabletWidth,
    this.designSize,
    required this.adaptDesign,
    this.onScreenTypeChanged,
  });

  /// The builder function that provides context, orientation, and screen type.
  final ResponsiveBuilderType builder;

  /// Maximum width for a screen to be considered "mobile".
  final double maxMobileWidth;

  /// Optional maximum width for a screen to be considered "tablet".
  /// If null, defaults to using screen type heuristics.
  final double? maxTabletWidth;

  /// Whether to enable adaptive percentage-based scaling.
  final bool adaptDesign;

  /// Optional design reference size used to calculate scaling percentages.
  final Size? designSize;

  /// Optional callback when screen type changes.
  final void Function(ScreenType)? onScreenTypeChanged;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
          return const SizedBox.shrink();
        }

        return OrientationBuilder(
          builder: (context, orientation) {
            // Set screen information for responsive calculations
            Device.setScreenSize(
              context,
              constraints,
              orientation,
              maxMobileWidth,
              maxTabletWidth,
            );

            // Call callback if provided
            if (onScreenTypeChanged != null) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onScreenTypeChanged!(Device.screenType);
              });
            }

            // Initialize DesignScale if designSize is provided
            final size = designSize;
            if (size == null) {
              debugPrint(
                '[Warning] Design width not initialized. Using .pw fallback.',
              );
            }
            if (size != null && size.width > 0 && size.height > 0) {
              _DesignScale.instance.init(
                designWidth: size.width,
                designHeight: size.height,
                context: context,
                makeAdaptive: adaptDesign,
              );
            }

            return builder(context, orientation, Device.screenType);
          },
        );
      },
    );
  }
}
