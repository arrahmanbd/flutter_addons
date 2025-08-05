part of 'package:flutter_addons/flutter_addons.dart';

class Zero {
  const Zero._();

  /// Zero EdgeInsets (padding or margin).
  static const EdgeInsets insets = EdgeInsets.zero;

  /// A zero-sized SizedBox.
  static const SizedBox box = SizedBox.shrink();

  /// Zero BorderRadius.
  static const BorderRadius borderRadius = BorderRadius.zero;

  /// Zero Border for containers or boxes.
  static const Border border = Border.fromBorderSide(BorderSide.none);

  /// A transparent borderless BoxDecoration.
  static const BoxDecoration decoration = BoxDecoration();

  /// Zero Radius for ShapeBorder or Circular widgets.
  static const Radius radius = Radius.zero;

  /// Zero Size object.
  static const Size size = Size.zero;

  /// Zero Offset.
  static const Offset offset = Offset.zero;

  /// Zero EdgeInsets for horizontal and vertical directions.
  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: 0);
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: 0);

  /// Zero duration.
  static const Duration duration = Duration.zero;
}
