part of 'package:flutter_addons/flutter_addons.dart';

// import 'dart:ui';
// import 'package:flutter/material.dart';

/// Available Snackbar animations
enum SnackbarAnimation {
  fade,
  scale,
  slide,
  rotation,
}

class GlassSnackbar {
  static void show(
    BuildContext context, {
    required String message,
    String actionText = "OK",
    VoidCallback? onAction,
    SnackbarAnimation animation = SnackbarAnimation.slide,
    Color backgroundColor = Colors.black87,
    TextStyle messageStyle =
        const TextStyle(fontSize: 16, color: Colors.white70),
    double backgroundRadius = 0.0,
    Border? border,
    Duration duration = const Duration(seconds: 3),
  }) {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    scaffoldMessenger.hideCurrentSnackBar();

    final snackBar = SnackBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      duration: duration,
      content: _GlassSnackbarWidget(
        message: message,
        actionText: actionText,
        onAction: onAction,
        animation: animation,
        backgroundColor: backgroundColor,
        messageStyle: messageStyle,
        backgroundRadius: backgroundRadius,
        border: border,
      ),
      behavior: SnackBarBehavior.floating,
    );
    scaffoldMessenger.showSnackBar(snackBar);
  }
}

class _GlassSnackbarWidget extends StatefulWidget {
  final String message;
  final String actionText;
  final VoidCallback? onAction;
  final SnackbarAnimation animation;
  final Color backgroundColor;
  final TextStyle messageStyle;
  final double backgroundRadius;
  final Border? border;

  const _GlassSnackbarWidget({
    Key? key,
    required this.message,
    required this.actionText,
    this.onAction,
    required this.animation,
    required this.backgroundColor,
    required this.messageStyle,
    required this.backgroundRadius,
    this.border,
  }) : super(key: key);

  @override
  _GlassSnackbarWidgetState createState() => _GlassSnackbarWidgetState();
}

class _GlassSnackbarWidgetState extends State<_GlassSnackbarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _rotationAnimation = Tween<double>(begin: -0.1, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  Widget _buildAnimation(Widget child) {
    switch (widget.animation) {
      case SnackbarAnimation.fade:
        return FadeTransition(opacity: _fadeAnimation, child: child);
      case SnackbarAnimation.slide:
        return SlideTransition(position: _slideAnimation, child: child);
      case SnackbarAnimation.scale:
        return ScaleTransition(scale: _scaleAnimation, child: child);
      case SnackbarAnimation.rotation:
        return RotationTransition(turns: _rotationAnimation, child: child);
      default:
        return child;
    }
  }

  @override
  Widget build(BuildContext context) {
    return _buildAnimation(
      ClipRRect(
        borderRadius: BorderRadius.circular(widget.backgroundRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              color: widget.backgroundColor.withOpacity(0.8),
              borderRadius: BorderRadius.circular(widget.backgroundRadius),
              border: widget.border,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Text(widget.message,
                      style: widget.messageStyle, textAlign: TextAlign.start),
                ),
                if (widget.onAction != null)
                  TextButton(
                    onPressed: widget.onAction,
                    child: Text(widget.actionText,
                        style: const TextStyle(color: Colors.white)),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}