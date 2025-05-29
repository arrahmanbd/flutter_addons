part of 'package:flutter_addons/flutter_addons.dart';

class AnimateProxy {
  final Widget child;

  const AnimateProxy(this.child);

  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) =>
              Opacity(opacity: animation.value, child: child),
    );
  }

  /// Combined animation with fade, scale, and slide effects etc
  Widget animate({
    Duration duration = const Duration(milliseconds: 700),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double scaleBegin = 0.8,
    double scaleEnd = 1.0,
    double slideX = 50,
    double slideY = 0,
    double opacityBegin = 0.0,
    double opacityEnd = 1.0,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder: (context, animation) {
        return Opacity(
          opacity:
              opacityBegin + (animation.value * (opacityEnd - opacityBegin)),
          child: Transform.scale(
            scale: scaleBegin + (animation.value * (scaleEnd - scaleBegin)),
            child: Transform.translate(
              offset: Offset(
                slideX * (1 - animation.value),
                slideY * (1 - animation.value),
              ),
              child: child,
            ),
          ),
        );
      },
    );
  }

  /// Scale Animation with repeat, inverse, and delay
  Widget zoomIn({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.scale(
            scale: begin + (animation.value * (end - begin)),
            child: child,
          ),
    );
  }

  /// Slide in from left with repeat and inverse
  Widget slideInFromLeft({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double offset = 50,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.translate(
            offset: Offset(-offset + (animation.value * offset), 0),
            child: child,
          ),
    );
  }

  /// Rotation animation
  Widget rotate({
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double begin = 0.0,
    double end = 1.0,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.rotate(
            angle: begin + (animation.value * (end - begin)) * 3.14,
            child: child,
          ),
    );
  }

  /// Bounce effect
  Widget bounce({
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.scale(
            scale: begin + (animation.value * (end - begin)),
            child: child,
          ),
    );
  }

  /// Spring animation (bounce effect)
  Widget spring({
    Duration duration = const Duration(milliseconds: 800),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder: (context, animation) {
        return Transform.scale(
          scale: begin + (animation.value * (end - begin)),
          child: child,
        );
      },
    );
  }

  Widget staggered(
    int index, {
    Duration duration = const Duration(milliseconds: 700),
  }) {
    return animate(
      duration: duration,
      delay: Duration(milliseconds: 100 * index),
    );
  }

  /// Randomized shake effect
  Widget shake({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double intensity = 10,
  }) {
    return _AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder: (context, animation) {
        return Transform.translate(
          offset: Offset(
            (Random().nextDouble() * intensity - intensity / 2) *
                animation.value,
            0,
          ),
          child: child,
        );
      },
    );
  }

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
      child: child,
    );
  }

  Widget bounceCollision({
    Duration duration = const Duration(milliseconds: 1200),
    double gravity = 10,
    double elasticity = 0.5,
  }) {
    return _PhysicsCollisionWrapper(
      duration: duration,
      gravity: gravity,
      elasticity: elasticity,
      child: child,
    );
  }
}
