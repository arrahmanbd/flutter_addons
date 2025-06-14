part of 'package:flutter_addons/flutter_addons.dart';

/// [Generate Color Schema Based of Material Swatch Color]
class Swatch extends Palette {
  final MaterialColor swatchColor;
  final Brightness brightness;

  Swatch({required this.swatchColor, this.brightness = Brightness.light});

  @override
  ColorScheme get colorScheme => ColorScheme.fromSwatch(
    primarySwatch: swatchColor,
    brightness: brightness,
  );
}
