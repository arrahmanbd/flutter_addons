// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

/// Model class to configure TextField borders easily
class UiTextFieldBorder {
  /// Default border color
  final Color color;

  /// Border width
  final double width;

  /// Border radius
  final double radius;

  /// Color when focused
  final Color focusedColor;

  /// Color when error occurs
  final Color errorColor;

  /// Optional disabled color
  final Color? disabledColor;

  const UiTextFieldBorder({
    this.color = const Color(0xFFD0D7DE),
    this.width = 1,
    this.radius = 6,
    this.focusedColor = const Color(0xFF0969DA),
    this.errorColor = Colors.red,
    this.disabledColor,
  });

  /// Returns normal enabled border
  OutlineInputBorder get enabled => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: color, width: width),
  );

  /// Returns focused border
  OutlineInputBorder get focused => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: focusedColor, width: width),
  );

  /// Returns error border
  OutlineInputBorder get error => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(color: errorColor, width: width),
  );

  /// Returns disabled border
  OutlineInputBorder get disabled => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius),
    borderSide: BorderSide(
      color: disabledColor ?? color.withValues(alpha: 0.5),
      width: width,
    ),
  );
}

class UiTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final bool enableObscureToggle;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final InputBorder? border;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final bool filled;
  final bool enabled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool autoFocus;
  final int? maxLines;
  final int? minLines;
  final List<TextInputFormatter>? inputFormatters;
  final String? errorText;
  final String? helperText;
  final FocusNode? focusNode;
  final IconData obscureIcon;
  final IconData visibleIcon;
  final double borderRadius;
  final Color borderColor;
  final double borderWidth;
  final UiTextFieldBorder? borderConfig;

  /// ✅ Default constructor (usable directly)
  const UiTextField({
    Key? key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.enableObscureToggle = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    this.border,
    this.contentPadding,
    this.fillColor,
    this.filled = false,
    this.enabled = true,
    this.textStyle,
    this.hintStyle,
    this.autoFocus = false,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.errorText,
    this.helperText,
    this.focusNode,
    this.obscureIcon = Icons.visibility_off,
    this.visibleIcon = Icons.visibility,
    this.borderRadius = 8,
    this.borderColor = Colors.grey,
    this.borderWidth = 1,
    this.borderConfig,
  }) : super(key: key);

  /// ✅ Filled variant
  factory UiTextField.filled({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    bool obscureText = false,
    bool enableObscureToggle = false,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    Color fillColor = const Color(0xFFF5F5F5),
    Color borderColor = Colors.transparent,
    UiTextFieldBorder? borderConfig,
    double borderRadius = 8,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    bool enabled = true,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    bool autoFocus = false,
    int? maxLines = 1,
    int? minLines,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    String? helperText,
    FocusNode? focusNode,
  }) {
    return UiTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
      enableObscureToggle: enableObscureToggle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      filled: true,
      fillColor: fillColor,
      contentPadding: contentPadding,
      enabled: enabled,
      textStyle: textStyle,
      hintStyle: hintStyle,
      autoFocus: autoFocus,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      errorText: errorText,
      helperText: helperText,
      focusNode: focusNode,
      borderColor: borderColor,
      borderRadius: borderRadius,
      borderWidth: 1,
      borderConfig:
          borderConfig ??
          UiTextFieldBorder(color: borderColor, radius: borderRadius, width: 1),
    );
  }

  /// ✅ Outlined variant
  factory UiTextField.outlined({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    bool obscureText = false,
    bool enableObscureToggle = false,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    Color borderColor = Colors.grey,
    double borderRadius = 8,
    double borderWidth = 1,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 8,
    ),
    bool enabled = true,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    bool autoFocus = false,
    int? maxLines = 1,
    int? minLines,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    String? helperText,
    FocusNode? focusNode,
    UiTextFieldBorder? borderConfig,
  }) {
    return UiTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
      enableObscureToggle: enableObscureToggle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      filled: false,
      contentPadding: contentPadding,
      enabled: enabled,
      textStyle: textStyle,
      hintStyle: hintStyle,
      autoFocus: autoFocus,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      errorText: errorText,
      helperText: helperText,
      focusNode: focusNode,
      borderColor: borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
      borderConfig:
          borderConfig ??
          UiTextFieldBorder(
            color: borderColor,
            radius: borderRadius,
            width: borderWidth,
          ),
    );
  }

  /// ✅ Borderless variant
  factory UiTextField.borderless({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    bool obscureText = false,
    bool enableObscureToggle = false,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 12,
    ),
    bool enabled = true,
    TextStyle? textStyle,
    TextStyle? hintStyle,
    bool autoFocus = false,
    int? maxLines = 1,
    int? minLines,
    List<TextInputFormatter>? inputFormatters,
    String? errorText,
    String? helperText,
    FocusNode? focusNode,
  }) {
    return UiTextField(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
      enableObscureToggle: enableObscureToggle,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      filled: false,
      contentPadding: contentPadding,
      enabled: enabled,
      textStyle: textStyle,
      hintStyle: hintStyle,
      autoFocus: autoFocus,
      maxLines: maxLines,
      minLines: minLines,
      inputFormatters: inputFormatters,
      errorText: errorText,
      helperText: helperText,
      focusNode: focusNode,
      border: InputBorder.none,
    );
  }

  @override
  State<UiTextField> createState() => _UiTextFieldState();
}

class _UiTextFieldState extends State<UiTextField> {
  late bool _obscure;

  @override
  void initState() {
    super.initState();
    _obscure = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    final effectiveBorder =
        widget.border ??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
        );

    return TextFormField(
      controller: widget.controller,
      obscureText: _obscure,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      validator: widget.validator,
      enabled: widget.enabled,
      autofocus: widget.autoFocus,
      maxLines: widget.obscureText ? 1 : widget.maxLines,
      minLines: widget.obscureText ? 1 : widget.minLines,
      style: widget.textStyle?? TextStyle(
        fontSize: 16,
      ),
      inputFormatters: widget.inputFormatters,
      focusNode: widget.focusNode,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.enableObscureToggle
                ? IconButton(
                  icon: Icon(
                    _obscure ? widget.obscureIcon : widget.visibleIcon,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
                : widget.suffixIcon,
        filled: widget.filled,
        fillColor: widget.fillColor,
        border: widget.borderConfig?.enabled ?? effectiveBorder,
        enabledBorder: widget.borderConfig?.enabled ?? effectiveBorder,
        focusedBorder: widget.borderConfig?.focused ?? effectiveBorder,
        errorBorder: widget.borderConfig?.error ?? effectiveBorder,
        focusedErrorBorder: widget.borderConfig?.focused ?? effectiveBorder,
        disabledBorder: widget.borderConfig?.disabled ?? effectiveBorder,
        contentPadding: widget.contentPadding,
        errorText: widget.errorText,
        helperText: widget.helperText,
        errorStyle: TextStyle(
          color: widget.borderConfig?.errorColor ?? Colors.red,
          fontSize: 12,
        ),
        labelStyle: TextStyle(
          color: widget.borderConfig?.focusedColor ?? Colors.blue,
          fontSize: 14,
        ),
        helperStyle: TextStyle(
          color: widget.borderConfig?.focusedColor ?? Colors.blue,
          fontSize: 12,
        ),
        
      ),
    );
  }
}
