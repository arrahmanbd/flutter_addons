part of 'package:flutter_addons/flutter_addons.dart';

/// Graph-style positioning system with (x, x') and (y, y') notation
enum GraphPosition {
  center(0, 0),
  topCenter(0, -1),
  bottomCenter(0, 1),
  leftCenter(-1, 0),
  rightCenter(1, 0),

  topLeft(-1, -1),
  topRight(1, -1),
  bottomLeft(-1, 1),
  bottomRight(1, 1);

  final int x; // Base X position (horizontal)
  final int y; // Base Y position (vertical)

  const GraphPosition(this.x, this.y);
}

extension WidgetCentering on Widget {
  /// Centers the widget inside a Center widget
  // 1. Extension to Center Widget with a Custom Alignment
  Widget toCenter({Alignment alignment = Alignment.center}) {
    return Align(alignment: alignment, child: this);
  }

  /// Aligns the widget inside an Align widget
  Widget align(Alignment alignment) => Align(alignment: alignment, child: this);

  /// Positions the widget inside a Stack with optional top, bottom, left, right values
  Widget setPosition({
    double? top,
    double? bottom,
    double? left,
    double? right,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: this,
    );
  }

  /// Positions the widget inside a Stack based on graph-style (x, x') and (y, y')
  Widget positioned(
    GraphPosition position, {
    double? offsetX,
    double? offsetY,
  }) {
    return Positioned(
      left: _getLeft(position, offsetX),
      right: _getRight(position, offsetX),
      top: _getTop(position, offsetY),
      bottom: _getBottom(position, offsetY),
      child: this,
    );
  }

  // Helper functions to convert graph-style to positioning (x, x') and (y, y')
  double? _getLeft(GraphPosition pos, double? offset) =>
      (pos.x == -1) ? (offset ?? 0) : null;

  double? _getRight(GraphPosition pos, double? offset) =>
      (pos.x == 1) ? (offset ?? 0) : null;

  double? _getTop(GraphPosition pos, double? offset) =>
      (pos.y == -1) ? (offset ?? 0) : null;

  double? _getBottom(GraphPosition pos, double? offset) =>
      (pos.y == 1) ? (offset ?? 0) : null;

  /// Wraps the widget inside a Stack with optional positioned children
  Widget stackWith({List<Widget> children = const []}) {
    return Stack(
      children: [
        this, // The base widget
        ...children, // Additional stacked widgets
      ],
    );
  }
}
