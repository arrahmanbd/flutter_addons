part of 'package:flutter_addons/flutter_addons.dart';

/// A professional and customizable OTP input field.
typedef ResendButtonBuilder = Widget Function(VoidCallback onTap, int seconds);
class OtpDecoration {
  final Color borderColor;
  final Color focusBorderColor;
  final Color successBorderColor;
  final Color errorBorderColor;
  final double borderRadius;
  final Color boxColor;
  final List<BoxShadow>? boxShadow;

  const OtpDecoration({
    this.borderColor = const Color(0xFFCCCCCC),
    this.focusBorderColor = const Color(0xFF1976D2),
    this.successBorderColor = const Color(0xFF2E7D32),
    this.errorBorderColor = const Color(0xFFD32F2F),
    this.borderRadius = 8.0,
    this.boxColor = Colors.white,
    this.boxShadow,
  });
}

class UiOtpField extends StatefulWidget {
  final int pinLength;
  final double fieldWidth;
  final TextStyle? textStyle;
  final Color? cursorColor;
  final Function(String)? onChanged;
  final Function(String)? onCompleted;
  final Duration resendDuration;
  final VoidCallback? onResend;
  final bool autoSubmit;
  final OtpDecoration? decoration;
  final ResendButtonBuilder? resendButtonBuilder;

  const UiOtpField({
    super.key,
    this.pinLength = 5,
    this.fieldWidth = 50,
    this.textStyle,
    this.cursorColor,
    this.onChanged,
    this.onCompleted,
    this.resendDuration = const Duration(seconds: 60),
    this.onResend,
    this.autoSubmit = true,
    this.decoration,
    this.resendButtonBuilder,
  });

  @override
  State<UiOtpField> createState() => _UiOtpFieldState();
}

class _UiOtpFieldState extends State<UiOtpField>
    with SingleTickerProviderStateMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  late AnimationController _shakeController;
  late Animation<double> _offsetAnimation;

  Timer? _resendTimer;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(widget.pinLength, (_) => TextEditingController());
    _focusNodes = List.generate(widget.pinLength, (_) => FocusNode());

    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _offsetAnimation = Tween(begin: 0.0, end: 8.0)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_shakeController);

    _startResendTimer();
  }

  void _startResendTimer() {
    _remainingSeconds = widget.resendDuration.inSeconds;
    _resendTimer?.cancel();
    _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds <= 1) {
        timer.cancel();
      }
      setState(() => _remainingSeconds--);
    });
  }

  String get _otp => _controllers.map((c) => c.text).join();

  void _handleChange(String value, int index) {
    if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    } else if (value.length == 1 && index + 1 < widget.pinLength) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    }

    widget.onChanged?.call(_otp);
    if (widget.autoSubmit && _otp.length == widget.pinLength) {
      widget.onCompleted?.call(_otp);
    }
  }

  BoxDecoration _getBoxDecoration(bool hasFocus) {
    final d = widget.decoration ?? const OtpDecoration();
    return BoxDecoration(
      color: d.boxColor,
      border: Border.all(
        color: hasFocus ? d.focusBorderColor : d.borderColor,
        width: 1.8,
      ),
      borderRadius: BorderRadius.circular(d.borderRadius),
      boxShadow: hasFocus ? d.boxShadow ?? [] : [],
    );
  }

  @override
  void dispose() {
    for (final c in _controllers) c.dispose();
    for (final f in _focusNodes) f.dispose();
    _resendTimer?.cancel();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _offsetAnimation,
          builder: (_, child) => Transform.translate(
            offset: Offset(_offsetAnimation.value, 0),
            child: child,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pinLength, (i) {
              return Container(
                width: widget.fieldWidth,
                height: widget.fieldWidth * 1.1,
                margin: const EdgeInsets.symmetric(horizontal: 6),
                decoration: _getBoxDecoration(_focusNodes[i].hasFocus),
                child: TextField(
                  controller: _controllers[i],
                  focusNode: _focusNodes[i],
                  textAlign: TextAlign.center,
                  style: widget.textStyle ?? theme.textTheme.titleLarge,
                  cursorColor: widget.cursorColor ?? theme.primaryColor,
                  keyboardType: TextInputType.number,
                  maxLength: 1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    contentPadding: Zero.insets,
                    counterText: '',
                    isCollapsed: true,
                  ),
                  onChanged: (v) => _handleChange(v, i),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 12),
        _remainingSeconds > 0
            ? (widget.resendButtonBuilder?.call(() {}, _remainingSeconds) ??
                Text('Resend in $_remainingSeconds s'))
            : (widget.resendButtonBuilder?.call(() {
                  widget.onResend?.call();
                  _startResendTimer();
                }, 0) ??
                TextButton(
                  onPressed: () {
                    widget.onResend?.call();
                    _startResendTimer();
                  },
                  child: Text(
                    'Resend Code',
                    style: TextStyle(color: theme.primaryColor),
                  ),
                )),
      ],
    );
  }
}
