part of 'package:flutter_addons/flutter_addons.dart';

abstract class FontSizeResolvers {
  static double width(num fontSize, UIUtils instance) {
    return instance.setWidth(fontSize);
  }

  static double height(num fontSize, UIUtils instance) {
    return instance.setHeight(fontSize);
  }

  static double radius(num fontSize, UIUtils instance) {
    return instance.radius(fontSize);
  }

  static double diameter(num fontSize, UIUtils instance) {
    return instance.diameter(fontSize);
  }

  static double diagonal(num fontSize, UIUtils instance) {
    return instance.diagonal(fontSize);
  }
}