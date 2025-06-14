part of 'package:flutter_addons/flutter_addons.dart';

class AvatarCircle extends StatelessWidget {
  final ImageProvider image;
  final double radius;
  final Color borderColor;
  final VoidCallback? onTap;
  final bool showBadge;
  final Widget? customBadge;
  final Size? size;

  /// Badge alignment from the center
  final Alignment badgeAlignment;

  /// Badge offset for fine-tuning
  final Offset badgeOffset;

  const AvatarCircle({
    super.key,
    required this.image,
    required this.radius,
    this.borderColor = Colors.transparent,
    this.onTap,
    this.showBadge = true,
    this.customBadge,
    this.size,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset = const Offset(0, 0),
  });

  @override
  Widget build(BuildContext context) {
    final badge =
        customBadge ??
        Container(
          width: 14,
          height: 14,
          decoration: BoxDecoration(
            color: Colors.green,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
        );

    return SizedBox(
      width: size?.width ?? radius,
      height: size?.height ?? radius,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              splashColor: context.primaryColor.withValues(alpha: 0.2),
              child: Container(
                width: radius * 2,
                height: radius * 2,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 2),
                  image: DecorationImage(image: image, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          if (showBadge)
            Align(
              alignment: badgeAlignment,
              child: Transform.translate(offset: badgeOffset, child: badge),
            ),
        ],
      ),
    );
  }
}
