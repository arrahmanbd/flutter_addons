part of 'package:flutter_addons/flutter_addons.dart';

/// Available dialog animations
enum DialogAnimation {
  fade,
  scale,
  slide,
  rotation,
}

class GlassDialog {
  static void show(
    BuildContext context, {
    required String title,
    required String message,
    String confirmText = "OK",
    VoidCallback? onConfirm,
    String? cancelText,
    VoidCallback? onCancel,
    DialogAnimation animation = DialogAnimation.scale,
    Color backgroundColor = Colors.black87,
    TextStyle titleStyle = const TextStyle(
        fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
    TextStyle messageStyle =
        const TextStyle(fontSize: 16, color: Colors.white70),
    double backgroundRadius = 20.0,
    Border? border,
    bool dismissible = true,
    IconData? icon,
  }) {
    showDialog(
      context: context,
      barrierDismissible: dismissible,
      builder: (context) {
        return _GlassDialogWidget(
          title: title,
          message: message,
          confirmText: confirmText,
          onConfirm: onConfirm,
          cancelText: cancelText,
          onCancel: onCancel,
          animation: animation,
          backgroundColor: backgroundColor,
          titleStyle: titleStyle,
          messageStyle: messageStyle,
          backgroundRadius: backgroundRadius,
          border: border,
          icon: icon,
        );
      },
    );
  }
}

class _GlassDialogWidget extends StatefulWidget {
  final String title;
  final String message;
  final String confirmText;
  final VoidCallback? onConfirm;
  final String? cancelText;
  final VoidCallback? onCancel;
  final DialogAnimation animation;
  final Color backgroundColor;
  final TextStyle titleStyle;
  final TextStyle messageStyle;
  final double backgroundRadius;
  final Border? border;
  final IconData? icon;

  const _GlassDialogWidget({
    Key? key,
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
    this.icon,
  }) : super(key: key);

  @override
  _GlassDialogWidgetState createState() => _GlassDialogWidgetState();
}

class _GlassDialogWidgetState extends State<_GlassDialogWidget>
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
      begin: const Offset(0, -0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _rotationAnimation = Tween<double>(begin: -0.1, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _controller.forward();
  }

  Widget _buildAnimation(Widget child) {
    switch (widget.animation) {
      case DialogAnimation.fade:
        return FadeTransition(opacity: _fadeAnimation, child: child);
      case DialogAnimation.slide:
        return SlideTransition(position: _slideAnimation, child: child);
      case DialogAnimation.scale:
        return ScaleTransition(scale: _scaleAnimation, child: child);
      case DialogAnimation.rotation:
        return RotationTransition(turns: _rotationAnimation, child: child);
      default:
        return child;
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
                  color: widget.backgroundColor.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(widget.backgroundRadius),
                  border: widget.border,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(widget.icon, size: 40, color: Colors.white),
                      const SizedBox(height: 10),
                    ],
                    Text(widget.title, style: widget.titleStyle, textAlign: TextAlign.center),
                    const SizedBox(height: 10),
                    Text(widget.message, style: widget.messageStyle, textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (widget.cancelText != null)
                          TextButton(
                            onPressed: () {
                              widget.onCancel?.call();
                              Navigator.pop(context);
                            },
                            child: Text(widget.cancelText!, style: const TextStyle(color: Colors.red)),
                          ),
                        ElevatedButton(
                          onPressed: () {
                            widget.onConfirm?.call();
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(widget.confirmText, style: const TextStyle(color: Colors.white)),
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