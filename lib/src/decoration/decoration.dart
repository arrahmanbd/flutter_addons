part of 'package:flutter_addons/flutter_addons.dart';

/// Extension for Fluent Input Decoration

class BoxDecorations {
  /// Soft shadow & subtle border, like Material cards
  static BoxDecoration softCard({
    Color? color,
    double radius = 12,
    Color? borderColor,
  }) {
    return BoxDecoration(
      color: color ?? Colors.white,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor ?? Colors.grey.shade200),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.04),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  /// Glassmorphism blur effect
  static BoxDecoration glass({
    double radius = 16,
    Color color = Colors.white12,
    bool withBorder = true,
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      border: withBorder ? Border.all(color: Colors.white30, width: 1) : null,
    );
  }

  /// Neon Glow style (great for buttons or focus areas)
  static BoxDecoration neonGlow({
    required Color glowColor,
    double radius = 10,
    Color background = Colors.black,
  }) {
    return BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: glowColor.withValues(alpha: 0.7),
          blurRadius: 12,
          spreadRadius: 1,
        ),
        BoxShadow(
          color: glowColor.withValues(alpha: 0.3),
          blurRadius: 30,
          spreadRadius: 8,
        ),
      ],
    );
  }

  /// Minimal border with padding look (like Tailwind / Chakra cards)
  static BoxDecoration minimalBorder({
    double radius = 8,
    Color? borderColor,
    Color? background,
  }) {
    return BoxDecoration(
      color: background ?? Colors.white,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: borderColor ?? Colors.grey.shade300, width: 1),
    );
  }

  /// Gradient box (for buttons, banners)
  static BoxDecoration gradientBox({
    required List<Color> colors,
    double radius = 12,
  }) {
    return BoxDecoration(
      gradient: LinearGradient(
        colors: colors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.circular(radius),
    );
  }

  /// Dark card with border (for dark themes)
  static BoxDecoration darkCard({
    double radius = 10,
    Color background = const Color(0xFF1E1E1E),
    Color border = const Color(0xFF333333),
  }) {
    return BoxDecoration(
      color: background,
      borderRadius: BorderRadius.circular(radius),
      border: Border.all(color: border),
    );
  }
}

class InputForm {
  /// Outline border with customizable radius and color.
  static InputBorder flatBorder(
    BuildContext context, {
    Color? color,
    double radius = 8,
    double width = 1,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.r),
      borderSide: BorderSide(
        color: color ?? Theme.of(context).colorScheme.outline,
        width: width,
      ),
    );
  }

  /// Rounded border with soft edges.
  static InputBorder roundedBorder(
    BuildContext context, {
    Color? color,
    double radius = 24,
    double width = 1.2,
  }) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.r),
      borderSide: BorderSide(
        color: color ?? Theme.of(context).colorScheme.outline,
        width: width,
      ),
    );
  }

  /// Underline-only border (Material-style).
  static InputBorder underlineBorder(
    BuildContext context, {
    Color? color,
    double width = 1,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color ?? Theme.of(context).colorScheme.outlineVariant,
        width: width,
      ),
    );
  }

  /// Glowing outline border (good for OTP fields or focused states).
  static InputBorder glowBorder(
    BuildContext context, {
    Color? color,
    double radius = 12,
    double width = 2,
  }) {
    final glowColor = (color ?? Theme.of(context).colorScheme.primary)
        .withValues(alpha: 0.6);
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius.r),
      borderSide: BorderSide(color: glowColor, width: width),
    );
  }

  /// No border.
  static InputBorder noBorder() {
    return InputBorder.none;
  }
}
