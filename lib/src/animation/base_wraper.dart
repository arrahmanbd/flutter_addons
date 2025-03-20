part of 'package:flutter_addons/flutter_addons.dart';

class AnimatedWrapper extends StatefulWidget {
  final Duration duration;
  final Duration delay;
  final bool repeat;
  final bool inverse;
  final Widget Function(BuildContext, Animation<double>) builder;

  const AnimatedWrapper({
    super.key,
    required this.duration,
    required this.delay,
    required this.repeat,
    required this.inverse,
    required this.builder,
  });

  @override
  AnimatedWrapperState createState() => AnimatedWrapperState();
}

class AnimatedWrapperState extends State<AnimatedWrapper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.inverse ? Curves.easeInOutBack : Curves.easeOut,
    );

    if (widget.repeat) {
      _controller.repeat(reverse: widget.inverse);
    } else {
      if (widget.delay > Duration.zero) {
        Future.delayed(widget.delay, () => _controller.forward());
      } else {
        _controller.forward();
      }
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
      builder: (context, child) => widget.builder(context, _animation),
    );
  }
}
