part of 'package:flutter_addons/flutter_addons.dart';

// Navigator addons on Context
/// Navigator helper extensions for adding animations and context-based navigation

extension NavigationExtension on BuildContext {
  NavigatorState get _navigator => Navigator.of(this);
  NavigatorHelperAddons get navigator => NavigatorHelperAddons(_navigator);
  // Navigate to a named Animated route
  void go(Widget page) => navigator.pushWithAnimation(page);
  void goName(String name) => navigator.pushNamedWithAnimation(name);
  void goReplace(Widget page) => navigator.pushReplacementWithAnimation(page);

  /// Pops the current route if possible.
  void pop() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  /// Pops all routes until the first.
  void popToRoot() => Navigator.of(this).popUntil((route) => route.isFirst);
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
