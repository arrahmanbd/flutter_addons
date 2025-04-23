part of 'package:flutter_addons/flutter_addons.dart';

// Navigator addons on Context

extension NavigationExtension on BuildContext {
  NavigatorState get _navigator => Navigator.of(this);
  NavigatorHelperAddons get navigator => NavigatorHelperAddons(_navigator);
  // Navigate to a named Animated route
  void to(Widget page) => navigator.pushWithAnimation(page);
  void toNamed(String name) => navigator.pushNamedWithAnimation(name);
  void back() => navigator.pop();
  void toReplace(Widget page) => navigator.pushReplacementWithAnimation(page);
}

//Go method on widget
extension LaunchWidget on Widget {
  void go(BuildContext context) {
    context.navigator.pushWithAnimation(this);
  }
}
