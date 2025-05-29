part of 'package:flutter_addons/flutter_addons.dart';

// Proxy class to provide animation methods on any Widget
extension AnimateExtension on Widget {
  AnimateProxy get animate => AnimateProxy(this);
}
