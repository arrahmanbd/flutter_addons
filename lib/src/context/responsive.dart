part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on `BuildContext` for screen size and platform breakpoints.
extension ResponsiveExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;
  double get shortestSide => MediaQuery.of(this).size.shortestSide;

  bool get isTablet => shortestSide >= 600;

  bool get isDesktop =>
      screenWidth >= 992 &&
      defaultTargetPlatform != TargetPlatform.android &&
      defaultTargetPlatform != TargetPlatform.iOS;

  bool get isMobile => !isTablet && !isDesktop;

  bool get isSm => screenWidth >= 576 && screenWidth < 768;
  bool get isMd => screenWidth >= 768 && screenWidth < 992;
  bool get isLg => screenWidth >= 992 && screenWidth < 1200;
  bool get isXl => screenWidth >= 1200;
}

/// Primary adaptive accessor to group all adaptive layout values under `context.adaptive`
extension AdaptiveLayoutAccessor on BuildContext {
  Adapt get adaptive => Adapt(this);
}

/// Groups all adaptive layout logic in a single namespace-like class
class Adapt {
  final BuildContext context;

  Adapt(this.context);

  double get spacing {
    if (context.isDesktop) return 32;
    if (context.isTablet) return 24;
    return 16;
  }

  EdgeInsets get padding => EdgeInsets.all(spacing);

  /// Common aspect ratios by context
  double get squareRatio => 1.0;

  double get productCardRatio {
    if (context.isDesktop) return 1.25;
    if (context.isTablet) return 1.0;
    return 0.85;
  }

  double get cardWithImageRatio {
    if (context.isDesktop) return .95;
    if (context.isTablet) return .95;
    return .55;
  }

  double get imageOnlyRatio {
    if (context.isDesktop) return 1.0;
    if (context.isTablet) return 0.9;
    return 0.75;
  }

  double get sliderRatio {
    if (context.isDesktop) return 3.5;
    if (context.isTablet) return 2.8;
    return 2.0;
  }

  double get heroRatio {
    if (context.isDesktop) return 2.5;
    if (context.isTablet) return 2.0;
    return 1.6;
  }

  double get bannerRatio {
    if (context.isDesktop) return 3.0;
    if (context.isTablet) return 2.5;
    return 2.0;
  }

  int get columnCount {
    if (context.isDesktop) return 4;
    if (context.isTablet) return 3;
    return 2;
  }

  double get cardWidth {
    final width = context.screenWidth;
    return (width / columnCount) - spacing;
  }

  AdaptiveGridConfig get grid => AdaptiveGridConfig(
    crossAxisCount: columnCount,
    childAspectRatio: productCardRatio,
    spacing: spacing,
  );
}

/// Grid configuration data holder
class AdaptiveGridConfig {
  final int crossAxisCount;
  final double childAspectRatio;
  final double spacing;

  const AdaptiveGridConfig({
    required this.crossAxisCount,
    required this.childAspectRatio,
    required this.spacing,
  });
}
