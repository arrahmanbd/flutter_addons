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

  const UiButton._internal({
    super.key,
    this.icon,
    this.label,
    required this.onPressed,
    required this.style,
    required _UiButtonType type,
  }) : _type = type,
       assert(
         icon != null || label != null,
         'Either icon or label must be provided',
       );

  // Primary (filled) button
  factory UiButton({
    Key? key,
    String? label,
    Widget? icon,
    required VoidCallback? onPressed,
    Color? backgroundColor,
    Color? foregroundColor,
    double borderRadius = 8,
    double elevation = 2,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return UiButton._internal(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
      type: _UiButtonType.elevated,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? primary,
        foregroundColor: foregroundColor ?? white,
        elevation: elevation,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle:
            textStyle ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  // Outlined button
  factory UiButton.outlined({
    Key? key,
    String? label,
    Widget? icon,
    required VoidCallback? onPressed,
    Color? borderColor,
    Color? foregroundColor,
    double borderRadius = 8,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return UiButton._internal(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
      type: _UiButtonType.outlined,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor ?? primary),
        foregroundColor: foregroundColor ?? borderColor ?? primary,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        textStyle:
            textStyle ??
            const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  // Text-only button
  factory UiButton.text({
    Key? key,
    String? label,
    Widget? icon,
    required VoidCallback? onPressed,
    Color? foregroundColor,
    EdgeInsetsGeometry? padding,
    TextStyle? textStyle,
  }) {
    return UiButton._internal(
      key: key,
      label: label,
      icon: icon,
      onPressed: onPressed,
      type: _UiButtonType.text,
      style: TextButton.styleFrom(
        backgroundColor: Colors.transparent,
        foregroundColor: foregroundColor ?? Kolors.blue200,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle:
            textStyle ??
            const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  // Icon-only button
  factory UiButton.icon({
    Key? key,
    required Widget icon,
    required VoidCallback? onPressed,
    Color? foregroundColor,
    double splashRadius = 24,
  }) {
    return UiButton._internal(
      key: key,
      icon: icon,
      onPressed: onPressed,
      type: _UiButtonType.icon,
      style: IconButton.styleFrom(
        foregroundColor: foregroundColor ?? primary,
        // splashRadius not used directly in styleFrom
      ),
    );
  }

  // Circle button
  factory UiButton.circle({
    Key? key,
    Widget? icon,
    String? label,
    required VoidCallback? onPressed,
    double size = 56,
    Color? color,
    Color? foregroundColor,
  }) {
    return UiButton._internal(
      key: key,
      icon: icon,
      label: label,
      onPressed: onPressed,
      type: _UiButtonType.circle,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        minimumSize: Size(size, size),
        backgroundColor: color ?? primary,
        foregroundColor: foregroundColor ?? white,
        textStyle: const TextStyle(fontWeight: FontWeight.bold),
        padding: EdgeInsets.zero,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Widget child =
        icon != null && label != null
            ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [icon!, const SizedBox(width: 8), Text(label!)],
            )
            : (icon ?? Text(label!));

    switch (_type) {
      case _UiButtonType.text:
        return TextButton(onPressed: onPressed, style: style, child: child);
      case _UiButtonType.outlined:
        return OutlinedButton(onPressed: onPressed, style: style, child: child);
      case _UiButtonType.icon:
        return IconButton(onPressed: onPressed, style: style, icon: icon!);
      case _UiButtonType.circle:
        return ElevatedButton(onPressed: onPressed, style: style, child: child);
      case _UiButtonType.elevated:
        return ElevatedButton(onPressed: onPressed, style: style, child: child);
    }
  }
}

// class UiButton extends StatelessWidget {
//   final Widget? icon;
//   final String? label;
//   final VoidCallback? onPressed;
//   final ButtonStyle style;
//   final bool isIconOnly;

//   const UiButton._internal({
//     super.key,
//     this.icon,
//     this.label,
//     required this.onPressed,
//     required this.style,
//     this.isIconOnly = false,
//   }) : assert(icon != null || label != null, 'Either icon or label must be provided');

//   // Primary (filled) button
//   factory UiButton({
//     Key? key,
//     String? label,
//     Widget? icon,
//     required VoidCallback? onPressed,
//     Color? backgroundColor,
//     Color? foregroundColor,
//     double borderRadius = 8,
//     double elevation = 2,
//     EdgeInsetsGeometry? padding,
//     TextStyle? textStyle,
//   }) {
//     return UiButton._internal(
//       key: key,
//       label: label,
//       icon: icon,
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: backgroundColor ?? Colors.blue,
//         foregroundColor: foregroundColor ?? Colors.white,
//         elevation: elevation,
//         padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
//         textStyle: textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//     );
//   }

//   // Outlined button
//   factory UiButton.outlined({
//     Key? key,
//     String? label,
//     Widget? icon,
//     required VoidCallback? onPressed,
//     Color? borderColor,
//     Color? foregroundColor,
//     double borderRadius = 12,
//     EdgeInsetsGeometry? padding,
//     TextStyle? textStyle,
//   }) {
//     return UiButton._internal(
//       key: key,
//       label: label,
//       icon: icon,
//       onPressed: onPressed,
//       style: OutlinedButton.styleFrom(
//         side: BorderSide(color: borderColor ?? Colors.blue),
//         foregroundColor: foregroundColor ?? borderColor ?? Colors.blue,
//         padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
//         textStyle: textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//       ),
//     );
//   }

//   // Text-only button
//   factory UiButton.text({
//     Key? key,
//     String? label,
//     Widget? icon,
//     required VoidCallback? onPressed,
//     Color? foregroundColor,
//     EdgeInsetsGeometry? padding,
//     TextStyle? textStyle,
//   }) {
//     return UiButton._internal(
//       key: key,
//       label: label,
//       icon: icon,
//       onPressed: onPressed,
//       style: TextButton.styleFrom(
//         backgroundColor: Colors.transparent,
//         // No background color for text button
//         foregroundColor: foregroundColor ?? Colors.blue,
//         padding: padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         textStyle: textStyle ?? const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
//       ),
//     );
//   }

//   // Icon-only button
//   factory UiButton.icon({
//     Key? key,
//     required Widget icon,
//     required VoidCallback? onPressed,
//     Color? foregroundColor,
//     double size = 24,
//     double splashRadius = 24,
//   }) {
//     return UiButton._internal(
//       key: key,
//       icon: icon,
//       onPressed: onPressed,
//       style: IconButton.styleFrom(
//         foregroundColor: foregroundColor,
//        // splashRadius: splashRadius,
//       ),
//       isIconOnly: true,
//     );
//   }

//   // Circle button
//   factory UiButton.circle({
//     Key? key,
//     Widget? icon,
//     String? label,
//     required VoidCallback? onPressed,
//     double size = 56,
//     Color? color,
//     Color? foregroundColor,
//   }) {
//     return UiButton._internal(
//       key: key,
//       icon: icon,
//       label: label,
//       onPressed: onPressed,
//       style: ElevatedButton.styleFrom(
//         shape: const CircleBorder(),
//         minimumSize: Size(size, size),
//         backgroundColor: color ?? Colors.blue,
//         foregroundColor: foregroundColor ?? Colors.white,
//         textStyle: const TextStyle(fontWeight: FontWeight.bold),
//         padding: EdgeInsets.zero,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (isIconOnly && icon != null && label == null) {
//       return IconButton(
//         onPressed: onPressed,
//         icon: icon!,
//         style: style,
//       );
//     }

//     final child = icon != null && label != null
//         ? Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               icon!,
//               const SizedBox(width: 8),
//               Text(label!),
//             ],
//           )
//         : (icon ?? Text(label!));

//     // CircleButton detection
//     if (style.shape is CircleBorder) {
//       return ElevatedButton(
//         onPressed: onPressed,
//         style: style,
//         child: icon ?? (label != null ? Text(label!) : const SizedBox()),
//       );
//     }

//     // Determine correct base button type
//     final ButtonStyle resolvedStyle = style;

//     if (resolvedStyle == TextButton.styleFrom()) {
//       return TextButton(onPressed: onPressed, style: resolvedStyle, child: child);
//     } else if (resolvedStyle == OutlinedButton.styleFrom()) {
//       return OutlinedButton(onPressed: onPressed, style: resolvedStyle, child: child);
//     }

//     return ElevatedButton(
//       onPressed: onPressed,
//       style: resolvedStyle,
//       child: child,
//     );
//   }
// }
