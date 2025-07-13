part of 'package:flutter_addons/flutter_addons.dart';

/// Flexible ListView with [Wrap] inside a scroll view.
/// Supports horizontal or vertical layout.
class UiListView extends StatelessWidget {
  final Axis direction;
  final int itemCount;
  final IndexedWidgetBuilder itemBuilder;

  final double? spacing;
  final double? runSpacing;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool reverse;
  final ScrollController? controller;

  final WrapAlignment? wrapAlignment;
  final WrapCrossAlignment? crossAxisAlignment;

  const UiListView._({
    required this.direction,
    required this.itemCount,
    required this.itemBuilder,
    this.spacing,
    this.runSpacing,
    this.padding,
    this.physics,
    this.controller,
    this.reverse = false,
    this.wrapAlignment,
    this.crossAxisAlignment,
    super.key,
  });

  /// Horizontal scrolling ListView with wrapping
  /// Example:
  /// UIListView.horizontal(
  //   itemCount: 10,
  //   itemBuilder: (context, index) => Chip(label: Text('Item $index')),
  // )
  factory UiListView.horizontal({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    double? spacing,
    double? runSpacing,
    EdgeInsets? padding,
    ScrollPhysics? physics,
    ScrollController? controller,
    bool reverse = false,
    WrapAlignment? wrapAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    Key? key,
  }) {
    return UiListView._(
      direction: Axis.horizontal,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      spacing: spacing,
      runSpacing: runSpacing,
      padding: padding,
      physics: physics,
      controller: controller,
      reverse: reverse,
      wrapAlignment: wrapAlignment,
      crossAxisAlignment: crossAxisAlignment,
      key: key,
    );
  }

  /// Vertical scrolling ListView with wrapping
  /// Example
  /// UIListView.vertical(
  //   itemCount: 20,
  //   itemBuilder: (context, index) => Padding(
  //     padding: const EdgeInsets.all(4.0),
  //     child: Text('Item $index'),
  //   ),
  // )
  factory UiListView.vertical({
    required int itemCount,
    required IndexedWidgetBuilder itemBuilder,
    double? spacing,
    double? runSpacing,
    EdgeInsets? padding,
    ScrollPhysics? physics,
    ScrollController? controller,
    bool reverse = false,
    WrapAlignment? wrapAlignment,
    WrapCrossAlignment? crossAxisAlignment,
    Key? key,
  }) {
    return UiListView._(
      direction: Axis.vertical,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
      spacing: spacing,
      runSpacing: runSpacing,
      padding: padding,
      physics: physics,
      controller: controller,
      reverse: reverse,
      wrapAlignment: wrapAlignment,
      crossAxisAlignment: crossAxisAlignment,
      key: key,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: direction,
      physics: physics,
      padding: padding ?? const EdgeInsets.all(8),
      reverse: reverse,
      controller: controller,
      child: Wrap(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        direction: direction,
        spacing: spacing ?? 8,
        runSpacing: runSpacing ?? 8,
        runAlignment: wrapAlignment ?? WrapAlignment.start,
        crossAxisAlignment: crossAxisAlignment ?? WrapCrossAlignment.start,
        children: List.generate(
          itemCount,
          (index) => itemBuilder(context, index),
        ),
      ),
    );
  }
}
