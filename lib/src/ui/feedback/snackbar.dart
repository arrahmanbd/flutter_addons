part of 'package:flutter_addons/flutter_addons.dart';

class _SnackbarContent extends StatelessWidget {
  final String title;
  final String message;
  final NotificationType type;
  final Widget? icon;
  final bool showCloseIcon;

  const _SnackbarContent({
    required this.title,
    required this.message,
    required this.type,
    this.icon,
    this.showCloseIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    final service = NotificationService();

    return Container(
      decoration: BoxDecoration(
        color: service._getBackgroundColor(type),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            icon ??
                Icon(
                  service._getDefaultIcon(type),
                  color: service._getIconColor(type),
                  size: 24,
                ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 13),
                  ),
                ],
              ),
            ),
            if (showCloseIcon) ...[
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.close, size: 18),
                color: Colors.white,
                onPressed:
                    () => ScaffoldMessenger.of(context).hideCurrentSnackBar(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
