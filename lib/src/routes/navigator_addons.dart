
part of 'package:flutter_addons/flutter_addons.dart';

// Flutter Navigatotion Addon
/// Helper class to provide easy and structured navigation methods
class NavigatorHelperAddons {
  final NavigatorState _navigator;

  NavigatorHelperAddons(this._navigator);

  bool canPop() => _navigator.canPop();
  Future<bool> maybePop<T extends Object?>([T? result]) =>
      _navigator.maybePop(result);
  void pop<T extends Object?>([T? result]) => _navigator.pop(result);
  void popUntil(RoutePredicate predicate) => _navigator.popUntil(predicate);
  Future<T?> push<T extends Object?>(Route<T> route) => _navigator.push(route);
  Future<T?> pushNamed<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) => _navigator.pushNamed(routeName, arguments: arguments);
  Future<T?> pushReplacementNamed<T extends Object?, TO extends Object?>(
    String routeName, {
    TO? result,
    Object? arguments,
  }) => _navigator.pushReplacementNamed(
    routeName,
    result: result,
    arguments: arguments,
  );
  Future<T?> pushAndRemoveUntil<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate,
  ) => _navigator.pushAndRemoveUntil(newRoute, predicate);

  Future<T?> pushMaterial<T>(Widget page, {RouteSettings? settings}) =>
      _navigator.push(
        MaterialPageRoute(builder: (_) => page, settings: settings),
      );

  Future<T?> pushCupertino<T>(Widget page, {RouteSettings? settings}) =>
      _navigator.push(
        CupertinoPageRoute(builder: (_) => page, settings: settings),
      );

  Future<T?> pushReplacementMaterial<T, TO>(
    Widget page, {
    TO? result,
    RouteSettings? settings,
  }) => _navigator.pushReplacement(
    MaterialPageRoute(builder: (_) => page, settings: settings),
    result: result,
  );

  Future<T?> pushReplacementCupertino<T, TO>(
    Widget page, {
    TO? result,
    RouteSettings? settings,
  }) => _navigator.pushReplacement(
    CupertinoPageRoute(builder: (_) => page, settings: settings),
    result: result,
  );

  void removeRoute(Route<dynamic> route) => _navigator.removeRoute(route);
  void removeRouteBelow(Route<dynamic> anchorRoute) =>
      _navigator.removeRouteBelow(anchorRoute);

  // Push with animation (default is slideFromRight)
  Future<T?> pushWithAnimation<T>(
    Widget page, {
    AnimationType animationType = AnimationType.slideFromRight,
    RouteSettings? settings,
  }) {
    return _navigator.push(
      PageAnimation.getPageTransition(page, animationType) as Route<T>,
    );
  }

  // Push named with animation (default is slideFromRight)
  Future<T?> pushNamedWithAnimation<T extends Object?>(
    String routeName, {
    AnimationType animationType = AnimationType.slideFromRight,
    Object? arguments,
  }) {
    return _navigator.pushNamed(routeName, arguments: arguments);
  }

  // Push Replacement with animation (default is slideFromRight)
  Future<T?>
  pushReplacementWithAnimation<T extends Object?, TO extends Object?>(
    Widget page, {
    AnimationType animationType = AnimationType.slideFromRight,
    TO? result,
    RouteSettings? settings,
  }) {
    return _navigator.pushReplacement(
      PageAnimation.getPageTransition(page, animationType) as Route<T>,
      result: result,
    );
  }

  // Push and Remove Until with animation (default is slideFromRight)
  Future<T?> pushAndRemoveUntilWithAnimation<T extends Object?>(
    Route<T> newRoute,
    RoutePredicate predicate, {
    AnimationType animationType = AnimationType.slideFromRight,
  }) {
    return _navigator.pushAndRemoveUntil(
      PageAnimation.getPageTransition(
            newRoute.settings as Widget,
            animationType,
          )
          as Route<T>, // Wrap the route with the animation
      predicate,
    );
  }
}
