// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

/// A reusable flat button widget with various styles and configurations.
/// This widget supports filled, outlined, and text styles,
/// with options for loading state, icon, and custom colors.

class UiFlatButton extends StatelessWidget {
  final String label;
  final Widget? icon;
  final VoidCallback? onPressed;
  final bool isLoading;
  final bool expand;
  final EdgeInsets? padding;
  final double borderRadius;
  final double elevation;
  final Color backgroundColor;
  final Color textColor;
  final Color borderColor;
  final TextStyle? labelStyle;

  const UiFlatButton({
    super.key,
    required this.label,
    this.icon,
    required this.onPressed,
    this.isLoading = false,
    this.expand = true,
    this.padding,
    this.borderRadius = 8,
    this.elevation = 3,
    this.backgroundColor = const Color(0xFF3B82F6),
    this.textColor = Colors.white,
    this.labelStyle,
    Color? borderColor,
  }) : borderColor = borderColor ?? backgroundColor;

  /// Factory for `outlined` style
  factory UiFlatButton.outlined({
    required String label,
    Widget? icon,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool expand = true,
    EdgeInsets? padding,
    double borderRadius = 8,
    double elevation = 0,
    Color borderColor = const Color(0xFFCBD5E1),
    Color textColor = Colors.black87,
    TextStyle? labelStyle,
  }) {
    return UiFlatButton(
      label: label,
      icon: icon,
      onPressed: onPressed,
      isLoading: isLoading,
      expand: expand,
      padding: padding,
      borderRadius: borderRadius,
      elevation: elevation,
      backgroundColor: Colors.transparent,
      textColor: textColor,
      borderColor: borderColor,
      labelStyle: labelStyle,
    );
  }

  /// Factory for `text` style
  factory UiFlatButton.text({
    required String label,
    Widget? icon,
    required VoidCallback? onPressed,
    bool isLoading = false,
    bool expand = false,
    EdgeInsets? padding,
    double borderRadius = 8,
    double elevation = 0,
    Color textColor = Colors.blue,
    TextStyle? labelStyle,
  }) {
    return UiFlatButton(
      label: label,
      icon: icon,
      onPressed: onPressed,
      isLoading: isLoading,
      expand: expand,
      padding: padding,
      borderRadius: borderRadius,
      elevation: elevation,
      backgroundColor: Colors.transparent,
      textColor: textColor,
      borderColor: Colors.transparent,
      labelStyle: labelStyle,
    );
  }

  /// Default label text style
  TextStyle get defaultLabelStyle =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 16, color: textColor);

  @override
  Widget build(BuildContext context) {
    final disabled = isLoading || onPressed == null;
    final textStyle = labelStyle ?? defaultLabelStyle;

    return ElevatedButton(
      onPressed: disabled ? null : onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        foregroundColor: WidgetStateProperty.all(textColor),
        elevation: WidgetStateProperty.all(elevation),
        shadowColor: WidgetStateProperty.all(Colors.black12),
        padding: WidgetStateProperty.all(
          padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
            side: BorderSide(color: borderColor, width: 1),
          ),
        ),
      ),
      child:
          isLoading
              ? Row(
                mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text("Processing...", style: textStyle),
                ],
              )
              : Row(
                mainAxisSize: expand ? MainAxisSize.max : MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (icon != null) ...[icon!, const SizedBox(width: 8)],
                  Text(label, style: textStyle),
                ],
              ),
    );
  }
}
