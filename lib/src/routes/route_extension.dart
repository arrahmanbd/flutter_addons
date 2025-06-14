part of 'package:flutter_addons/flutter_addons.dart';

// Navigator addons on Context
/// Navigator helper extensions for adding animations and context-based navigation

extension NavigationExtension on BuildContext {
  NavigatorState get _navigator => Navigator.of(this);
  NavigatorHelperAddons get navigator => NavigatorHelperAddons(_navigator);
  // Navigate to a named Animated route
  void push(Widget page) => navigator.pushWithAnimation(page);
  void pushName(String name) => navigator.pushNamedWithAnimation(name);
  void pushReplaced(Widget page) =>
      navigator.pushReplacementWithAnimation(page);

  /// Pops the current route if possible.
  void pop() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  /// Pops all routes until the first.
  void popToRoot() => Navigator.of(this).popUntil((route) => route.isFirst);

  /// Replaces the current route with a named one.
  void pushReplacementNamed(String routeName, {Object? arguments}) {
    Navigator.of(this).pushReplacementNamed(routeName, arguments: arguments);
  }
}

//Go method on widget
/// Extension on Widget to simplify launching from context with animation.
extension WidgetNavigationExtension on Widget {
  /// Launches the widget by pushing it onto the navigation stack with animation.
  /// Checks if the given context is still mounted before navigation.
  bool canLaunch(BuildContext context) => context.mounted;
  void launch(BuildContext context) {
    if (!canLaunch(context)) {
      throw Exception('Context is not mounted or invalid for navigation.');
    }
    context.navigator.pushWithAnimation(this);
  }
}

extension NavigatorExtensions on BuildContext {
  /// Pushes a new route and removes all previous routes until the [predicate] is true.
  ///
  /// Example:
  /// `context.goAndRemoveUntil(PageA(), ModalRoute.withName('/home'))`
  void goAndRemoveUntil(Widget page, [RoutePredicate? predicate]) {
    Navigator.of(this).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => page),
      predicate ?? (route) => false, // default: remove everything
    );
  }

  /// Pushes a named route and removes all previous routes until the [predicate] is true.
  ///
  /// Example:
  /// `context.goNamedAndRemoveUntil('/pageA', ModalRoute.withName('/home'))`
  void goNamedAndRemoveUntil(String routeName, [RoutePredicate? predicate]) {
    Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate ?? (route) => false);
  }
}
