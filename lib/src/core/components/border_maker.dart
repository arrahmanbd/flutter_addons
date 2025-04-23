// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

enum BorderShape { rectangle, triangle, dot, dash }

class BorderMaker extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;
  final String? text;
  final BorderShape borderShape;
  final Widget child;

  const BorderMaker({
    super.key,
    required this.color,
    this.dashWidth = 8.0,
    this.dashSpace = 8.0,
    this.borderRadius = 12.0,
    this.text,
    this.borderShape = BorderShape.rectangle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: DottedBorderPainter(
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        borderRadius: borderRadius,
        text: text,
        borderShape: borderShape,
      ),
      child: child,
    );
  }
}

class DottedBorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;
  final String? text;
  final BorderShape borderShape;

  DottedBorderPainter({
    this.color = Colors.yellowAccent,
    this.dashWidth = 8.0,
    this.dashSpace = 8.0,
    this.borderRadius = 12.0,
    this.text,
    this.borderShape = BorderShape.rectangle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    Path path;

    switch (borderShape) {
      case BorderShape.triangle:
        path = _getTrianglePath(size);
        break;
      case BorderShape.dot:
        path = _getDotPath(size);
        break;
      case BorderShape.dash:
        path = _getDashPath(size);
        break;
      case BorderShape.rectangle:
        path = _getRectanglePath(size);
        break;
    }

    // Draw shape with dashed/dotted border
    _drawDashedPath(canvas, paint, path);

    // If text is provided, draw it as part of the border
    if (text != null) {
      _drawText(canvas, size);
    }
  }

  // Draw dashed path
  void _drawDashedPath(Canvas canvas, Paint paint, Path path) {
    double startX = 0;
    Path dashPath = Path();
    for (final PathMetric pathMetric in path.computeMetrics()) {
      while (startX < pathMetric.length) {
        final double endX = (startX + dashWidth).clamp(0, pathMetric.length);
        dashPath.addPath(pathMetric.extractPath(startX, endX), Offset.zero);
        startX = endX + dashSpace;
      }
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

  // Get rectangle path
  Path _getRectanglePath(Size size) {
    return Path()..addRRect(
      RRect.fromRectXY(Offset.zero & size, borderRadius, borderRadius),
    );
  }

  // Get triangle path
  Path _getTrianglePath(Size size) {
    final path =
        Path()
          ..moveTo(size.width / 2, 0)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height)
          ..close();
    return path;
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

  // Get dash path (straight line dashes)
  Path _getDashPath(Size size) {
    return Path()..addRRect(
      RRect.fromRectXY(Offset.zero & size, borderRadius, borderRadius),
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

class DotBorder extends StatelessWidget {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;
  final Widget child;

  const DotBorder({
    super.key,
    required this.color,
    this.dashWidth = 8.0,
    this.dashSpace = 8.0,
    this.borderRadius = 12.0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DotBorderPainter(
        color: color,
        dashWidth: dashWidth,
        dashSpace: dashSpace,
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}

class _DotBorderPainter extends CustomPainter {
  final Color color;
  final double dashWidth;
  final double dashSpace;
  final double borderRadius;

  _DotBorderPainter({
    this.color = Colors.yellowAccent,
    this.dashWidth = 8.0,
    this.dashSpace = 8.0,
    this.borderRadius = 12.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    double startX = 0;
    final Path path =
        Path()..addRRect(
          RRect.fromRectXY(Offset.zero & size, borderRadius, borderRadius),
        );

    Path dashPath = Path();
    for (final PathMetric pathMetric in path.computeMetrics()) {
      while (startX < pathMetric.length) {
        final double endX = (startX + dashWidth).clamp(0, pathMetric.length);
        dashPath.addPath(pathMetric.extractPath(startX, endX), Offset.zero);
        startX = endX + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}

/// Extension to add a custom border to any widget
/// using the BorderMaker widget.
/// This extension allows you to easily apply a custom border
/// with various styles (rectangle, triangle, dot, dash) to any widget.
/// You can also customize the color, dash width, dash space,
extension BorderExtension on Widget {
  Widget withCustomBorder({
    required Color color,
    double dashWidth = 8.0,
    double dashSpace = 8.0,
    double borderRadius = 12.0,
    String? text,
    BorderShape borderShape = BorderShape.rectangle,
  }) {
    return BorderMaker(
      color: color,
      dashWidth: dashWidth,
      dashSpace: dashSpace,
      borderRadius: borderRadius,
      text: text,
      borderShape: borderShape,
      child: this, // The widget on which we're applying the border
    );
  }
}
