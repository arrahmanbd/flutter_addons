part of 'package:flutter_addons/flutter_addons.dart';

class UiIconButton extends StatelessWidget {
  final Color backgroundColor;
  final Icon icon;
  final VoidCallback onPressed;
  final double size;
  final double iconSize;
  final Color? iconColor;
  final double elevation;
  final Color? borderColor; // new
  final double borderWidth; // new

  const UiIconButton({
    super.key,
    required this.backgroundColor,
    required this.icon,
    required this.onPressed,
    this.size = 48,
    this.iconSize = 24,
    this.iconColor,
    this.elevation = 2,
    this.borderColor,
    this.borderWidth = 2,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: CircleBorder(
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: borderWidth,
        ),
      ),
      elevation: elevation,
      child: InkWell(
        customBorder: CircleBorder(),
        onTap: onPressed,
        child: SizedBox(
          width: size,
          height: size,
          child: Center(
            child: Icon(
              icon.icon,
              size: iconSize,
              color: iconColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
