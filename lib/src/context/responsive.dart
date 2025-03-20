part of 'package:flutter_addons/flutter_addons.dart';

extension ResponsiveExtension on BuildContext {
  /// Extra small screens (phones, less than 576px)
  bool get isXs => MediaQuery.of(this).size.width < 576;

  /// Small screens (phones, 576px and up)
  bool get isSm =>
      MediaQuery.of(this).size.width >= 576 &&
      MediaQuery.of(this).size.width < 768;

  /// Medium screens (tablets, 768px and up)
  bool get isMd =>
      MediaQuery.of(this).size.width >= 768 &&
      MediaQuery.of(this).size.width < 992;

  /// Large screens (desktops, 992px and up)
  bool get isLg =>
      MediaQuery.of(this).size.width >= 992 &&
      MediaQuery.of(this).size.width < 1200;

  /// Extra large screens (large desktops, 1200px and up)
  bool get isXl => MediaQuery.of(this).size.width >= 1200;
}
