part of 'package:flutter_addons/flutter_addons.dart';

enum RouteAnimations {
  fade,
  slide,
  scale,
  rotate,
  zoom,
  size,
  slideAndFade,
  rotateAndScale,
  flipAndFade,
  elastic,
  flip,
  slideFromBottom,
  customFadeScale,
  blur,
}

/// navigation operations with optional animations.
class NavigatorManager {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static void _navigate(
    Widget page, {
    RouteAnimations? animation,
    Duration? animationDuration,
    bool replace = false,
    bool removeUntil = false,
  }) {
    assert(
      animation == null || animationDuration != null,
      'Duration must be provided when using a custom animation',
    );

    final context = navigatorKey.currentState?.overlay?.context;

    if (context == null) {
      throw FlutterError('Navigator context is not available.');
    }

    Route route = _getRoute(context, page, animation, animationDuration);

    if (replace) {
      if (removeUntil) {
        navigatorKey.currentState?.pushAndRemoveUntil(route, (route) => false);
      } else {
        navigatorKey.currentState?.pushReplacement(route);
      }
    } else {
      navigatorKey.currentState?.push(route);
    }
  }

  static Route _getRoute(
    BuildContext context,
    Widget page,
    RouteAnimations? animation,
    Duration? duration,
  ) {
    if (animation == null) {
      return _getPlatformRoute(context, page);
    } else {
      return _NavigationAnimationBuilder.build(
        context,
        page,
        animation,
        duration!,
      );
    }
  }

  static Route _getPlatformRoute(BuildContext context, Widget page) {
    if (Theme.of(context).platform == TargetPlatform.iOS) {
      return CupertinoPageRoute(builder: (_) => page);
    } else if (Theme.of(context).platform == TargetPlatform.android) {
      return MaterialPageRoute(builder: (_) => page);
    } else {
      // Default to MaterialPageRoute for other platforms
      return MaterialPageRoute(builder: (_) => page);
    }
  }

  /// Navigate to a new screen.
  static void go(
    Widget page, {
    RouteAnimations? animation,
    Duration? animationDuration,
  }) {
    _navigate(page, animation: animation, animationDuration: animationDuration);
  }

  /// Navigate to a new screen and remove the current screen.
  static void goRemove(
    Widget page, {
    RouteAnimations? animation,
    Duration? animationDuration,
  }) {
    _navigate(
      page,
      animation: animation,
      animationDuration: animationDuration,
      replace: true,
    );
  }

  /// Navigate to a new screen and remove all previous screens.
  static void goRemoveAll(
    Widget page, {
    RouteAnimations? animation,
    Duration? animationDuration,
  }) {
    _navigate(
      page,
      animation: animation,
      animationDuration: animationDuration,
      replace: true,
      removeUntil: true,
    );
  }

  /// Navigate back to the previous screen.
  static void back() {
    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState?.pop();
    } else {
      // Do nothing if there's no page to pop
      debugPrint('No previous page to pop.');
    }
  }
}

/// creation of routes with custom animations.
class _NavigationAnimationBuilder {
  static Route build(
    BuildContext context,
    Widget page,
    RouteAnimations animation,
    Duration duration,
  ) {
    switch (animation) {
      case RouteAnimations.fade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(opacity: animation, child: child);
          },
          transitionDuration: duration,
        );
      case RouteAnimations.slide:
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
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: duration,
        );
      case RouteAnimations.scale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            var tween = Tween(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: curve));
            return ScaleTransition(scale: animation.drive(tween), child: child);
          },
          transitionDuration: duration,
        );
      case RouteAnimations.rotate:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return RotationTransition(turns: animation, child: child);
          },
          transitionDuration: duration,
        );

      case RouteAnimations.zoom:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return ScaleTransition(scale: animation, child: child);
          },
          transitionDuration: duration,
        );
      case RouteAnimations.size:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return Align(
              child: SizeTransition(sizeFactor: animation, child: child),
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.elastic:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final bounceOutTween = CurveTween(curve: Curves.elasticOut);
            return ScaleTransition(
              scale: animation.drive(bounceOutTween),
              child: child,
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.flip:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final flipAnimation = Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(animation);
            return AnimatedBuilder(
              animation: flipAnimation,
              child: child,
              builder: (context, child) {
                final angle = flipAnimation.value * pi;
                final isUnder = (angle > 1.5708);
                if (isUnder) {
                  return Transform(
                    transform: Matrix4.rotationY(angle - pi),
                    alignment: Alignment.center,
                    child: page,
                  );
                } else {
                  return Transform(
                    transform: Matrix4.rotationY(angle),
                    alignment: Alignment.center,
                    child: child,
                  );
                }
              },
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.slideFromBottom:
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
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.customFadeScale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final fadeAnimation = Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(CurvedAnimation(parent: animation, curve: Curves.easeIn));
            final scaleAnimation = Tween(begin: 0.8, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            );
            return FadeTransition(
              opacity: fadeAnimation,
              child: ScaleTransition(scale: scaleAnimation, child: child),
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.blur:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: animation.value * 10,
                    sigmaY: animation.value * 10,
                  ),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: child,
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.slideAndFade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;
            var offsetTween = Tween(
              begin: begin,
              end: end,
            ).chain(CurveTween(curve: curve));
            var fadeTween = Tween(begin: 0.0, end: 1.0);
            return SlideTransition(
              position: animation.drive(offsetTween),
              child: FadeTransition(
                opacity: animation.drive(fadeTween),
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.rotateAndScale:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const curve = Curves.easeInOut;
            var scaleTween = Tween(
              begin: 0.0,
              end: 1.0,
            ).chain(CurveTween(curve: curve));
            return RotationTransition(
              turns: animation,
              child: ScaleTransition(
                scale: animation.drive(scaleTween),
                child: child,
              ),
            );
          },
          transitionDuration: duration,
        );

      case RouteAnimations.flipAndFade:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final flipAnimation = Tween(
              begin: 0.0,
              end: 1.0,
            ).animate(animation);
            return AnimatedBuilder(
              animation: flipAnimation,
              child: child,
              builder: (context, child) {
                final angle = flipAnimation.value * 3.141592653589793;
                final isUnder = (angle > 1.5708);
                return Transform(
                  transform: Matrix4.rotationY(angle),
                  alignment: Alignment.center,
                  child: FadeTransition(
                    opacity: animation,
                    child:
                        isUnder
                            ? Transform(
                              transform: Matrix4.rotationY(3.141592653589793),
                              alignment: Alignment.center,
                              child: page,
                            )
                            : child,
                  ),
                );
              },
            );
          },
          transitionDuration: duration,
        );
    }
  }
}
