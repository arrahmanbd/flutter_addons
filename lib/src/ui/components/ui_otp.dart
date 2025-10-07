part of 'package:flutter_addons/flutter_addons.dart';

/// A professional and customizable OTP input field component.
///
/// Features:
/// - Customizable pin length and field styling
/// - Auto-submit and manual submission options
/// - Resend functionality with customizable timer
/// - Success/error states with visual feedback
/// - Shake animation for invalid inputs
/// - Fully customizable resend button builder
typedef ResendButtonBuilder =
    Widget Function(
      BuildContext context,
      VoidCallback onResend,
      int remainingSeconds,
      bool isEnabled,
    );

class OtpDecoration {
  final Color borderColor;
  final Color focusBorderColor;
  final Color successBorderColor;
  final Color errorBorderColor;
  final double borderWidth;
  final double focusBorderWidth;
  final double borderRadius;
  final Color? boxColor;
  final Color focusedBoxColor;
  final List<BoxShadow>? boxShadow;
  final List<BoxShadow>? focusedBoxShadow;

  const OtpDecoration({
    this.borderColor = const ui.Color.fromARGB(255, 59, 38, 38),
    this.focusBorderColor = const Color(0xFF1976D2),
    this.successBorderColor = const Color(0xFF2E7D32),
    this.errorBorderColor = const Color(0xFFD32F2F),
    this.borderWidth = 1.5,
    this.focusBorderWidth = 2.0,
    this.borderRadius = 12.0,
    this.boxColor,
    this.focusedBoxColor = Colors.white,
    this.boxShadow,
    this.focusedBoxShadow,
  });

  OtpDecoration copyWith({
    Color? borderColor,
    Color? focusBorderColor,
    Color? successBorderColor,
    Color? errorBorderColor,
    double? borderWidth,
    double? focusBorderWidth,
    double? borderRadius,
    Color? boxColor,
    Color? focusedBoxColor,
    List<BoxShadow>? boxShadow,
    List<BoxShadow>? focusedBoxShadow,
  }) {
    return OtpDecoration(
      borderColor: borderColor ?? this.borderColor,
      focusBorderColor: focusBorderColor ?? this.focusBorderColor,
      successBorderColor: successBorderColor ?? this.successBorderColor,
      errorBorderColor: errorBorderColor ?? this.errorBorderColor,
      borderWidth: borderWidth ?? this.borderWidth,
      focusBorderWidth: focusBorderWidth ?? this.focusBorderWidth,
      borderRadius: borderRadius ?? this.borderRadius,
      boxColor: boxColor ?? this.boxColor,
      focusedBoxColor: focusedBoxColor ?? this.focusedBoxColor,
      boxShadow: boxShadow ?? this.boxShadow,
      focusedBoxShadow: focusedBoxShadow ?? this.focusedBoxShadow,
    );
  }
}

class UiOtpField extends StatefulWidget {
  /// Length of the OTP code
  final int pinLength;

  /// Width and height of each OTP field
  final double fieldSize;

  /// Gap between OTP fields
  final double fieldGap;

  /// Text style for the OTP digits
  final TextStyle? textStyle;

  /// Cursor color
  final Color? cursorColor;

  /// Called whenever the OTP value changes
  final ValueChanged<String>? onChanged;

  /// Called when OTP is completed (auto-submit or manually)
  final ValueChanged<String>? onCompleted;

  /// Called when user requests to resend OTP
  final VoidCallback? onResend;

  /// Duration for resend timer
  final Duration resendDuration;

  /// Whether to auto-submit when all fields are filled
  final bool autoSubmit;

  /// Decoration for OTP fields
  final OtpDecoration? decoration;

  /// Builder for custom resend button
  final ResendButtonBuilder? resendButtonBuilder;

  /// Whether to show the resend button
  final bool showResendButton;

  /// Current validation state
  final OtpValidationState validationState;

  /// Whether the OTP field is enabled
  final bool enabled;

  /// Keyboard type for OTP input
  final TextInputType keyboardType;

  /// Auto-focus the first field
  final bool autofocus;

  const UiOtpField({
    super.key,
    this.pinLength = 6,
    this.fieldSize = 56.0,
    this.fieldGap = 8.0,
    this.textStyle,
    this.cursorColor,
    this.onChanged,
    this.onCompleted,
    this.onResend,
    this.resendDuration = const Duration(seconds: 60),
    this.autoSubmit = true,
    this.decoration,
    this.resendButtonBuilder,
    this.showResendButton = true,
    this.validationState = OtpValidationState.none,
    this.enabled = true,
    this.keyboardType = TextInputType.number,
    this.autofocus = false,
  });

  @override
  State<UiOtpField> createState() => _UiOtpFieldState();
}

enum OtpValidationState { none, success, error }

class _UiOtpFieldState extends State<UiOtpField>
    with SingleTickerProviderStateMixin {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;
  late List<String> _fieldValues;

  late AnimationController _shakeController;
  late Animation<Offset> _offsetAnimation;

  Timer? _resendTimer;
  int _remainingSeconds = 0;
  bool _isResendEnabled = false;

  OtpValidationState get _currentValidationState => widget.validationState;

  @override
  void initState() {
    super.initState();
    _initializeControllers();
    _initializeAnimations();
    _startResendTimer();

    if (widget.autofocus) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        FocusScope.of(context).requestFocus(_focusNodes.first);
      });
    }
  }

  void _initializeControllers() {
    _controllers = List.generate(
      widget.pinLength,
      (_) => TextEditingController(),
    );
    _focusNodes = List.generate(widget.pinLength, (_) => FocusNode());
    _fieldValues = List.filled(widget.pinLength, '');
  }

  void _initializeAnimations() {
    _shakeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.1, 0),
    ).animate(
      CurvedAnimation(parent: _shakeController, curve: Curves.elasticOut),
    );
  }

  void _startResendTimer() {
    _remainingSeconds = widget.resendDuration.inSeconds;
    _isResendEnabled = false;
    _resendTimer?.cancel();

    if (_remainingSeconds > 0) {
      _resendTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          _remainingSeconds--;
          if (_remainingSeconds <= 0) {
            _isResendEnabled = true;
            timer.cancel();
          }
        });
      });
    } else {
      _isResendEnabled = true;
    }
  }

  String get _otp => _fieldValues.join();

  void _handleFieldChange(String value, int index) {
    final newValue = value.isEmpty ? '' : value[value.length - 1];

    setState(() {
      _fieldValues[index] = newValue;
      _controllers[index].text = newValue;
    });

    // Move focus based on input
    if (value.isNotEmpty && index < widget.pinLength - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    widget.onChanged?.call(_otp);

    // Auto-submit if all fields are filled
    if (widget.autoSubmit && _otp.length == widget.pinLength) {
      widget.onCompleted?.call(_otp);
    }
  }

  // void _handlePaste(String pastedText) {
  //   final digitsOnly = pastedText.replaceAll(RegExp(r'[^0-9]'), '');
  //   if (digitsOnly.length == widget.pinLength) {
  //     for (int i = 0; i < widget.pinLength; i++) {
  //       _fieldValues[i] = digitsOnly[i];
  //       _controllers[i].text = digitsOnly[i];
  //     }
  //     widget.onChanged?.call(digitsOnly);
  //     widget.onCompleted?.call(digitsOnly);
  //   }
  // }

  void _triggerShakeAnimation() {
    _shakeController.forward(from: 0.0);
  }

  BoxDecoration _getBoxDecoration(int index) {
    final decoration =
        widget.decoration ??
        const OtpDecoration().copyWith(
          boxColor: context.surfaceElevated,
          focusedBoxColor: context.surface,
        );
    final hasFocus = _focusNodes[index].hasFocus;
    final isFilled = _fieldValues[index].isNotEmpty;

    Color borderColor = decoration.borderColor;
    double borderWidth = decoration.borderWidth;

    if (hasFocus) {
      borderColor = decoration.focusBorderColor;
      borderWidth = decoration.focusBorderWidth;
    } else if (_currentValidationState == OtpValidationState.success) {
      borderColor = decoration.successBorderColor;
    } else if (_currentValidationState == OtpValidationState.error) {
      borderColor = decoration.errorBorderColor;
    } else if (isFilled) {
      borderColor = decoration.focusBorderColor;
    }

    return BoxDecoration(
      color: hasFocus ? decoration.focusedBoxColor : decoration.boxColor,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.circular(decoration.borderRadius),
      boxShadow:
          hasFocus
              ? decoration.focusedBoxShadow ?? decoration.boxShadow
              : decoration.boxShadow,
    );
  }

  void _clearAllFields() {
    for (int i = 0; i < widget.pinLength; i++) {
      _controllers[i].clear();
      _fieldValues[i] = '';
    }
    FocusScope.of(context).requestFocus(_focusNodes.first);
    widget.onChanged?.call('');
  }

  @override
  void didUpdateWidget(covariant UiOtpField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.validationState != widget.validationState &&
        widget.validationState == OtpValidationState.error) {
      _triggerShakeAnimation();
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _resendTimer?.cancel();
    _shakeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final defaultTextStyle =
        theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600) ??
        const TextStyle(fontSize: 24, fontWeight: FontWeight.w600);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // OTP Fields
        SlideTransition(
          position: _offsetAnimation,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.pinLength, (index) {
              return Container(
                width: widget.fieldSize,
                height: widget.fieldSize,
                margin: EdgeInsets.symmetric(horizontal: widget.fieldGap / 2),
                decoration: _getBoxDecoration(index),
                child: Center(
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    textAlign: TextAlign.center,

                    style: widget.textStyle ?? defaultTextStyle,
                    cursorColor: widget.cursorColor ?? theme.primaryColor,
                    keyboardType: widget.keyboardType,
                    maxLength: 1,
                    enabled: widget.enabled,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                      fillColor: Colors.transparent,
                      counterText: '',
                      isCollapsed: true,
                    ),
                    onChanged: (value) => _handleFieldChange(value, index),
                    onTap: () {
                      // Select all text when tapping on a field
                      _controllers[index].selection = TextSelection(
                        baseOffset: 0,
                        extentOffset: _controllers[index].text.length,
                      );
                    },
                  ),
                ),
              );
            }),
          ),
        ),

        const SizedBox(height: 16),

        // Resend Button
        if (widget.showResendButton) ...[
          widget.resendButtonBuilder?.call(
                context,
                () {
                  widget.onResend?.call();
                  _clearAllFields();
                  _startResendTimer();
                },
                _remainingSeconds,
                _isResendEnabled,
              ) ??
              _buildDefaultResendButton(theme),
        ],
      ],
    );
  }

  Widget _buildDefaultResendButton(ThemeData theme) {
    return _isResendEnabled
        ? TextButton(
          onPressed: () {
            widget.onResend?.call();
            _clearAllFields();
            _startResendTimer();
          },
          child: Text(
            'Resend Code',
            style: TextStyle(
              color: theme.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
        : Text(
          'Resend in $_remainingSeconds s',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.disabledColor,
          ),
        );
  }
}
