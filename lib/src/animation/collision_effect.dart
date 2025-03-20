part of 'package:flutter_addons/flutter_addons.dart';

// Physics-Based Collision Effect (Gravity & Bounce)
extension PhysicsCollision on Widget {
  Widget bounce({
    Duration duration = const Duration(milliseconds: 1200),
    double gravity = 10,
    double elasticity = 0.5,
  }) {
    return _PhysicsCollisionWrapper(
      duration: duration,
      gravity: gravity,
      elasticity: elasticity,
      child: this,
    );
  }
}

class _PhysicsCollisionWrapper extends StatefulWidget {
  final Duration duration;
  final double gravity;
  final double elasticity;
  final Widget child;

  const _PhysicsCollisionWrapper({
    required this.duration,
    required this.gravity,
    required this.elasticity,
    required this.child,
  });

  @override
  _PhysicsCollisionWrapperState createState() => _PhysicsCollisionWrapperState();
}

class _PhysicsCollisionWrapperState extends State<_PhysicsCollisionWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  double velocity = 0;
  double position = 0;
  bool isBouncingUp = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: widget.duration)
      ..addListener(() {
        setState(() {
          velocity += widget.gravity * 0.05;
          position += velocity;
          if (position >= 100) {
            position = 100;
            velocity = -velocity * widget.elasticity;
            isBouncingUp = true;
          }
          if (isBouncingUp && velocity.abs() < 1) {
            _controller.stop();
          }
        });
      })
      ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(offset: Offset(0, position), child: widget.child);
  }
}
