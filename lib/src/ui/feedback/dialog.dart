part of 'package:flutter_addons/flutter_addons.dart';

enum NotificationType { success, error, warning, info }

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();
  factory NotificationService() => _instance;
  NotificationService._internal();

  // Toast Configuration
  void showToast({
    required BuildContext context,
    required String message,
    String? title,
    NotificationType type = NotificationType.info,
    Duration duration = const Duration(seconds: 3),
    ToastPosition position = ToastPosition.top,
  }) {
    final overlay = Overlay.of(context);
    late final OverlayEntry entry;
    entry = OverlayEntry(
      builder:
          (context) => _ToastWidget(
            message: message,
            title: title,
            type: type,
            duration: duration,
            position: position,
            onDismiss: () => entry.remove(),
          ),
    );
    overlay.insert(entry);
  }

  // Professional Snackbar
  void showSnackbar({
    required BuildContext context,
    required String title,
    required String message,
    NotificationType type = NotificationType.info,
    Duration duration = const Duration(seconds: 4),
    Widget? icon,
    String? actionText,
    VoidCallback? onAction,
    bool showCloseIcon = true,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: _SnackbarContent(
          title: title,
          message: message,
          type: type,
          icon: icon,
          showCloseIcon: showCloseIcon,
        ),
        duration: duration,
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(16),
        padding: EdgeInsets.zero,
        action:
            actionText != null
                ? SnackBarAction(
                  label: actionText,
                  textColor: _getTextColor(type),
                  onPressed: onAction ?? () {},
                )
                : null,
      ),
    );
  }

  // Professional Alert Dialog
  Future<T?> showAlert<T>({
    required BuildContext context,
    required String title,
    required String message,
    NotificationType type = NotificationType.info,
    String confirmText = 'OK',
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    bool barrierDismissible = true,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      builder:
          (context) => _AlertDialog(
            title: title,
            message: message,
            type: type,
            confirmText: confirmText,
            cancelText: cancelText,
            onConfirm: onConfirm,
            onCancel: onCancel,
          ),
    );
  }

  // Confirmation Dialog
  Future<bool> showConfirmation({
    required BuildContext context,
    required String title,
    required String message,
    NotificationType type = NotificationType.warning,
    String confirmText = 'Confirm',
    String cancelText = 'Cancel',
    Color? confirmColor,
  }) async {
    final result = await showAlert(
      context: context,
      title: title,
      message: message,
      type: type,
      confirmText: confirmText,
      cancelText: cancelText,
    );
    return result == true;
  }

  // Color and Icon Helpers
  Color _getBackgroundColor(NotificationType type) {
    switch (type) {
      case NotificationType.success:
        return const Color(0xFF4CAF50);
      case NotificationType.error:
        return const Color(0xFFF44336);
      case NotificationType.warning:
        return const Color(0xFFFF9800);
      case NotificationType.info:
        return const Color(0xFF2196F3);
    }
  }

  Color _getTextColor(NotificationType type) {
    return Colors.white;
  }

  Color _getIconColor(NotificationType type) {
    return Colors.white;
  }

  IconData _getDefaultIcon(NotificationType type) {
    switch (type) {
      case NotificationType.success:
        return Icons.check_circle;
      case NotificationType.error:
        return Icons.error;
      case NotificationType.warning:
        return Icons.warning;
      case NotificationType.info:
        return Icons.info;
    }
  }
}

enum ToastPosition { top, center, bottom }

class _AlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final NotificationType type;
  final String confirmText;
  final String? cancelText;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const _AlertDialog({
    required this.title,
    required this.message,
    required this.type,
    required this.confirmText,
    this.cancelText,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final service = NotificationService();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      backgroundColor: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: service._getBackgroundColor(type).withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                service._getDefaultIcon(type),
                color: service._getBackgroundColor(type),
                size: 32,
              ),
            ),
            const SizedBox(height: 16),

            // Title
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),

            // Message
            Text(
              message,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Actions
            Row(
              children: [
                if (cancelText != null) ...[
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                        onCancel?.call();
                      },
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(cancelText!),
                    ),
                  ),
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop(true);
                      onConfirm?.call();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: service._getBackgroundColor(type),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      confirmText,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
