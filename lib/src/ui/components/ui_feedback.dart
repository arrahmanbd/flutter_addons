part of 'package:flutter_addons/flutter_addons.dart';

class UiFeedback {
  UiFeedback._(); // private constructor

  /// Show Snackbar
  ///  Example:
  // UiFeedback.snackbar(context, message: "Profile updated!");
  static void snackbar(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Color? backgroundColor,
    Duration duration = const Duration(seconds: 3),
    TextStyle? textStyle,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: textStyle),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.primary,
        duration: duration,
        action:
            actionLabel != null
                ? SnackBarAction(
                  label: actionLabel,
                  onPressed: onAction ?? () {},
                )
                : null,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  /// Show Toast (Custom implementation using Overlay)
  /// UiFeedback.toast(context, "Saved successfully");
  /// Glass-style Toast using Overlay + BackdropFilter
  static void toast(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 2),
    double blur = 12,
    double borderRadius = 20,
    EdgeInsets margin = const EdgeInsets.only(bottom: 100),
    EdgeInsets padding = const EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 12,
    ),
    Alignment alignment = Alignment.bottomCenter,
    Color tintColor = const Color(0x66FFFFFF),
    Color textColor = Colors.white,
    double fontSize = 14,
  }) {
    final overlay = Overlay.of(context);

    final entry = OverlayEntry(
      builder:
          (context) => Positioned(
            left: 24,
            right: 24,
            bottom: margin.bottom,
            child: Align(
              alignment: alignment,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(borderRadius),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
                  child: Container(
                    padding: padding,
                    decoration: BoxDecoration(
                      color: tintColor,
                      borderRadius: BorderRadius.circular(borderRadius),
                      border: Border.all(color: Colors.white.withValues(alpha:0.3)),
                    ),
                    child: Text(
                      message,
                      style: TextStyle(
                        color: textColor,
                        fontSize: fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ),
    );

    overlay.insert(entry);

    Future.delayed(duration, () {
      entry.remove();
    });
  }

  /// Show BottomSheet
  /// Example
  //   UiFeedback.bottomSheet(
  //   context,
  //   child: ListView(
  //     shrinkWrap: true,
  //     children: const [
  //       ListTile(title: Text("Option 1")),
  //       ListTile(title: Text("Option 2")),
  //     ],
  //   ),
  // );
  static Future<T?> bottomSheet<T>(
    BuildContext context, {
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    Color? backgroundColor,
    double borderRadius = 16,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      ),
      builder:
          (_) => Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: child,
          ),
    );
  }

  /// Show AlertDialog
  /// Example:
  //   UiFeedback.alert(
  //   context,
  //   title: "Delete Item?",
  //   message: "Are you sure you want to delete this?",
  //   confirmText: "Delete",
  //   cancelText: "Cancel",
  //   onConfirm: () => print("Deleted"),
  // );

  static Future<T?> alert<T>(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = "OK",
    String? cancelText,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
    Color? confirmColor,
    Color? cancelColor,
  }) {
    return showDialog<T>(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title, style: Theme.of(context).textTheme.titleLarge),
            content: Text(
              message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            actions: [
              if (cancelText != null)
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    onCancel?.call();
                  },
                  style: TextButton.styleFrom(foregroundColor: cancelColor),
                  child: Text(cancelText),
                ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm?.call();
                },
                style: TextButton.styleFrom(
                  foregroundColor:
                      confirmColor ?? Theme.of(context).colorScheme.primary,
                ),
                child: Text(confirmText),
              ),
            ],
          ),
    );
  }

  /// Show MaterialBanner
  /// Example
  //   UiFeedback.materialBanner(
  //   context,
  //   message: "New update available!",
  //   actionLabel: "Update",
  //   onAction: () => print("Update clicked"),
  //   icon: Icons.system_update,
  // );
  static void materialBanner(
    BuildContext context, {
    required String message,
    String? actionLabel,
    VoidCallback? onAction,
    Color? backgroundColor,
    TextStyle? textStyle,
    Duration duration = const Duration(seconds: 4),
    IconData? icon,
  }) {
    final banner = MaterialBanner(
      content: Text(message, style: textStyle),
      leading:
          icon != null
              ? Icon(icon, color: Theme.of(context).colorScheme.primary)
              : null,
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.surface,
      actions: [
        if (actionLabel != null)
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
              onAction?.call();
            },
            child: Text(actionLabel),
          ),
        TextButton(
          onPressed:
              () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
          child: const Text("DISMISS"),
        ),
      ],
    );

    final messenger = ScaffoldMessenger.of(context);

    messenger
      ..hideCurrentMaterialBanner()
      ..showMaterialBanner(banner);

    // Auto dismiss after duration
    Future.delayed(duration, () {
      if (messenger.mounted) {
        messenger.hideCurrentMaterialBanner();
      }
    });
  }
}
