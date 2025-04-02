part of 'package:flutter_addons/flutter_addons.dart';

/// Available toast animations
enum ToastAnimation { fade, slide, scale, rotation }

/// Toast utility class for displaying messages
class FlutterToastr {
  static const int lengthShort = 1;
  static const int lengthLong = 2;
  static const int bottom = 0;
  static const int center = 1;
  static const int top = 2;

  /// Displays a toast message
  static void show(
    String msg,
    BuildContext context, {
    int duration = lengthShort,
    int position = bottom,
    ToastAnimation animation = ToastAnimation.fade,
    Color? backgroundColor,
    TextStyle textStyle = const TextStyle(fontSize: 16, color: Colors.white),
    double backgroundRadius = 8.0,
    Border? border,
    bool? rootNavigator,
  }) {
    _FlutterToastrView.dismiss();
    _FlutterToastrView.createView(
      msg,
      context,
      duration,
      position,
      animation,
      backgroundColor?? context.background.withValues(alpha: .25),
      textStyle,
      backgroundRadius,
      border,
      rootNavigator,
    );
  }
}

class _FlutterToastrView {
  static OverlayEntry? _overlayEntry;
  static bool _isVisible = false;

  static void createView(
    String msg,
    BuildContext context,
    int duration,
    int position,
    ToastAnimation animation,
    Color backgroundColor,
    TextStyle textStyle,
    double backgroundRadius,
    Border? border,
    bool? rootNavigator,
  ) {
    final overlayState = Overlay.of(
      context,
      rootOverlay: rootNavigator ?? false,
    );

    _overlayEntry = OverlayEntry(
      builder:
          (context) => _FlutterToastrWidget(
            message: msg,
            position: position,
            animation: animation,
            backgroundColor: backgroundColor,
            textStyle: textStyle,
            backgroundRadius: backgroundRadius,
            border: border,
          ),
    );

    _isVisible = true;
    overlayState.insert(_overlayEntry!);

    Future.delayed(Duration(seconds: duration), () => dismiss());
  }

  /// Dismisses the toast
  static void dismiss() {
    if (!_isVisible) return;
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

/// Toast Widget with Multiple Animations
class _FlutterToastrWidget extends StatefulWidget {
  final String message;
  final int position;
  final ToastAnimation animation;
  final Color backgroundColor;
  final TextStyle textStyle;
  final double backgroundRadius;
  final Border? border;

  const _FlutterToastrWidget({
    Key? key,
    required this.message,
    required this.position,
    required this.animation,
    required this.backgroundColor,
    required this.textStyle,
    required this.backgroundRadius,
    this.border,
  }) : super(key: key);

  @override
  _FlutterToastrWidgetState createState() => _FlutterToastrWidgetState();
}

class _FlutterToastrWidgetState extends State<_FlutterToastrWidget>
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
      begin: const Offset(0, 0.1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _scaleAnimation = Tween<double>(
      begin: 0.7,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));

    _rotationAnimation = Tween<double>(
      begin: -0.2,
      end: 0.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  Widget _buildAnimation(Widget child) {
    switch (widget.animation) {
      case ToastAnimation.fade:
        return FadeTransition(opacity: _fadeAnimation, child: child);
      case ToastAnimation.slide:
        return SlideTransition(position: _slideAnimation, child: child);
      case ToastAnimation.scale:
        return ScaleTransition(scale: _scaleAnimation, child: child);
      case ToastAnimation.rotation:
        return RotationTransition(turns: _rotationAnimation, child: child);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top:
          widget.position == FlutterToastr.top
              ? MediaQuery.of(context).viewInsets.top + 50
              : null,
      bottom:
          widget.position == FlutterToastr.bottom
              ? MediaQuery.of(context).viewInsets.bottom + 50
              : null,
      child: _buildAnimation(
        Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width * 0.9,
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(widget.backgroundRadius),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.backgroundColor,
                    borderRadius: BorderRadius.circular(
                      widget.backgroundRadius,
                    ),
                    border: widget.border,
                    boxShadow: [
                      BoxShadow(
                        color: context.shadow.withValues(alpha: .20),
                        offset: Offset(3, 0),
                        blurRadius: 16,
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  child: Text(
                    widget.message,
                    softWrap: true,
                    style: widget.textStyle,
                    textAlign: TextAlign.center,
                  ),
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
