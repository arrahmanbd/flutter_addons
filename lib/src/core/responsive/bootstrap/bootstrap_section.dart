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
    double space = spacing ?? flexSpacing;
    return contentPadding
        ? EdgeInsets.symmetric(horizontal: space / 2)
        : EdgeInsets.fromLTRB(
          index == 0 ? 0 : space / 2,
          0,
          index == length - 1 ? 0 : space / 2,
          0,
        );
  }

  @override
  Widget build(BuildContext context) {
    return DFlex(
      builder: (context, constraints, screenType) {
        double width = constraints.maxWidth;
        List<Widget> list = [];

        for (List<SectionItem> rowItems in getGrouped(screenType)) {
          list.addAll(
            rowItems.asMap().entries.map((entry) {
              int index = entry.key;
              SectionItem col = entry.value;

              return Visibility(
                visible: col.isVisible(screenType),
                child: Container(
                  width: getWidthFromFlex(
                    width,
                    col.flex[screenType] ??
                        DflexScreenMedia.flexColumns.toDouble(),
                    rowItems.length,
                    spacing ?? flexSpacing,
                  ),
                  padding: getPadding(index, rowItems.length),
                  child: col,
                ),
              );
            }),
          );
        }

        return Wrap(
          crossAxisAlignment: wrapCrossAlignment,
          alignment: wrapAlignment,
          runAlignment: runAlignment,
          runSpacing: runSpacing ?? flexSpacing,
          spacing: spacing ?? 0,
          children: list,
        );
      },
    );
  }

  List<List<SectionItem>> getGrouped(DflexType type) {
    List<List<SectionItem>> groupedItems = [];
    List<SectionItem> currentRow = [];
    double flexCount = 0;

    for (SectionItem item in children) {
      if (item.isVisible(type)) {
        double flex =
            item.flex[type] ?? DflexScreenMedia.flexColumns.toDouble();

        if (flexCount + flex <= DflexScreenMedia.flexColumns) {
          currentRow.add(item);
          flexCount += flex;
        } else {
          groupedItems.add(List.of(currentRow));
          currentRow.clear();
          currentRow.add(item);
          flexCount = flex;
        }
      }
    }

    if (currentRow.isNotEmpty) {
      groupedItems.add(currentRow);
    }
    return groupedItems;
  }

  double getWidthFromFlex(
    double width,
    double flex,
    int items,
    double spacing,
  ) {
    return (width * flex / DflexScreenMedia.flexColumns).floorToDouble();
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
  Map<DflexType, double> get flex =>
      DflexScreenMedia.getFlexedDataFromString(sizes);

  /// Determines if this section item should be visible for a given screen type.
  bool isVisible(DflexType type) {
    return flex[type] != 0;
  }

  @override
  Widget build(BuildContext context) {
    // If no sizes are provided, use default flex values
    return SizedBox(width: maxWidth, height: maxHeight, child: child);
  }
}

class DFlex extends StatelessWidget {
  final Widget Function(BuildContext, BoxConstraints, DflexType) builder;

  const DFlex({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenType = DflexScreenMedia.getTypeFromWidth(
          MediaQuery.of(context).size.width,
        );
        return builder(context, constraints, screenType);
      },
    );
  }
}
