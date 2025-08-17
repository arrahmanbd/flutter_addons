part of 'package:flutter_addons/flutter_addons.dart';

class UiAvatar extends StatelessWidget {
  final String? imageUrl;
  final double size;
  final Color borderColor;
  final double borderWidth;
  final bool showStatus;
  final Color statusColor;

  const UiAvatar({
    super.key,
    this.imageUrl,
    this.size = 48,
    this.borderColor = Colors.blueAccent,
    this.borderWidth = 2,
    this.showStatus = false,
    this.statusColor = Colors.green,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: borderColor, width: borderWidth),
            image:
                imageUrl != null
                    ? DecorationImage(
                      image: NetworkImage(imageUrl!),
                      fit: BoxFit.cover,
                    )
                    : null,
            color: imageUrl == null ? Colors.grey.shade300 : null,
          ),
          child:
              imageUrl == null
                  ? Icon(Icons.person, size: size * 0.6, color: Colors.white)
                  : null,
        ),
        if (showStatus)
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: size * 0.25,
              height: size * 0.25,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2),
              ),
            ),
          ),
      ],
    );
  }
}
