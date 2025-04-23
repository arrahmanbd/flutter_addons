part of 'package:flutter_addons/flutter_addons.dart';

/// Extension on `Color` to provide additional utility methods for color manipulation and analysis.
extension ColorExtensions on Color {
  /// Converts the `Color` object to a hexadecimal string representation.
  ///
  /// You can customize the output by setting [leadingHashSign] to include or omit the '#' symbol.
  /// You can also include the alpha (transparency) value in the hex string by setting [includeAlpha].
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// String hex = color.toHex(); // Output: #42A5F5
  /// String hexWithAlpha = color.toHex(includeAlpha: true); // Output: #FF42A5F5
  /// ```
  String toHex({bool leadingHashSign = true, bool includeAlpha = false}) =>
      '${leadingHashSign ? '#' : ''}'
      '${includeAlpha ? a.toInt().toRadixString(16).padLeft(2, '0') : ''}'
      '${r.toInt().toRadixString(16).padLeft(2, '0')}'
      '${g.toInt().toRadixString(16).padLeft(2, '0')}'
      '${b.toInt().toRadixString(16).padLeft(2, '0')}';

  /// Determines whether the given color is "dark".
  ///
  /// A color is considered dark if its brightness is less than 128.
  /// The brightness is calculated based on the RGB values of the color.
  ///
  /// Example:
  /// ```dart
  /// Color darkColor = Color(0xFF1A1A1A);
  /// print(darkColor.isDark()); // Output: true
  ///
  /// Color lightColor = Color(0xFFFFF1F1);
  /// print(lightColor.isDark()); // Output: false
  /// ```
  bool isDark() => getBrightness() < 128.0;

  /// Determines whether the given color is "light".
  ///
  /// A color is considered light if it is not dark.
  ///
  /// Example:
  /// ```dart
  /// Color lightColor = Color(0xFFFFF1F1);
  /// print(lightColor.isLight()); // Output: true
  ///
  /// Color darkColor = Color(0xFF1A1A1A);
  /// print(darkColor.isLight()); // Output: false
  /// ```
  bool isLight() => !isDark();

  /// Calculates the brightness of the color.
  ///
  /// Brightness is calculated based on the weighted sum of the red, green, and blue components.
  /// This method returns a value between 0 (dark) and 255 (light), where higher values represent brighter colors.
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// double brightness = color.getBrightness();
  /// print(brightness); // Output: 121.14 (indicating a darker color)
  /// ```
  double getBrightness() => (r * 299 + g * 587 + b * 114) / 1000;

  /// Returns the luminance of the color.
  ///
  /// Luminance is calculated using a specific formula that takes into account the perceived brightness
  /// of the red, green, and blue components. It provides a better representation of how bright a color is
  /// compared to brightness, which is more linear.
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// double luminance = color.getLuminance();
  /// print(luminance); // Output: 0.309 (indicating how bright the color is)
  /// ```
  double getLuminance() => computeLuminance();

  /// Returns a lighter shade of the current color.
  ///
  /// This method lightens the color by the given factor. The factor should be between 0 and 1, where 0 is the original color
  /// and 1 is the lightest possible shade (white).
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// Color lighterColor = color.lighten(0.2); // Lightens the color by 20%
  /// ```
  Color lighten(double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor should be between 0 and 1');
    return Color.fromARGB(
      a.toInt(),
      (r + (255 - r) * factor).toInt(),
      (g + (255 - g) * factor).toInt(),
      (b + (255 - b) * factor).toInt(),
    );
  }

  /// Returns a darker shade of the current color.
  ///
  /// This method darkens the color by the given factor. The factor should be between 0 and 1, where 0 is the original color
  /// and 1 is the darkest possible shade (black).
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// Color darkerColor = color.darken(0.2); // Darkens the color by 20%
  /// ```
  Color darken(double factor) {
    assert(factor >= 0 && factor <= 1, 'Factor should be between 0 and 1');
    return Color.fromARGB(
      a.toInt(),
      (r * (1 - factor)).toInt(),
      (g * (1 - factor)).toInt(),
      (b * (1 - factor)).toInt(),
    );
  }

  /// Blends the current color with another color using a specified blending ratio.
  ///
  /// The `blend` method blends the current color and another color based on the given ratio. The ratio should be between
  /// 0 and 1, where 0 represents the first color (current color) and 1 represents the second color.
  ///
  /// Example:
  /// ```dart
  /// Color color1 = Color(0xFF42A5F5);
  /// Color color2 = Color(0xFFFF5722);
  /// Color blendedColor = color1.blend(color2, 0.5); // Blends 50% of both colors
  /// ```
  Color blend(Color other, double ratio) {
    assert(ratio >= 0 && ratio <= 1, 'Ratio should be between 0 and 1');
    return Color.fromARGB(
      (a * (1 - ratio) + other.a * ratio).toInt(),
      (r * (1 - ratio) + other.r * ratio).toInt(),
      (g * (1 - ratio) + other.g * ratio).toInt(),
      (b * (1 - ratio) + other.b * ratio).toInt(),
    );
  }

  /// Generates a complementary color by inverting the current color.
  ///
  /// The complementary color is the color that lies opposite to the current color on the color wheel.
  /// This is achieved by subtracting each RGB value from 255 (the maximum possible value).
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// Color complementaryColor = color.complementary();
  /// print(complementaryColor); // Output: a color that contrasts with the blue color.
  /// ```
  Color complementary() {
    return Color.fromARGB(
      a.toInt(),
      255 - r.toInt(),
      255 - g.toInt(),
      255 - b.toInt(),
    );
  }

  /// Converts the current color to a grayscale color by averaging the red, green, and blue channels.
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// Color grayScale = color.toGrayscale();
  /// print(grayScale); // Output: a grayscale version of the color.
  /// ```
  Color toGrayscale() {
    int gray = ((r + g + b) / 3).round();
    return Color.fromARGB(a.toInt(), gray, gray, gray);
  }

  /// Returns the `Color` as a semi-transparent version of itself based on the provided opacity factor.
  ///
  /// The `opacity` factor should be between 0.0 (fully transparent) and 1.0 (fully opaque).
  ///
  /// Example:
  /// ```dart
  /// Color color = Color(0xFF42A5F5);
  /// Color semiTransparent = color.withOpacityFactor(0.5); // 50% opacity
  /// ```
  Color withOpacityFactor(double opacity) {
    assert(
      opacity >= 0.0 && opacity <= 1.0,
      'Opacity must be between 0.0 and 1.0',
    );
    return Color.fromARGB(
      (a * opacity).toInt(),
      r.toInt(),
      g.toInt(),
      b.toInt(),
    );
  }
}
