part of 'package:flutter_addons/flutter_addons.dart';

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

  /// ✅ Default constructor (usable directly)
  const UiTextField({
    super.key,
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
  });

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
    double borderRadius = 8,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 14,
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
      vertical: 14,
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
      borderColor: borderColor,
      borderRadius: borderRadius,
      borderWidth: borderWidth,
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
      style: widget.textStyle,
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
        border: effectiveBorder,
        enabledBorder: effectiveBorder,
        focusedBorder: effectiveBorder,
        disabledBorder: effectiveBorder,
        contentPadding: widget.contentPadding,
        errorText: widget.errorText,
        helperText: widget.helperText,
      ),
    );
  }
}
