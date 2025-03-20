part of 'package:flutter_addons/flutter_addons.dart';

/// [Generate Color Schema Based of Material Swatch Color]
class Swatch extends Palette {
  final MaterialColor swatch;
  final Brightness brightness;

  Swatch({required this.swatch, this.brightness = Brightness.light});

  @override
  ColorScheme get colorScheme =>
      ColorScheme.fromSwatch(primarySwatch: swatch, brightness: brightness);
}
