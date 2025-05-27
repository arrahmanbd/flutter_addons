part of 'package:flutter_addons/flutter_addons.dart';

extension WidgetStackExtensions on Widget {
  /// Wraps the widget in a Stack with other [children]
  /// - `alignment`: stack alignment (default topLeft)
  /// - `fit`: loose or expand
  Widget stackedWith(
    List<Widget> children, {
    AlignmentGeometry alignment = Alignment.topLeft,
    StackFit fit = StackFit.loose,
    Clip clipBehavior = Clip.hardEdge,
  }) {
    return Stack(
      alignment: alignment,
      fit: fit,
      clipBehavior: clipBehavior,
      children: [this, ...children],
    );
  }

  /// Places the widget inside a Stack using Positioned
  /// If any values are null, it behaves as partially positioned.
  Widget positioned({
    double? top,
    double? left,
    double? right,
    double? bottom,
    double? width,
    double? height,
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      width: width,
      height: height,
      child: this,
    );
  }

  /// Wraps the widget in a Center widget
  Widget centered() => Center(child: this);

  /// Wraps the widget in an Align widget
  Widget aligned([AlignmentGeometry alignment = Alignment.center]) =>
      Align(alignment: alignment, child: this);

  /// Wraps the widget in a Positioned.fill
  Widget positionedFill() => Positioned.fill(child: this);

  /// Wraps in a Positioned.fromRect (helper for Rect positioning)
  Widget positionedFromRect(Rect rect) =>
      Positioned.fromRect(rect: rect, child: this);
}
