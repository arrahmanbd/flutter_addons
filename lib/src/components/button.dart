part of 'package:flutter_addons/flutter_addons.dart';

enum ButtonVariant { primary, secondary, danger, outline }

enum ButtonSize { sm, md, lg }

class FlatButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final ButtonVariant variant;
  final ButtonSize size;
  final bool isRounded;
  final bool isDisabled;
  final bool isLoading;
  final bool iconOnly;
  final Widget? icon;
  final EdgeInsetsGeometry? customPadding;
  final Color? customBorderColor;
  final double? elevation;
  final Color? background;

  const FlatButton({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.variant = ButtonVariant.primary,
    this.size = ButtonSize.md,
    this.isRounded = true,
    this.isDisabled = false,
    this.isLoading = false,
    this.iconOnly = false,
    this.customPadding,
    this.customBorderColor,
    this.elevation,
    this.background,
  });

  static const _paddingMap = {
    ButtonSize.sm: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    ButtonSize.md: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ButtonSize.lg: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
  };

  static const _fontSizeMap = {
    ButtonSize.sm: 12.0,
    ButtonSize.md: 14.0,
    ButtonSize.lg: 16.0,
  };

  @override
  Widget build(BuildContext context) {
    final disabled = isDisabled || onPressed == null;

    Color backgroundColor;
    Color foregroundColor;
    BorderSide border;

    switch (variant) {
      case ButtonVariant.primary:
        backgroundColor =
            background ??
            (disabled ? Colors.blue.shade200 : Colors.blue.shade600);
        foregroundColor = Colors.white;
        border = BorderSide(color: customBorderColor ?? Colors.grey.shade400);

        break;
      case ButtonVariant.secondary:
        backgroundColor =
            disabled ? Colors.grey.shade300 : Colors.grey.shade200;
        foregroundColor = Colors.black87;
        border = BorderSide.none;
        break;
      case ButtonVariant.danger:
        backgroundColor = disabled ? Colors.red.shade200 : Colors.red.shade600;
        foregroundColor = Colors.white;
        border = BorderSide.none;
        break;
      case ButtonVariant.outline:
        backgroundColor = Colors.transparent;
        foregroundColor = Colors.black87;
        border = BorderSide(color: customBorderColor ?? Colors.grey.shade400);
        break;
    }

    final padding =
        customPadding ??
        (iconOnly ? const EdgeInsets.all(12) : _paddingMap[size]!);
    final fontSize = _fontSizeMap[size]!;
    final borderRadius = BorderRadius.circular(isRounded ? 20 : 6);

    return Material(
      elevation: elevation ?? 0,
      color: backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: borderRadius, side: border),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: disabled ? null : onPressed,
        child: Padding(
          padding: padding,
          child:
              iconOnly
                  ? (isLoading
                      ? SizedBox(
                        width: fontSize,
                        height: fontSize,
                        child: _buildLoader(foregroundColor),
                      )
                      : IconTheme(
                        data: IconThemeData(color: foregroundColor),
                        child: icon!,
                      ))
                  : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isLoading)
                        SizedBox(
                          width: fontSize,
                          height: fontSize,
                          child: _buildLoader(foregroundColor),
                        )
                      else if (icon != null) ...[
                        IconTheme(
                          data: IconThemeData(color: foregroundColor),
                          child: icon!,
                        ),
                        const SizedBox(width: 8),
                      ],
                      if (label != null)
                        Text(
                          label!,
                          style: TextStyle(
                            color: foregroundColor,
                            fontSize: fontSize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                    ],
                  ),
        ),
      ),
    );
  }

  Widget _buildLoader(Color color) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(color),
      strokeWidth: 2,
    );
  }
}
