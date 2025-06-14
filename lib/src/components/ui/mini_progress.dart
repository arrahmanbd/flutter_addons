part of 'package:flutter_addons/flutter_addons.dart';

class MiniProgressBar extends StatefulWidget {
  final Duration duration;
  final VoidCallback? onComplete;
  final double height;
  final Color? color;
  final Color? background;

  const MiniProgressBar({
    Key? key,
    this.duration = const Duration(seconds: 5),
    this.onComplete,
    this.height = 10.0,
    this.color,
    this.background,
  }) : super(key: key);

  @override
  _MiniProgressBarState createState() => _MiniProgressBarState();
}

class _MiniProgressBarState extends State<MiniProgressBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );

    _animationController.forward().whenComplete(() {
      if (widget.onComplete != null) {
        widget.onComplete!();
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: widget.height,
          decoration: BoxDecoration(
            color: widget.background ?? context.secondaryContent,
            borderRadius: BorderRadius.circular(widget.height / 2),
          ),
        ),
        AnimatedBuilder(
          animation: _progressAnimation,
          builder: (context, child) {
            return Container(
              width: 200 * _progressAnimation.value,
              height: widget.height,
              decoration: BoxDecoration(
                color: widget.color ?? context.primaryColor,
                borderRadius: BorderRadius.circular(widget.height / 2),
              ),
            );
          },
        ),
      ],
    );
  }
}
