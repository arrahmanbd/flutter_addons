// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

/// A professional overlay that draws a pixel-perfect grid on top of a child widget.
/// Useful for designers and developers to align UI elements.
class PixelPerfectGridOverlay extends StatefulWidget {
  final bool visible;
  final int columns;
  final Color color;
  final double opacity;
  final bool snapToGrid;
  final Widget child;

  const PixelPerfectGridOverlay({
    super.key,
    required this.child,
    this.visible = false,
    this.columns = 12,
    this.color = Colors.green,
    this.opacity = 0.2,
    this.snapToGrid = false,
  });

  @override
  _PixelPerfectGridOverlayState createState() =>
      _PixelPerfectGridOverlayState();
}

class _PixelPerfectGridOverlayState extends State<PixelPerfectGridOverlay> {
  late bool _showGrid;

  @override
  void initState() {
    super.initState();
    // Respect widget.visible, works in debug & release
    _showGrid = widget.visible;
  }

  @override
  void didUpdateWidget(covariant PixelPerfectGridOverlay oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.visible != widget.visible) {
      setState(() {
        _showGrid = widget.visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [widget.child, if (_showGrid) _buildGridOverlay()]);
  }

  Widget _buildGridOverlay() {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columnWidth = constraints.maxWidth / widget.columns;

        return IgnorePointer(
          child: CustomPaint(
            size: Size(constraints.maxWidth, constraints.maxHeight),
            painter: _GridPainter(
              columns: widget.columns,
              columnWidth: columnWidth,
              color: widget.color.withOpacity(widget.opacity),
            ),
          ),
        );
      },
    );
  }
}

class _GridPainter extends CustomPainter {
  final int columns;
  final double columnWidth;
  final Color color;

  _GridPainter({
    required this.columns,
    required this.columnWidth,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Vertical lines
    final verticalPaint =
        Paint()
          ..color = color
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;

    for (var i = 0; i <= columns; i++) {
      final x = i * columnWidth;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), verticalPaint);
    }

    // Horizontal baseline grid every 8px
    final horizontalPaint =
        Paint()
          ..color = color.withOpacity(0.1)
          ..strokeWidth = 1
          ..style = PaintingStyle.stroke;

    for (var y = 0; y < size.height; y += 8) {
      canvas.drawLine(
        Offset(0, y.toDouble()),
        Offset(size.width, y.toDouble()),
        horizontalPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
