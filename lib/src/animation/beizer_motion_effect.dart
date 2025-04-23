part of 'package:flutter_addons/flutter_addons.dart';

/// Bezier Motion Effect (Curved Path Animation)
extension BezierMotion on Widget {
  /// Moves the widget along a Bezier curve path.
  Widget bezierMotion({
    Duration duration = const Duration(seconds: 2),
    Duration delay = Duration.zero,
    bool repeat = false,
    List<Offset> controlPoints = const [Offset(50, 200), Offset(150, 100)],
  }) {
    return _BezierMotionWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      controlPoints: controlPoints,
      child: this,
    );
  }
}

class _BezierMotionWrapper extends StatefulWidget {
  final Duration duration;
  final Duration delay;
  final bool repeat;
  final List<Offset> controlPoints;
  final Widget child;

  const _BezierMotionWrapper({
    required this.duration,
    required this.delay,
    required this.repeat,
    required this.controlPoints,
    required this.child,
  });

  @override
  _BezierMotionWrapperState createState() => _BezierMotionWrapperState();
}

class _BezierMotionWrapperState extends State<_BezierMotionWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration);
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    if (widget.repeat) {
      _controller.repeat(reverse: true);
    } else {
      Future.delayed(widget.delay, () => _controller.forward());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        final t = _animation.value;
        final p0 = Offset(0, 0);
        final p1 = widget.controlPoints[0];
        final p2 = widget.controlPoints[1];

        final x =
            pow(1 - t, 2) * p0.dx + 2 * (1 - t) * t * p1.dx + pow(t, 2) * p2.dx;
        final y =
            pow(1 - t, 2) * p0.dy + 2 * (1 - t) * t * p1.dy + pow(t, 2) * p2.dy;

        return Transform.translate(offset: Offset(x, y), child: widget.child);
      },
    );
  }
}
