part of 'package:flutter_addons/flutter_addons.dart';


class UiErrorPage extends StatelessWidget {
  final String message;
  final String? title;
  final String? buttonText;
  final VoidCallback? onButtonPressed;
  final IconData icon;

  const UiErrorPage({
    super.key,
    required this.message,
    this.title,
    this.buttonText,
    this.onButtonPressed,
    this.icon = Icons.error_outline,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 100, color: theme.colorScheme.error),
              const SizedBox(height: 24),
              if (title != null)
                Text(
                  title!,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              if (title != null) const SizedBox(height: 12),
              Text(
                message,
                style: theme.textTheme.bodyMedium?.copyWith(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              if (buttonText != null && onButtonPressed != null) ...[
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: onButtonPressed,
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  ),
                  child: Text(buttonText!),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
