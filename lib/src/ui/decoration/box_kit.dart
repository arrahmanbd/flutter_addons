part of 'package:flutter_addons/flutter_addons.dart';

// Extensions on Container for chaining styles
extension ContainerDSL on Container {
  Container paddingAll(double value) =>
      copyWith(padding: EdgeInsets.all(value));

  Container paddingSymmetric({double horizontal = 0, double vertical = 0}) =>
      copyWith(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
      );

  Container marginAll(double value) => copyWith(margin: EdgeInsets.all(value));

  Container marginSymmetric({double horizontal = 0, double vertical = 0}) =>
      copyWith(
        margin: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
      );

  Container bgColor(Color color) => copyWith(color: color);

  Container rounded([double radius = 12]) => copyWith(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius)),
  );

  Container border({
    Color color = Colors.black,
    double width = 1,
    double radius = 8,
  }) => copyWith(
    decoration: BoxDecoration(
      border: Border.all(color: color, width: width),
      borderRadius: BorderRadius.circular(radius),
    ),
  );

  Container shadow({
    Color color = Colors.black26,
    double blurRadius = 10,
    Offset offset = const Offset(0, 4),
  }) => copyWith(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(color: color, blurRadius: blurRadius, offset: offset),
      ],
    ),
  );

  Container circle({Color? color, double? size}) => Container(
    width: size,
    height: size,
    decoration: BoxDecoration(
      color: color ?? this.color,
      shape: BoxShape.circle,
    ),
    child: child,
  );

  // Reusable container presets
  Container asCard() => bgColor(Colors.white).rounded(16).shadow();

  Container pill() => bgColor(
    Colors.grey.shade200,
  ).rounded(50).paddingSymmetric(horizontal: 20, vertical: 12);

  Container glass({Color? tint}) => copyWith(
    decoration: BoxDecoration(
      color: (tint ?? Colors.white.withValues(alpha: 0.1)),
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
    ),
  );

  // Internal helper
  Container copyWith({
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    Color? color,
    BoxDecoration? decoration,
  }) {
    return Container(
      padding: padding ?? this.padding,
      margin: margin ?? this.margin,
      decoration: decoration ?? this.decoration,
      color: decoration == null ? color ?? this.color : null,
      child: child,
    );
  }
}

// Widget to Container starter
extension WidgetToBox on Widget {
  Container get box => Container(child: this);
}

// 🧪 Usage:
// Text("Hello").box.bgColor(Colors.white).rounded(10).paddingAll(16);
// Container().asCard().paddingAll(16);

/// BoxDecoration extensions for DSL-style configuration

extension BoxDecorationDSL on BoxDecoration {
  /// Set background color
  BoxDecoration bg(Color color) => copyWith(color: color);

  /// Add rounded corners (all corners)
  BoxDecoration rounded([double radius = 12]) =>
      copyWith(borderRadius: BorderRadius.circular(radius));

  /// Apply circle shape
  BoxDecoration circular() => copyWith(shape: BoxShape.circle);

  /// Apply rectangle shape (default)
  BoxDecoration rectangular() => copyWith(shape: BoxShape.rectangle);

  /// Apply rounded corners only on specific corners
  BoxDecoration roundedOnly({
    double topLeft = 0,
    double topRight = 0,
    double bottomLeft = 0,
    double bottomRight = 0,
  }) => copyWith(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(topLeft),
      topRight: Radius.circular(topRight),
      bottomLeft: Radius.circular(bottomLeft),
      bottomRight: Radius.circular(bottomRight),
    ),
  );

  /// Apply rounded corners on specific sides (left/right/top/bottom)
  BoxDecoration roundedSides({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) => copyWith(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(top),
      topRight: Radius.circular(right),
      bottomLeft: Radius.circular(bottom),
      bottomRight: Radius.circular(left),
    ),
  );

  /// Add box shadow
  BoxDecoration shadow({
    Color color = Colors.black26,
    double blurRadius = 10,
    Offset offset = const Offset(0, 4),
    double spread = 0,
  }) => copyWith(
    boxShadow: [
      ...(boxShadow ?? []),
      BoxShadow(
        color: color,
        blurRadius: blurRadius,
        offset: offset,
        spreadRadius: spread,
      ),
    ],
  );

  /// Add border
  BoxDecoration withBorder(Color color, double width) =>
      copyWith(border: Border.all(color: color, width: width));

  /// Add gradient
  BoxDecoration withGradient(Gradient gradient) => copyWith(gradient: gradient);

  /// Internal copyWith for BoxDecoration
  BoxDecoration copyWith({
    Color? color,
    Border? border,
    BorderRadiusGeometry? borderRadius,
    List<BoxShadow>? boxShadow,
    Gradient? gradient,
    BoxShape? shape,
  }) {
    return BoxDecoration(
      color: color ?? this.color,
      border: border ?? this.border,
      borderRadius:
          shape == BoxShape.circle ? null : borderRadius ?? this.borderRadius,
      boxShadow: boxShadow ?? this.boxShadow,
      gradient: gradient ?? this.gradient,
      shape: shape ?? this.shape,
    );
  }
}

///
///Container(
//   decoration: BoxDecoration()
//     .roundedOnly(topLeft: 20, topRight: 20)
//     .bg(Colors.blue),
//   child: Text('Custom Corners'),
// )
