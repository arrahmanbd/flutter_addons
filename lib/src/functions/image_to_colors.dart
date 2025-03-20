part of 'package:flutter_addons/flutter_addons.dart';

/// Extracts a pixel array from the given image data.
///
/// This function filters out transparent and nearly white pixels.
///
/// - [imgData]: The raw image data as `Uint8List`.
/// - [pixelCount]: The total number of pixels in the image.
/// - [quality]: The sampling quality factor.
///
/// Returns a list of RGB values for valid pixels.
List<List<int>> _extractPixelArray(
  Uint8List imgData,
  int pixelCount,
  int quality,
) {
  final List<List<int>> pixelArray = [];

  for (var i = 0; i < pixelCount; i += quality) {
    int offset = i * 4;
    int r = imgData[offset];
    int g = imgData[offset + 1];
    int b = imgData[offset + 2];
    int a = imgData[offset + 3];

    if (a >= 125 && !(r > 250 && g > 250 && b > 250)) {
      pixelArray.add([r, g, b]);
    }
  }

  return pixelArray;
}

/// Validates the `colorCount` and `quality` parameters.
List<int> _validateOptions(int? colorCount, int? quality) {
  colorCount =
      (colorCount == null || colorCount < 2) ? 10 : colorCount.clamp(2, 20);
  quality = (quality == null || quality < 1) ? 10 : quality;
  return [colorCount, quality];
}

/// Quantizes an image's colors using the Median Cut Algorithm.
ColorMap? quantize(List<List<int>> pixels, int maxColors) {
  if (pixels.isEmpty || maxColors < 2) return null;

  var vbox = ColorVolumeBox.fromPixels(pixels);
  var pq = PriorityQueue<ColorVolumeBox>(
    (a, b) => b.pixelCount.compareTo(a.pixelCount),
  );
  pq.push(vbox);

  while (pq.length < maxColors && pq.length > 0) {
    var vbox = pq.pop();
    if (vbox.pixelCount == 0) continue;

    var (vbox1, vbox2) = vbox.split();
    pq.push(vbox1);
    if (vbox2 != null) pq.push(vbox2);
  }

  return ColorMap(pq._contents.map((vbox) => vbox.averageColor).toList());
}

/// Represents a color palette generated from quantization.
class ColorMap {
  final List<List<int>> _palette;
  ColorMap(this._palette);

  List<List<int>> palette() => _palette;
}

/// Represents a color volume box for quantization.
class ColorVolumeBox {
  List<List<int>> pixels;
  int? _pixelCount;
  List<int>? _averageColor;

  ColorVolumeBox(this.pixels);

  factory ColorVolumeBox.fromPixels(List<List<int>> pixels) {
    return ColorVolumeBox(pixels);
  }

  int get pixelCount {
    _pixelCount ??= pixels.length;
    return _pixelCount!;
  }

  List<int> get averageColor {
    if (_averageColor != null) return _averageColor!;

    int rSum = 0, gSum = 0, bSum = 0;
    for (var pixel in pixels) {
      rSum += pixel[0];
      gSum += pixel[1];
      bSum += pixel[2];
    }

    _averageColor = [
      (rSum ~/ pixels.length),
      (gSum ~/ pixels.length),
      (bSum ~/ pixels.length),
    ];

    return _averageColor!;
  }

  /// Splits the color volume box into two smaller boxes.
  (ColorVolumeBox, ColorVolumeBox?) split() {
    if (pixels.isEmpty) return (this, null);

    int longestAxis = _findLongestAxis();
    pixels.sort((a, b) => a[longestAxis].compareTo(b[longestAxis]));

    int mid = pixels.length ~/ 2;
    return (
      ColorVolumeBox(pixels.sublist(0, mid)),
      ColorVolumeBox(pixels.sublist(mid)),
    );
  }

  /// Determines the axis with the highest color variance.
  int _findLongestAxis() {
    List<int> minVals = [255, 255, 255];
    List<int> maxVals = [0, 0, 0];

    for (var pixel in pixels) {
      for (int i = 0; i < 3; i++) {
        minVals[i] = min(minVals[i], pixel[i]);
        maxVals[i] = max(maxVals[i], pixel[i]);
      }
    }

    int longestAxis = 0;
    int maxRange = maxVals[0] - minVals[0];

    for (int i = 1; i < 3; i++) {
      int range = maxVals[i] - minVals[i];
      if (range > maxRange) {
        maxRange = range;
        longestAxis = i;
      }
    }

    return longestAxis;
  }
}

/// A generic priority queue implementation.
class PriorityQueue<T> {
  final int Function(T, T) comparator;
  final List<T> _contents = [];
  bool _sorted = false;

  PriorityQueue(this.comparator);

  void _sort() {
    _contents.sort(comparator);
    _sorted = true;
  }

  void push(T element) {
    _contents.add(element);
    _sorted = false;
  }

  T pop() {
    if (!_sorted) _sort();
    return _contents.removeLast();
  }

  int get length => _contents.length;
}

/// Extracts a color palette from raw image bytes.
Future<List<List<int>>?> getPaletteFromBytes(
  Uint8List imageData,
  int width,
  int height, [
  int? colorCount,
  int? quality,
]) async {
  final options = _validateOptions(colorCount, quality);
  colorCount = options[0];
  quality = options[1];

  final int pixelCount = width * height;
  final List<List<int>> pixelArray = _extractPixelArray(
    imageData,
    pixelCount,
    quality,
  );

  final cmap = quantize(pixelArray, colorCount);
  return cmap?.palette();
}

Future<List<List<int>>?> _decodeImageColors(
  ui.Image image, [
  int? colorCount,
  int? quality,
]) async {
  final options = _validateOptions(colorCount, quality);
  colorCount = options[0];
  quality = options[1];

  final ByteData? byteData = await image.toByteData(
    format: ui.ImageByteFormat.rawRgba,
  );
  if (byteData == null) return null;

  final Uint8List imageData = Uint8List.view(byteData.buffer);
  return getPaletteFromBytes(
    imageData,
    image.width,
    image.height,
    colorCount,
    quality,
  );
}



/// Extracts a color palette from an `Image` object.
Future<List<Color>> getPaletteFromImage(
  Uint8List imageData,
  int colorCount,
  int quality,
) async {
  final ui.Codec codec = await ui.instantiateImageCodec(imageData);
  final ui.FrameInfo frame = await codec.getNextFrame();
  final ui.Image uiimage = frame.image;

  List<List<int>>? extractedColors = await _decodeImageColors(
    uiimage,
    colorCount,
    quality,
  );

  if (extractedColors == null) return [];

  return extractedColors
      .map((rgb) => Color.fromARGB(255, rgb[0], rgb[1], rgb[2]))
      .toList();
}
