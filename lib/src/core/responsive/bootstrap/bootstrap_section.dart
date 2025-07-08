part of 'package:flutter_addons/flutter_addons.dart';

// Bootstrap Section style

class Section extends StatelessWidget {
  final List<SectionItem> children;
  final WrapAlignment wrapAlignment;
  final WrapCrossAlignment wrapCrossAlignment;
  final WrapAlignment runAlignment;
  final bool contentPadding;
  final double? spacing, runSpacing;

  const Section({
    super.key,
    required this.children,
    this.wrapAlignment = WrapAlignment.start,
    this.wrapCrossAlignment = WrapCrossAlignment.start,
    this.runAlignment = WrapAlignment.start,
    this.contentPadding = true,
    this.spacing,
    this.runSpacing,
  });

  EdgeInsets getPadding(int index, int length) {
    final space = spacing ?? flexSpacing;
    if (contentPadding) {
      return EdgeInsets.symmetric(horizontal: space / 2);
    }
    return EdgeInsets.fromLTRB(
      index == 0 ? 0 : space / 2,
      0,
      index == length - 1 ? 0 : space / 2,
      0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DisplayFlex(
      builder: (context, constraints, screenType) {
        final width = constraints.maxWidth;

        final List<Widget> items = [];

        final grouped = _groupItemsByRow(screenType);

        for (final rowItems in grouped) {
          for (var i = 0; i < rowItems.length; i++) {
            final item = rowItems[i];

            if (!item.isVisible(screenType)) continue;

            final flex =
                item.flex[screenType] ??
                DisplayFlexMedia.flexColumns.toDouble();
            final itemWidth = _calculateItemWidth(
              width,
              flex,
              spacing ?? flexSpacing,
            );

            items.add(
              Container(
                width: itemWidth,
                padding: getPadding(i, rowItems.length),
                child: item,
              ),
            );
          }
        }

        return Wrap(
          alignment: wrapAlignment,
          crossAxisAlignment: wrapCrossAlignment,
          runAlignment: runAlignment,
          spacing: spacing ?? 0,
          runSpacing: runSpacing ?? flexSpacing,
          children: items,
        );
      },
    );
  }

  List<List<SectionItem>> _groupItemsByRow(BreakpointMapper screenType) {
    final grouped = <List<SectionItem>>[];
    final row = <SectionItem>[];
    double flexSum = 0;

    for (final item in children) {
      if (!item.isVisible(screenType)) continue;

      final flex =
          item.flex[screenType] ?? DisplayFlexMedia.flexColumns.toDouble();
      if (flexSum + flex <= DisplayFlexMedia.flexColumns) {
        row.add(item);
        flexSum += flex;
      } else {
        if (row.isNotEmpty) grouped.add(List.from(row));
        row.clear();
        row.add(item);
        flexSum = flex;
      }
    }

    if (row.isNotEmpty) {
      grouped.add(row);
    }

    return grouped;
  }

  double _calculateItemWidth(double totalWidth, double flex, double spacing) {
    final columns = DisplayFlexMedia.flexColumns.toDouble();
    final itemWidth = totalWidth * (flex / columns);
    return itemWidth.floorToDouble();
  }
}

/// A layout-aware widget representing a section item in a responsive grid.
///
/// Wraps a child widget with optional fixed sizing constraints and parses
/// responsive sizing strings (e.g., 'lg-4 md-12') for layout engines.
class SectionItem extends StatelessWidget {
  final Widget child;
  final String? sizes;
  final double? maxHeight;
  final double? maxWidth;

  const SectionItem({
    super.key,
    required this.child,
    this.sizes,
    this.maxHeight,
    this.maxWidth,
  });

  /// Extracts flex values for different screen sizes based on the `sizes` string.
  Map<BreakpointMapper, double> get flex =>
      DisplayFlexMedia.getFlexedDataFromString(sizes);

  /// Determines if this section item should be visible for a given screen type.
  bool isVisible(BreakpointMapper type) {
    return flex[type] != 0;
  }

  @override
  Widget build(BuildContext context) {
    // If no sizes are provided, use default flex values
    return SizedBox(width: maxWidth, height: maxHeight, child: child);
  }
}

class DisplayFlex extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints, BreakpointMapper) builder;

  const DisplayFlex({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = DisplayFlexMedia.getTypeFromWidth(
          MediaQuery.of(context).size.width,
        );
        return builder(context, constraints, screenType);
      },
    );
  }
}
