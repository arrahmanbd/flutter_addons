part of 'package:flutter_addons/flutter_addons.dart';

class InputDecorations {
  /// Material 3-like outline input
  static InputDecoration materialOutline({
    required BuildContext context,
    String? label,
    String? hint,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      border: InputForm.flatBorder(context, radius: 12),
      enabledBorder: InputForm.flatBorder(context, radius: 12),
      focusedBorder: InputForm.glowBorder(context, radius: 12),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
    );
  }

  /// Fluent UI / Windows-style filled input
  static InputDecoration fluentFilled({
    required BuildContext context,
    String? hint,
    IconData? prefixIcon,
  }) {
    final color = Theme.of(context).colorScheme.onSurface;
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: color,
      border: InputForm.flatBorder(
        context,
        color: Colors.transparent,
        radius: 6,
      ),
      enabledBorder: InputForm.flatBorder(
        context,
        color: Colors.transparent,
        radius: 6,
      ),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    );
  }

  /// Ant Design inspired clean borderless input
  static InputDecoration antDesign({
    required String hint,
    IconData? prefixIcon,
    IconData? suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,
      border: InputForm.noBorder(),
      enabledBorder: InputForm.noBorder(),
      focusedBorder: InputForm.noBorder(),
      prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
      suffixIcon: suffixIcon != null ? Icon(suffixIcon) : null,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    );
  }

  /// Tailwind-style minimalist underline input
  static InputDecoration tailwindUnderline({
    required BuildContext context,
    required String hint,
  }) {
    return InputDecoration(
      hintText: hint,
      border: InputForm.underlineBorder(context),
      enabledBorder: InputForm.underlineBorder(context),
      focusedBorder: InputForm.glowBorder(context, radius: 0),
      isDense: true,
      contentPadding: const EdgeInsets.only(bottom: 6),
    );
  }

  /// Glassmorphism-inspired frosted field
  static InputDecoration glassStyle({
    required BuildContext context,
    String? hint,
  }) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Theme.of(context).colorScheme.surface.withValues(alpha: 0.2),
      border: InputForm.flatBorder(context, color: Colors.white24, radius: 16),
      enabledBorder: InputForm.flatBorder(
        context,
        color: Colors.white24,
        radius: 16,
      ),
      focusedBorder: InputForm.flatBorder(
        context,
        color: Colors.white60,
        radius: 16,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    );
  }
}
