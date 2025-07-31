part of 'package:flutter_addons/flutter_addons.dart';

class UiContainer extends StatelessWidget {
  final Widget? child;
  final BorderRadius? borderRadius;
  final double? borderRadiusAll, paddingAll, marginAll;
  final EdgeInsetsGeometry? padding, margin;
  final Color? color;
  final Color? borderColor;
  final bool bordered;
  final Border? border;
  final Clip? clipBehavior;
  final BoxShape shape;
  final double? width, height;
  final AlignmentGeometry? alignment;
  final GestureTapCallback? onTap;
  final Color? splashColor;
  final bool enableBorderRadius;

  static const double _defaultRadius = 12.0;
  static const double _defaultPadding = 16.0;
  static const double _defaultMargin = 0.0;

  const UiContainer({
    super.key,
    this.child,
    this.borderRadius,
    this.padding,
    this.borderRadiusAll,
    this.paddingAll,
    this.border,
    this.bordered = false,
    this.clipBehavior,
    this.color,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.alignment,
    this.enableBorderRadius = true,
    this.onTap,
    this.marginAll,
    this.margin,
    this.splashColor,
    this.borderColor,
  });

  const UiContainer.transparent({
    super.key,
    this.child,
    this.borderRadius,
    this.padding,
    this.borderRadiusAll,
    this.paddingAll,
    this.border,
    this.bordered = false,
    this.clipBehavior,
    this.color = Colors.transparent,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.alignment,
    this.enableBorderRadius = true,
    this.onTap,
    this.marginAll,
    this.margin,
    this.splashColor,
    this.borderColor,
  });

  const UiContainer.none({
    super.key,
    this.child,
    this.borderRadius,
    this.padding,
    this.borderRadiusAll = 0,
    this.paddingAll = 0,
    this.border,
    this.bordered = false,
    this.clipBehavior,
    this.enableBorderRadius = true,
    this.color,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.alignment,
    this.onTap,
    this.marginAll,
    this.margin,
    this.splashColor,
    this.borderColor,
  });

  const UiContainer.bordered({
    super.key,
    this.child,
    this.borderRadius,
    this.padding,
    this.borderRadiusAll,
    this.paddingAll,
    this.border,
    this.bordered = true,
    this.enableBorderRadius = true,
    this.clipBehavior,
    this.color,
    this.shape = BoxShape.rectangle,
    this.width,
    this.height,
    this.alignment,
    this.onTap,
    this.marginAll,
    this.margin,
    this.splashColor,
    this.borderColor,
  });

  const UiContainer.roundBordered({
    super.key,
    this.child,
    this.borderRadius,
    this.padding,
    this.borderRadiusAll,
    this.enableBorderRadius = true,
    this.paddingAll,
    this.border,
    this.bordered = true,
    this.clipBehavior,
    this.color,
    this.shape = BoxShape.circle,
    this.width,
    this.height,
    this.alignment,
    this.onTap,
    this.marginAll,
    this.margin,
    this.splashColor,
    this.borderColor,
  });

  const UiContainer.rounded({
    super.key,
    this.child,
    this.borderRadius,
    this.padding,
    this.borderRadiusAll,
    this.enableBorderRadius = true,
    this.paddingAll,
    this.border,
    this.bordered = false,
    this.clipBehavior = Clip.antiAliasWithSaveLayer,
    this.color,
    this.shape = BoxShape.circle,
    this.width,
    this.height,
    this.alignment,
    this.onTap,
    this.marginAll,
    this.margin,
    this.splashColor,
    this.borderColor,
  });

  BorderRadius? get _effectiveBorderRadius {
    if (!enableBorderRadius) return null;
    if (shape == BoxShape.circle) return null;
    return borderRadius ??
        BorderRadius.all(
          Radius.circular(borderRadiusAll ?? _defaultRadius),
        );
  }

  EdgeInsetsGeometry get _effectivePadding =>
      padding ?? EdgeInsets.all(paddingAll ?? _defaultPadding);

  EdgeInsetsGeometry get _effectiveMargin =>
      margin ?? EdgeInsets.all(marginAll ?? _defaultMargin);

  @override
  Widget build(BuildContext context) {
    final base = Container(
      width: width,
      height: height,
      alignment: alignment,
      margin: _effectiveMargin,
      padding: _effectivePadding,
      clipBehavior: clipBehavior ?? Clip.none,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).cardColor,
        shape: shape,
        borderRadius: _effectiveBorderRadius,
        border: bordered
            ? border ??
                Border.all(
                  color: borderColor ?? Theme.of(context).dividerColor,
                  width: 1,
                )
            : null,
      ),
      child: child,
    );

    if (onTap != null) {
      return InkWell(
        borderRadius: _effectiveBorderRadius,
        onTap: onTap,
        splashColor: splashColor ?? Colors.transparent,
        highlightColor: splashColor ?? Colors.transparent,
        child: base,
      );
    }

    return base;
  }
}
