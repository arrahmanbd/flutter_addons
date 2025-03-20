part of 'package:flutter_addons/flutter_addons.dart';

/// [Generate Color Schema Based of Seed Color]
class Seed extends Palette {
  final Color seed;
  final Brightness brightness;

  Seed({required this.seed, this.brightness = Brightness.light});

  /// Generate a ColorScheme from seed color and brightness
  @override
  ColorScheme get colorScheme =>
      ColorScheme.fromSeed(seedColor: seed, brightness: brightness);
}
