part of 'package:flutter_addons/flutter_addons.dart';

class UiContainer extends StatelessWidget {
  // Core configurable props
  final Widget? child;
  final double? width, height;
  final AlignmentGeometry? alignment;

  // Styling
  final Color? color;
  final double radius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final BoxShape shape;
  final BoxBorder? border;

  // Interactivity
  final GestureTapCallback? onTap;
  final Color? splashColor;
  final Clip clip;

  const UiContainer({
    super.key,
    this.child,
    this.width,
    this.height,
    this.alignment,
    this.color,
    this.radius = 12,
    this.padding = const EdgeInsets.all(16),
    this.margin = EdgeInsets.zero,
    this.shape = BoxShape.rectangle,
    this.border,
    this.onTap,
    this.splashColor,
    this.clip = Clip.none,
  });

  /// Transparent box
  factory UiContainer.transparent({
    Key? key,
    Widget? child,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) => UiContainer(
    key: key,
    color: Colors.transparent,
    padding: padding,
    margin: margin,
    child: child,
  );

  /// Bordered box
  factory UiContainer.bordered({
    Key? key,
    Widget? child,
    Color? color,
    Color borderColor = Colors.grey,
    double radius = 12,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    EdgeInsetsGeometry margin = EdgeInsets.zero,
  }) => UiContainer(
    key: key,
    color: color,
    radius: radius,
    padding: padding,
    margin: margin,
    border: Border.all(color: borderColor),
    child: child,
  );

  /// Circular avatar-style box
  factory UiContainer.rounded({
    Key? key,
    Widget? child,
    Color? color,
    double size = 48,
    EdgeInsetsGeometry padding = const EdgeInsets.all(8),
    GestureTapCallback? onTap,
  }) => UiContainer(
    key: key,
    width: size,
    height: size,
    shape: BoxShape.circle,
    color: color,
    padding: padding,
    onTap: onTap,
    clip: Clip.antiAlias,
    child: child,
  );

  /// Fluent helper to derive variants
  UiContainer copyWith({
    Widget? child,
    double? width,
    double? height,
    AlignmentGeometry? alignment,
    Color? color,
    double? radius,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    BoxShape? shape,
    BoxBorder? border,
    GestureTapCallback? onTap,
    Color? splashColor,
    Clip? clip,
  }) => UiContainer(
    width: width ?? this.width,
    height: height ?? this.height,
    alignment: alignment ?? this.alignment,
    color: color ?? this.color,
    radius: radius ?? this.radius,
    padding: padding ?? this.padding,
    margin: margin ?? this.margin,
    shape: shape ?? this.shape,
    border: border ?? this.border,
    onTap: onTap ?? this.onTap,
    splashColor: splashColor ?? this.splashColor,
    clip: clip ?? this.clip,
    child: child ?? this.child,
  );

  @override
  Widget build(BuildContext context) {
    final box = Container(
      width: width,
      height: height,
      alignment: alignment,
      padding: padding,
      margin: margin,
      clipBehavior: clip,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        shape: shape,
        borderRadius:
            shape == BoxShape.rectangle ? BorderRadius.circular(radius) : null,
        border: border,
      ),
      child: child,
    );

    if (onTap == null) return box;

    return Material(
      color: Colors.transparent,
      shape:
          shape == BoxShape.circle
              ? const CircleBorder()
              : RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius),
              ),
      clipBehavior: clip,
      child: InkWell(
        onTap: onTap,
        splashColor: splashColor ?? Theme.of(context).splashColor,
        child: box,
      ),
    );
  }
}
