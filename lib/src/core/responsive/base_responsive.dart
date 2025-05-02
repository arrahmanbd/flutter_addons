part of 'package:flutter_addons/flutter_addons.dart';

/// Signature for a builder function that provides the current context,
/// device orientation, and screen type (mobile, tablet, or desktop).
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
  });

  final ResponsiveBuilderType builder;
  final double maxMobileWidth;
  final double? maxTabletWidth;

  /// Design size used for calculating percentage-based UI dimensions.
  final Size? designSize;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth == 0 || constraints.maxHeight == 0) {
          return const SizedBox.shrink();
        }

        return OrientationBuilder(
          builder: (context, orientation) {
            Device.setScreenSize(
              context,
              constraints,
              orientation,
              maxMobileWidth,
              maxTabletWidth,
            );

            if (designSize case Size(width: final w, height: final h)) {
              _DesignScale.init(w, h);
            }

            return builder(context, orientation, Device.screenType);
          },
        );
      },
    );
  }
}

class _DesignScale {
  static late double _widthPercent;
  static late double _heightPercent;

  static void init(double designWidth, double designHeight) {
    _widthPercent = Device.safeWidth / designWidth;
    _heightPercent = Device.safeHeight / designHeight;
  }

  static double percentWidth(num px) => (px * _widthPercent);
  static double percentHeight(num px) => (px * _heightPercent);
  static double percentFont(num px) =>
      percentWidth(px); // font uses width scale
}

/// Extension methods for converting pixel values to responsive dimensions.
/// These methods are based on the design size and the current screen size.
/// - `fw`: Converts a pixel value to a percentage of the screen width.
/// - `fh`: Converts a pixel value to a percentage of the screen height.
/// - `fs`: Converts a pixel value to a percentage of the screen width (for font size).

extension PxToResponsiveExtension on num {
  double get fw => _DesignScale.percentWidth(this);
  double get fh => _DesignScale.percentHeight(this);
  double get fs => _DesignScale.percentFont(this);
}
