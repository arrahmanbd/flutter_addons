part of 'package:flutter_addons/flutter_addons.dart';

/// A reusable frosted-glass blur wrapper that blurs the background behind [child].
///
/// - Uses [BackdropFilter] so only what's *behind* gets blurred.
/// - Constrains the blur area with [ClipRRect]/[ClipRect] for correct edges.
/// - Optional tint, border, and padding for a glassmorphism look.
class UiBlur extends StatelessWidget {
  const UiBlur({
    super.key,
    required this.child,
    this.blur = 10,
    // Whether to enable liquid effect (subtle shadow and tint).
    this.liquidEffect = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
    this.padding,
    this.tintColor = const Color(0x66FFFFFF), // subtle white tint
    this.border,
    this.shadow = const [
      BoxShadow(
        blurRadius: 12,
        spreadRadius: 0,
        offset: Offset(0, 4),
        color: Color(0x1A000000), // 10% black
      ),
    ],
    this.clipBehavior = Clip.antiAlias,
  });

  /// Gaussian blur strength (applied equally to X and Y).
  final double blur;

  /// Child rendered on top of the blurred background.
  final Widget child;

  /// Whether to enable shadow for the blur effect.
  final bool liquidEffect;

  /// Rounded corners for the blurred area.
  final BorderRadius borderRadius;

  /// Optional inner padding for [child].
  final EdgeInsetsGeometry? padding;

  /// Optional tint overlay color (use transparent for no tint).
  final Color tintColor;

  /// Optional border (e.g., Border.all(color.withValues(alpha:.2))).
  final BoxBorder? border;

  /// Optional shadow(s) for elevation feel.
  final List<BoxShadow>? shadow;

  /// How to clip the blur area.
  final Clip clipBehavior;

  @override
  Widget build(BuildContext context) {
    final content = Padding(padding: padding ?? EdgeInsets.zero, child: child);

    // Constrain the blur to this widget's bounds.
    return ClipRRect(
      borderRadius: borderRadius,
      clipBehavior: clipBehavior,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: liquidEffect ? tintColor : Colors.transparent,
            borderRadius: borderRadius,
            border: liquidEffect ? border : null,
            boxShadow: liquidEffect ? shadow : null,
          ),
          child: content,
        ),
      ),
    );
  }
}
