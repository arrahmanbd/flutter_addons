
part of 'package:flutter_addons/flutter_addons.dart';


/// Extension for `Column` widget to provide responsive padding and spacing
extension ResponsiveColumn on Column {
  /// Adds responsive padding to the Column based on screen size
  Column withResponsivePadding({
    required BuildContext context,
    double smallPadding = 8.0,
    double mediumPadding = 16.0,
    double largePadding = 24.0,
  }) {
    double padding;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      padding = smallPadding;
    } else if (screenWidth < 1200) {
      padding = mediumPadding;
    } else {
      padding = largePadding;
    }

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: this,
        ),
      ],
    );
  }

  /// Adds responsive spacing between children
  Column withResponsiveSpacing({
    required BuildContext context,
    double smallSpacing = 8.0,
    double mediumSpacing = 16.0,
    double largeSpacing = 24.0,
  }) {
    double spacing;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      spacing = smallSpacing;
    } else if (screenWidth < 1200) {
      spacing = mediumSpacing;
    } else {
      spacing = largeSpacing;
    }

    return Column(
      children: [
        for (int i = 0; i < children.length; i++)
          i == children.length - 1
              ? children[i]
              : Padding(
                  padding: EdgeInsets.only(bottom: spacing),
                  child: children[i],
                ),
      ],
    );
  }

  /// Aligns children vertically (start, center, or end)
  Column alignChildrenVertically({
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return Column(
      mainAxisAlignment: alignment,
      children: children,
    );
  }

  /// Aligns children horizontally (start, center, or end)
  Column alignChildrenHorizontally({
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
  }) {
    return Column(
      crossAxisAlignment: alignment,
      children: children,
    );
  }

  /// Centers all children within the Column
  Column centerChildren() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  /// Conditionally render children based on a condition
  Column renderConditionally(bool condition) {
    return Column(
      children: children.where((child) => condition).toList(),
    );
  }
}

/// Extension for `Row` widget to provide responsive padding and spacing
extension ResponsiveRow on Row {
  /// Adds responsive padding to the Row based on screen size
  Row withResponsivePadding({
    required BuildContext context,
    double smallPadding = 8.0,
    double mediumPadding = 16.0,
    double largePadding = 24.0,
  }) {
    double padding;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      padding = smallPadding;
    } else if (screenWidth < 1200) {
      padding = mediumPadding;
    } else {
      padding = largePadding;
    }

    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(padding),
          child: this,
        ),
      ],
    );
  }

  /// Adds responsive spacing between children
  Row withResponsiveSpacing({
    required BuildContext context,
    double smallSpacing = 8.0,
    double mediumSpacing = 16.0,
    double largeSpacing = 24.0,
  }) {
    double spacing;
    double screenWidth = MediaQuery.of(context).size.width;

    if (screenWidth < 600) {
      spacing = smallSpacing;
    } else if (screenWidth < 1200) {
      spacing = mediumSpacing;
    } else {
      spacing = largeSpacing;
    }

    return Row(
      children: [
        for (int i = 0; i < children.length; i++)
          i == children.length - 1
              ? children[i]
              : Padding(
                  padding: EdgeInsets.only(right: spacing),
                  child: children[i],
                ),
      ],
    );
  }

  /// Aligns children horizontally (start, center, or end)
  Row alignChildrenHorizontally({
    MainAxisAlignment alignment = MainAxisAlignment.start,
  }) {
    return Row(
      mainAxisAlignment: alignment,
      children: children,
    );
  }

  /// Aligns children vertically (start, center, or end)
  Row alignChildrenVertically({
    CrossAxisAlignment alignment = CrossAxisAlignment.start,
  }) {
    return Row(
      crossAxisAlignment: alignment,
      children: children,
    );
  }

  /// Centers all children within the Row
  Row centerChildren() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: children,
    );
  }

  /// Conditionally render children based on a condition
  Row renderConditionally(bool condition) {
    return Row(
      children: children.where((child) => condition).toList(),
    );
  }
}
