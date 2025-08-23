part of 'package:flutter_addons/flutter_addons.dart';


enum _UiButtonType { elevated, outlined, text, icon, circle }

class UiButton extends StatelessWidget {
  static const Color primary = Color(0xFF3B82F6);
  static const Color white = Color(0xFFFFFFFF);

  final Widget? icon;
  final String? label;
  final VoidCallback? onPressed;
  final ButtonStyle style;
  final _UiButtonType _type;

  /// Extra properties
  final bool expand;
  final String? tooltip;
  final Color? borderColor;
  final Gradient? gradient;

  const UiButton._internal({
    super.key,
    this.icon,
    this.label,
    required this.onPressed,
    required this.style,
    required _UiButtonType type,
    this.expand = false,
    this.tooltip,
    this.borderColor,
    this.gradient,
  })  : _type = type,
        assert(icon != null || label != null,
            'Either icon or label must be provided');

  // 🔹 Primary (filled) button
  factory UiButton({
    Key? key,
    String? label,
    Widget? icon,
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    double borderRadius = 6,
    double elevation = 2,
    EdgeInsetsGeometry? padding,
    TextStyle? labelStyle,
    bool expand = false,
    String? tooltip,
    Color? borderColor,
    Gradient? gradient,
  }) {
    return UiButton._internal(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
      expand: expand,
      tooltip: tooltip,
      type: _UiButtonType.elevated,
      borderColor: borderColor,
      gradient: gradient,
      style: ElevatedButton.styleFrom(
        backgroundColor: gradient == null
            ? (backgroundColor ?? primary)
            : Colors.transparent,
        foregroundColor: foregroundColor ?? white,
        elevation: elevation,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor, width: 1.2)
              : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle:
            labelStyle ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  // 🔹 Outlined button
  factory UiButton.outlined({
    Key? key,
    String? label,
    Widget? icon,
    required VoidCallback? onPressed,
    Color? borderColor,
    Color? foregroundColor,
    double borderRadius = 6,
    EdgeInsetsGeometry? padding,
    TextStyle? labelStyle,
    bool expand = false,
    String? tooltip,
  }) {
    return UiButton._internal(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
      expand: expand,
      tooltip: tooltip,
      type: _UiButtonType.outlined,
      borderColor: borderColor,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor ?? primary, width: 1.2),
        foregroundColor: foregroundColor ?? borderColor ?? primary,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle:
            labelStyle ??
            const TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    );
  }

  // 🔹 Text button
  factory UiButton.text({
    Key? key,
    String? label,
    Widget? icon,
    required VoidCallback? onPressed,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    TextStyle? labelStyle,
    bool expand = false,
    String? tooltip,
  }) {
    return UiButton._internal(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
      expand: expand,
      tooltip: tooltip,
      type: _UiButtonType.text,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: foregroundColor ?? primary,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle:
            labelStyle ??
            const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  // 🔹 Icon-only button
  factory UiButton.icon({
    Key? key,
    required Widget icon,
    required VoidCallback? onPressed,
    Color? foregroundColor,
    double splashRadius = 24,
    String? tooltip,
  }) {
    return UiButton._internal(
      key: key,
      icon: icon,
      onPressed: onPressed,
      tooltip: tooltip,
      type: _UiButtonType.icon,
      style: IconButton.styleFrom(foregroundColor: foregroundColor ?? primary),
    );
  }

  // 🔹 Circle button (supports gradient too)
  factory UiButton.circle({
    Key? key,
    Widget? icon,
    String? label,
    required VoidCallback? onPressed,
    double size = 48,
    Color? color,
    Color? foregroundColor,
    String? tooltip,
    Color? borderColor,
    Gradient? gradient,
  }) {
    return UiButton._internal(
      key: key,
      icon: icon,
      label: label,
      onPressed: onPressed,
      tooltip: tooltip,
      type: _UiButtonType.circle,
      borderColor: borderColor,
      gradient: gradient,
      style: ElevatedButton.styleFrom(
        shape: CircleBorder(
          side: borderColor != null
              ? BorderSide(color: borderColor, width: 1.2)
              : BorderSide.none,
        ),
        minimumSize: Size(size, size),
        backgroundColor: gradient == null ? (color ?? primary) : Colors.transparent,
        foregroundColor: foregroundColor ?? white,
        padding: EdgeInsets.zero,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child =
        icon != null && label != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  icon!,
                  const SizedBox(width: 6),
                  Flexible(child: Text(label!)),
                ],
              )
            : (icon ?? Text(label!));

    Widget button;
    switch (_type) {
      case _UiButtonType.text:
        button = TextButton(onPressed: onPressed, style: style, child: child);
        break;
      case _UiButtonType.outlined:
        button =
            OutlinedButton(onPressed: onPressed, style: style, child: child);
        break;
      case _UiButtonType.icon:
        button = IconButton(onPressed: onPressed, style: style, icon: icon!);
        break;
      case _UiButtonType.circle:
      case _UiButtonType.elevated:
        button =
            ElevatedButton(onPressed: onPressed, style: style, child: child);
        break;
    }

    // 🔹 Gradient wrapper
    if (gradient != null &&
        (_type == _UiButtonType.elevated || _type == _UiButtonType.circle)) {
      button = Ink(
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: _type == _UiButtonType.circle
              ? null
              : (style.shape is RoundedRectangleBorder
                  ? (style.shape as RoundedRectangleBorder).borderRadius
                  : BorderRadius.circular(6)),
          shape: _type == _UiButtonType.circle ? BoxShape.circle : BoxShape.rectangle,
        ),
        child: button,
      );
    }

    final expandedButton =
        expand ? SizedBox(width: double.infinity, child: button) : button;

    return tooltip != null
        ? Tooltip(message: tooltip!, child: expandedButton)
        : expandedButton;
  }
}
