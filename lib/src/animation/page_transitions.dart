part of 'package:flutter_addons/flutter_addons.dart';

/// Enum for available animations
enum AnimationType {
  fade,
  slideFromRight,
  slideFromLeft,
  scale,
  rotate,
  rotatescale,
}

class PageAnimation {
  static PageRouteBuilder getPageTransition(
    Widget page,
    AnimationType animationType,
  ) {
    switch (animationType) {
      case AnimationType.rotate:
        return rotateTransition(page);
      case AnimationType.slideFromRight:
        return slideFromRightTransition(page);
      case AnimationType.slideFromLeft:
        return slideFromLeftTransition(page);
      case AnimationType.scale:
        return scaleTransition(page);
      case AnimationType.rotatescale:
        return rotateScaleTransition(page);
      default:
        return fadeTransition(page); // Default to fade if none is provided
    }
  }

  // Fade Transition
  static PageRouteBuilder fadeTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  // Slide from Right
  static PageRouteBuilder slideFromRightTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Slide from Left
  static PageRouteBuilder slideFromLeftTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(-1.0, 0.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Slide from Bottom
  static PageRouteBuilder slideFromBottomTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOut;

        var tween = Tween(
          begin: begin,
          end: end,
        ).chain(CurveTween(curve: curve));

        return SlideTransition(position: animation.drive(tween), child: child);
      },
    );
  }

  // Scale Transition
  static PageRouteBuilder scaleTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return ScaleTransition(scale: animation, child: child);
      },
    );
  }

  // Rotate transition
  static PageRouteBuilder rotateTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var rotationTween = Tween(
          begin: 0.0,
          end: 1.0,
        ).chain(CurveTween(curve: Curves.easeInOut));
        var rotateAnimation = animation.drive(rotationTween);

        return RotationTransition(turns: rotateAnimation, child: child);
      },
    );
  }

  // Rotation + Scale Transition
  static PageRouteBuilder rotateScaleTransition(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return RotationTransition(
          turns: animation,
          child: ScaleTransition(scale: animation, child: child),
        );
      },
    );
  }
}
