part of 'package:flutter_addons/flutter_addons.dart';

class ResponsiveTransitionBuilder {
  static AnimatedSwitcherTransitionBuilder resolve(ResponsiveTransition type) {
    switch (type) {
      case ResponsiveTransition.fade:
        return _fade;
      case ResponsiveTransition.slide:
        return _slide;
      case ResponsiveTransition.scale:
        return _scale;
      case ResponsiveTransition.slideScale:
        return _slideScale;
      case ResponsiveTransition.rotation:
        return _rotation;
    }
  }

  static Widget _fade(Widget child, Animation<double> animation) {
    return FadeTransition(opacity: animation, child: child);
  }

  static Widget _slide(Widget child, Animation<double> animation) {
    final offset = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(animation);

    return SlideTransition(position: offset, child: child);
  }

  static Widget _scale(Widget child, Animation<double> animation) {
    final scale = Tween<double>(begin: 0.95, end: 1.0).animate(animation);
    return ScaleTransition(scale: scale, child: child);
  }

  static Widget _slideScale(Widget child, Animation<double> animation) {
    final offset = Tween<Offset>(
      begin: const Offset(0.0, 0.1),
      end: Offset.zero,
    ).animate(animation);

    final scale = Tween<double>(begin: 0.95, end: 1.0).animate(animation);

    return SlideTransition(
      position: offset,
      child: ScaleTransition(scale: scale, child: child),
    );
  }

  static Widget _rotation(Widget child, Animation<double> animation) {
    return RotationTransition(
      turns: Tween<double>(begin: 0.97, end: 1.0).animate(animation),
      child: child,
    );
  }
}
