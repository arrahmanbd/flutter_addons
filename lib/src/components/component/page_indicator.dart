part of 'package:flutter_addons/flutter_addons.dart';

enum IndicatorShape { circle, roundedRect }

class PageIndicator extends StatelessWidget {
  final int currentIndex;
  final int length;
  final Duration animationDuration;
  final double activeWidth;
  final double inactiveWidth;
  final double height;
  final double spacing;
  final Color activeColor;
  final Color inactiveColor;
  final IndicatorShape shape;
  final MainAxisAlignment alignment;
  final void Function(int index)? onTap;

  const PageIndicator({
    super.key,
    required this.currentIndex,
    required this.length,
    this.animationDuration = const Duration(milliseconds: 300),
    this.activeWidth = 36,
    this.inactiveWidth = 8,
    this.height = 8,
    this.spacing = 5,
    required this.activeColor,
    required this.inactiveColor,
    this.shape = IndicatorShape.roundedRect,
    this.alignment = MainAxisAlignment.start,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: List.generate(length, (index) {
        final isActive = index == currentIndex;

        return GestureDetector(
          onTap: () => onTap?.call(index),
          child: AnimatedContainer(
            duration: animationDuration,
            margin: EdgeInsets.symmetric(horizontal: spacing.w),
            width: (isActive ? activeWidth : inactiveWidth).w,
            height: height.h,
            decoration: BoxDecoration(
              color: isActive ? activeColor : inactiveColor,
              shape:
                  shape == IndicatorShape.circle
                      ? BoxShape.circle
                      : BoxShape.rectangle,
              borderRadius:
                  shape == IndicatorShape.roundedRect
                      ? BorderRadius.circular(10.r)
                      : null,
            ),
          ),
        );
      }),
    );
  }
}
