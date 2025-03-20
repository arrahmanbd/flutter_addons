// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:visibility_detector/visibility_detector.dart';

// class AnimatedWrapper extends StatefulWidget {
//   final Duration duration;
//   final Duration delay;
//   final bool repeat;
//   final bool inverse;
//   final Widget Function(BuildContext context, Animation<double> animation) builder;

//   AnimatedWrapper({
//     required this.duration,
//     required this.delay,
//     required this.repeat,
//     required this.inverse,
//     required this.builder,
//   });

//   @override
//   _AnimatedWrapperState createState() => _AnimatedWrapperState();
// }

// class _AnimatedWrapperState extends State<AnimatedWrapper> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;
//   bool _isVisible = false;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: widget.duration);
//     _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
//   }

//   void _startAnimation() {
//     if (_controller.status == AnimationStatus.dismissed) {
//       _controller.forward();
//     }
//   }

//   void _resetAnimation() {
//     _controller.reverse();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return VisibilityDetector(
//       key: Key('animated-widget'),
//       onVisibilityChanged: (visibilityInfo) {
//         if (visibilityInfo.visibleFraction > 0 && !_isVisible) {
//           // Start the animation when the widget is visible
//           setState(() {
//             _isVisible = true;
//           });
//           _startAnimation();
//         } else if (visibilityInfo.visibleFraction == 0 && _isVisible) {
//           // Reset the animation when widget goes out of view
//           setState(() {
//             _isVisible = false;
//           });
//           _resetAnimation();
//         }
//       },
//       child: AnimatedBuilder(
//         animation: _animation,
//         builder: widget.builder,
//       ),
//     );
//   }
// }

// extension AnimatedWidgetExtensions on Widget {
//   Widget animate({
//     Duration duration = const Duration(milliseconds: 700),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double scaleBegin = 0.8,
//     double scaleEnd = 1.0,
//     double slideX = 50,
//     double slideY = 0,
//     double opacityBegin = 0.0,
//     double opacityEnd = 1.0,
//   }) {
//     return VisibilityDetector(
//       key: Key('animated-widget'),
//       onVisibilityChanged: (visibilityInfo) {
//         // Handle visibility changes
//       },
//       child: AnimatedWrapper(
//         duration: duration,
//         delay: delay,
//         repeat: repeat,
//         inverse: inverse,
//         builder: (context, animation) {
//           return Opacity(
//             opacity: opacityBegin + (animation.value * (opacityEnd - opacityBegin)),
//             child: Transform.scale(
//               scale: scaleBegin + (animation.value * (scaleEnd - scaleBegin)),
//               child: Transform.translate(
//                 offset: Offset(
//                   slideX * (1 - animation.value),
//                   slideY * (1 - animation.value),
//                 ),
//                 child: this,
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   /// Fade In Effect with delay, repeat, and inverse animation
//   Widget fadeIn({
//     Duration duration = const Duration(milliseconds: 500),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Opacity(
//           opacity: animation.value,
//           child: this,
//         );
//       },
//     );
//   }

//   /// Scale Animation with repeat, inverse, and delay
//   Widget scaleIn({
//     Duration duration = const Duration(milliseconds: 500),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double begin = 0.8,
//     double end = 1.0,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Transform.scale(
//           scale: begin + (animation.value * (end - begin)),
//           child: this,
//         );
//       },
//     );
//   }

//   /// Slide in from left with repeat and inverse
//   Widget slideInFromLeft({
//     Duration duration = const Duration(milliseconds: 500),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double offset = 50,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Transform.translate(
//           offset: Offset(-offset + (animation.value * offset), 0),
//           child: this,
//         );
//       },
//     );
//   }

//   /// Rotation animation
//   Widget rotate({
//     Duration duration = const Duration(milliseconds: 800),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double begin = 0.0,
//     double end = 1.0,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Transform.rotate(
//           angle: begin + (animation.value * (end - begin)) * 3.14,
//           child: this,
//         );
//       },
//     );
//   }

//   /// Bounce effect
//   Widget bounce({
//     Duration duration = const Duration(milliseconds: 800),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double begin = 0.8,
//     double end = 1.0,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Transform.scale(
//           scale: begin + (animation.value * (end - begin)),
//           child: this,
//         );
//       },
//     );
//   }

//   /// Spring animation (bounce effect)
//   Widget spring({
//     Duration duration = const Duration(milliseconds: 800),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double begin = 0.8,
//     double end = 1.0,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Transform.scale(
//           scale: begin + (animation.value * (end - begin)),
//           child: this,
//         );
//       },
//     );
//   }

//   Widget staggered(int index, {Duration duration = const Duration(milliseconds: 700)}) {
//     return animate(
//       duration: duration,
//       delay: Duration(milliseconds: 100 * index),
//     );
//   }

//   /// Randomized shake effect
//   Widget shake({
//     Duration duration = const Duration(milliseconds: 500),
//     Duration delay = Duration.zero,
//     bool repeat = false,
//     bool inverse = false,
//     double intensity = 10,
//   }) {
//     return AnimatedWrapper(
//       duration: duration,
//       delay: delay,
//       repeat: repeat,
//       inverse: inverse,
//       builder: (context, animation) {
//         return Transform.translate(
//           offset: Offset(
//             (Random().nextDouble() * intensity - intensity / 2) * animation.value,
//             0,
//           ),
//           child: this,
//         );
//       },
//     );
//   }
// }
