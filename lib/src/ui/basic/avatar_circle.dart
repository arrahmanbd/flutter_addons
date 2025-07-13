part of 'package:flutter_addons/flutter_addons.dart';

/// A circular avatar widget with optional border, tap handling, and status badge.
///
/// Example usage:
/// ```dart
/// AvatarCircle(
///   image: NetworkImage('https://example.com/avatar.jpg'),
///   radius: 32,
///   borderColor: Colors.blueAccent,
///   onTap: () { print('Avatar tapped'); },
///   showBadge: true,
/// )
/// ```
class AvatarCircle extends StatelessWidget {
  /// The image to display inside the avatar.
  final ImageProvider image;

  /// The radius of the avatar.
  final double radius;

  /// Optional border color around the avatar.
  final Color borderColor;

  /// Callback when the avatar is tapped.
  final VoidCallback? onTap;

  /// Whether to show the status badge.
  final bool showBadge;

  /// Optional custom badge widget.
  final Widget? customBadge;

  /// Optional size override.
  final Size? size;

  /// Alignment for the badge relative to the avatar.
  final Alignment badgeAlignment;

  /// Fine-tuning offset for the badge position.
  final Offset badgeOffset;

  const AvatarCircle({
    super.key,
    required this.image,
    required this.radius,
    this.borderColor = Colors.transparent,
    this.onTap,
    this.showBadge = false,
    this.customBadge,
    this.size,
    this.badgeAlignment = Alignment.topRight,
    this.badgeOffset = Offset.zero,
  });

  @override
  Widget build(BuildContext context) {
    final double avatarSize = radius * 2;

    final Widget defaultBadge = Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        color: Colors.green,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 2),
      ),
    );

    return SizedBox(
      width: size?.width ?? avatarSize,
      height: size?.height ?? avatarSize,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Material(
            color: Colors.transparent,
            shape: const CircleBorder(),
            child: InkWell(
              onTap: onTap,
              customBorder: const CircleBorder(),
              splashColor: Theme.of(
                context,
              ).primaryColor.withValues(alpha: 0.2),
              child: Container(
                width: avatarSize,
                height: avatarSize,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor, width: 2),
                ),
                child: ClipOval(
                  child: Image(
                    image: image,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
              ),
            ),
          ),
          if (showBadge)
            Align(
              alignment: badgeAlignment,
              child: Transform.translate(
                offset: badgeOffset,
                child: customBadge ?? defaultBadge,
              ),
            ),
        ],
      ),
    );
  }
}

extension StackAvatars on List<Widget> {
  /// Stacks widgets with horizontal overlap — like a group of circle avatars.
  Widget toStackedAvatars({
    double overlap = 16.0,
    Alignment alignment = Alignment.centerLeft,
    double height = 40.0,
  }) {
    return SizedBox(
      height: height,
      child: Stack(
        alignment: alignment,
        children: List.generate(length, (index) {
          return Positioned(left: index * overlap, child: this[index]);
        }),
      ),
    );
  }
}
