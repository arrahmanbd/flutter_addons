part of 'package:flutter_addons/flutter_addons.dart';

extension AnimatedWidgetExtensions on Widget {
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
    return AnimatedWrapper(
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
              child: this,
            ),
          ),
        );
      },
    );
  }

  /// Fade In Effect with delay, repeat, and inverse animation
  Widget fadeIn({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
  }) {
    return AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) =>
              Opacity(opacity: animation.value, child: this),
    );
  }

  /// Scale Animation with repeat, inverse, and delay
  Widget scaleIn({
    Duration duration = const Duration(milliseconds: 500),
    Duration delay = Duration.zero,
    bool repeat = false,
    bool inverse = false,
    double begin = 0.8,
    double end = 1.0,
  }) {
    return AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.scale(
            scale: begin + (animation.value * (end - begin)),
            child: this,
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
    return AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.translate(
            offset: Offset(-offset + (animation.value * offset), 0),
            child: this,
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
    return AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.rotate(
            angle: begin + (animation.value * (end - begin)) * 3.14,
            child: this,
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
    return AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder:
          (context, animation) => Transform.scale(
            scale: begin + (animation.value * (end - begin)),
            child: this,
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
    return AnimatedWrapper(
      duration: duration,
      delay: delay,
      repeat: repeat,
      inverse: inverse,
      builder: (context, animation) {
        return Transform.scale(
          scale: begin + (animation.value * (end - begin)),
          child: this,
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
    return AnimatedWrapper(
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
          child: this,
        );
      },
    );
  }
}

/// Use [Animation]
///
///  Text("Hello, Flutter!").animate(),  // Fade + Scale + Slide
// SizedBox(height: 20),
// Icon(Icons.star, size: 50, color: Colors.amber).spring(),  // Spring Bounce
// SizedBox(height: 20),
// ElevatedButton(
//   onPressed: () {},
//   child: Text("Shake Me"),
// ).shake(repeat: true, intensity: 5),  // Shaky Button
// SizedBox(height: 20),
// Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: List.generate(5, (index) => Icon(Icons.circle, size: 20).staggered(index)),  // Staggered effect
// ),
