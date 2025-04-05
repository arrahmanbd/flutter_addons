part of 'package:flutter_addons/flutter_addons.dart';

/// Abstract class for All Colors
abstract class Palette {
  const Palette();

  /// Common getter to get a `ColorScheme` from any state
  ColorScheme get colorScheme;
}
