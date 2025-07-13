part of 'package:flutter_addons/flutter_addons.dart';

enum BorderShape { rectangle, circle }

enum BorderStyleType { solid, dashed, dotted, text }

class UiBorderBox extends StatelessWidget {
  /// Color for the border.
  final Color color;

  /// Width of each dash (used if style is dashed or dotted).
  final double dashWidth;

  /// Space between dashes/dots.
  final double dashSpace;

  /// Border radius for rectangles (ignored for circle).
  final double borderRadius;

  /// Optional text to paint along the border.
  final String? text;

  /// Shape of the border: rectangle or circle.
  final BorderShape shape;

  /// Style of the border: solid, dashed, dotted, or text.
  final BorderStyleType borderStyle;

  /// Optional gradient for the border.
  final Gradient? gradient;

  /// Child widget inside the border.
  final Widget child;

  const UiBorderBox({
    super.key,
    required this.color,
    this.dashWidth = 8.0,
    this.dashSpace = 8.0,
    this.borderRadius = 12.0,
    this.text,
    this.shape = BorderShape.rectangle,
    this.borderStyle = BorderStyleType.solid,
    this.gradient,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _BorderPainter(
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        borderRadius: borderRadius,
        text: text,
        shape: shape,
        borderStyle: borderStyle,
        gradient: gradient,
      ),
      child: child,
    );
  }
}

class _BorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;
  final String? text;
  final BorderShape shape;
  final BorderStyleType borderStyle;
  final Gradient? gradient;

  _BorderPainter({
    required this.color,
    this.dashWidth = 8.0,
    this.dashSpace = 8.0,
    this.borderRadius = 12.0,
    this.text,
    this.shape = BorderShape.rectangle,
    this.borderStyle = BorderStyleType.solid,
    this.gradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    if (gradient != null) {
      paint.shader = gradient!.createShader(Offset.zero & size);
    }

    final Path path = _getPath(size);

    switch (borderStyle) {
      case BorderStyleType.solid:
        canvas.drawPath(path, paint);
        break;
      case BorderStyleType.dashed:
        _drawDashedPath(canvas, paint, path);
        break;
      case BorderStyleType.dotted:
        _getDotPath(size);
        break;
      case BorderStyleType.text:
        if (text != null) _drawText(canvas, size);
        break;
    }
  }

  // Get dot path (using small circles as borders)
  Path _getDotPath(Size size) {
    final path = Path();
    const double dotRadius = 2.0;
    for (double x = 0; x < size.width; x += dashWidth + dashSpace) {
      for (double y = 0; y < size.height; y += dashWidth + dashSpace) {
        path.addOval(Rect.fromCircle(center: Offset(x, y), radius: dotRadius));
      }
    }
    return path;
  }

  Path _getPath(Size size) {
    switch (shape) {
      case BorderShape.circle:
        final radius = min(size.width, size.height) / 2;
        return Path()..addOval(
          Rect.fromCircle(center: size.center(Offset.zero), radius: radius),
        );
      case BorderShape.rectangle:
        return Path()..addRRect(
          RRect.fromRectXY(Offset.zero & size, borderRadius, borderRadius),
        );
    }
  }

  void _drawDashedPath(Canvas canvas, Paint paint, Path path) {
    double startX = 0;
    final Path dashPath = Path();
    for (final PathMetric pathMetric in path.computeMetrics()) {
      while (startX < pathMetric.length) {
        final double endX = (startX + dashWidth).clamp(0, pathMetric.length);
        dashPath.addPath(pathMetric.extractPath(startX, endX), Offset.zero);
        startX = endX + dashSpace;
      }
      startX = 0; // reset for next metric
    }
    canvas.drawPath(dashPath, paint);
  }

  // Draw the text along the border
  void _drawText(Canvas canvas, Size size) {
    final TextSpan span = TextSpan(
      text: text,
      style: TextStyle(color: color, fontSize: 16, fontWeight: FontWeight.bold),
    );
    final TextPainter textPainter = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(maxWidth: size.width);
    final Offset offset = Offset(
      (size.width - textPainter.width) / 2,
      (size.height - textPainter.height) / 2,
    );
    textPainter.paint(canvas, offset);
  }

  @override
  bool shouldRepaint(covariant _BorderPainter oldDelegate) {
    return color != oldDelegate.color ||
        dashWidth != oldDelegate.dashWidth ||
        dashSpace != oldDelegate.dashSpace ||
        borderRadius != oldDelegate.borderRadius ||
        text != oldDelegate.text ||
        shape != oldDelegate.shape ||
        borderStyle != oldDelegate.borderStyle ||
        gradient != oldDelegate.gradient;
  }
}
