part of 'package:flutter_addons/flutter_addons.dart';

extension ListViewGeneratorForList on List {
  /// Generates a ListView.builder widget based on the List
  ListView generateListView({
    required Widget Function(BuildContext, int) itemBuilder,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    bool shrinkWrap = false,
    bool reverse = false,
    ScrollPhysics physics = const BouncingScrollPhysics(),
    EdgeInsetsGeometry? padding,
  }) {
    return ListView.builder(
      controller: controller,
      scrollDirection: scrollDirection,
      physics: physics,
      shrinkWrap: shrinkWrap,
      reverse: reverse,
      padding: padding,
      itemCount: length,
      itemBuilder: itemBuilder,
    );
  }

  /// Generates a List of widgets based on the current list's length
  List<Widget> generateList({required Widget Function(int) itemBuilder}) {
    return List.generate(length, (index) => itemBuilder(index));
  }
}
