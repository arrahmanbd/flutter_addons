part of 'package:flutter_addons/flutter_addons.dart';

/// Available alert animations
enum AlertAnimation { fade, scale, slide, rotation }

class GlassAlertDialog {
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = "OK",
    VoidCallback? onConfirm,
    String? cancelText,
    VoidCallback? onCancel,
    AlertAnimation animation = AlertAnimation.slide,
    Color? backgroundColor,
    TextStyle titleStyle = const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    TextStyle messageStyle = const TextStyle(fontSize: 16, color: Colors.white),
    double? backgroundRadius,
    Border? border,
    bool dismissible = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return _GlassAlertWidget(
          title: title,
          message: message,
          confirmText: confirmText,
          onConfirm: onConfirm,
          cancelText: cancelText,
          onCancel: onCancel,
          animation: animation,
          backgroundColor:
              backgroundColor ?? context.background.withValues(alpha: .25),
          titleStyle: titleStyle,
          messageStyle: messageStyle,
          backgroundRadius: backgroundRadius??8.0,
          border:
              border ??
              Border.all(
                color: context.outline.withValues(alpha: .25),
                width: 2,
              ),
        );
      },
    );
  }
}

/// Alert Widget with Glassmorphism & Animations
class _GlassAlertWidget extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final VoidCallback? onConfirm;
  final String? cancelText;
  final VoidCallback? onCancel;
  final AlertAnimation animation;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle messageStyle;
  final double backgroundRadius;
  final Border? border;

  const _GlassAlertWidget({
    required this.title,
    required this.message,
    required this.confirmText,
    this.onConfirm,
    this.cancelText,
    this.onCancel,
    required this.animation,
    required this.backgroundColor,
    required this.titleStyle,
    required this.messageStyle,
    required this.backgroundRadius,
    this.border,
  });

  @override
  _GlassAlertWidgetState createState() => _GlassAlertWidgetState();
}

class _GlassAlertWidgetState extends State<_GlassAlertWidget>
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

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _rotationAnimation = Tween<double>(
      begin: -0.1,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  Widget _buildAnimation(Widget child) {
    switch (widget.animation) {
      case AlertAnimation.fade:
        return FadeTransition(opacity: _fadeAnimation, child: child);
      case AlertAnimation.slide:
        return SlideTransition(position: _slideAnimation, child: child);
      case AlertAnimation.scale:
        return ScaleTransition(scale: _scaleAnimation, child: child);
      case AlertAnimation.rotation:
        return RotationTransition(turns: _rotationAnimation, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _buildAnimation(
        Material(
          color: Colors.transparent,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.backgroundRadius),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                padding: const EdgeInsets.all(20),
                width: MediaQuery.of(context).size.width * 0.8,
                decoration: BoxDecoration(
                  color: widget.backgroundColor,
                  borderRadius: BorderRadius.circular(widget.backgroundRadius),
                  border: widget.border,
                  boxShadow: [
                    BoxShadow(
                      color: context.shadow.withValues(alpha: .20),
                      offset: Offset(3, 0),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.title,
                      style: widget.titleStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.message,
                      style: widget.messageStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.cancelText != null)
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: context.primaryColor.withValues(
                                alpha: 0.13,
                              ),
                              side: BorderSide(
                                color: context.primaryColor.withValues(
                              alpha: 0.75,
                            ),

                              width: 1,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                  widget.backgroundRadius * .25,
                                ),
                              ),
                            ),
                            onPressed: () {
                              widget.onCancel?.call();
                              Navigator.pop(context);
                            },
                            child: Text(
                              widget.cancelText!,
                              style: TextStyle(color: context.primaryColor),
                            ),
                          ),
                        OutlinedButton(
                          onPressed: () {
                            widget.onConfirm?.call();
                            Navigator.pop(context);
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: context.primaryColor.withValues(
                              alpha: 0.65,
                            ),
                            side: BorderSide(
                              color: context.primaryColor.withValues(
                              alpha: 0.75,
                            ),

                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                widget.backgroundRadius * .25,
                              ),
                            ),
                          ),
                          child: Text(
                            widget.confirmText,
                            style: TextStyle(color: context.forground),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
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
