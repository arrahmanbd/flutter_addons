part of 'package:flutter_addons/flutter_addons.dart';

class SmartUnitUtils {
  static final SmartUnitUtils instance = SmartUnitUtils._();

  late double _width;
  late double _height;
  late double _shortest;
  late double _baseWidth;
  late double baseHeight;

  bool _initialized = false;

  SmartUnitUtils._();

  void init({
    required BuildContext context,
    double designWidth = 375,
    double designHeight = 812,
  }) {
    final mq = MediaQuery.of(context);
    _width = mq.size.width;
    _height = mq.size.height;
    _shortest = _width < _height ? _width : _height;
    _baseWidth = designWidth;
    baseHeight = designHeight;
    _initialized = true;
  }

  double scale(num value) {
    assert(_initialized, 'SmartUnitUtils not initialized');
    return value * _shortest / _baseWidth;
  }

  double sp(num fontSize, {double textScaleFactor = 1.0}) {
    return scale(fontSize) * textScaleFactor;
  }

  double scaleX(num value) => value * _width / _baseWidth;
  double scaleY(num value) => value * _height / baseHeight;
}
