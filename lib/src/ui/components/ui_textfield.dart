part of 'package:flutter_addons/flutter_addons.dart';

class UiTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? label;
  final String? hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final TextInputAction? textInputAction;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;
  final InputBorder border;
  final EdgeInsetsGeometry contentPadding;
  final Color? fillColor;
  final bool filled;
  final bool enabled;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final bool autoFocus;
  final int? maxLines;
  final int? minLines;

  const UiTextField._internal({
    super.key,
    this.controller,
    this.label,
    this.hintText,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
    required this.border,
    required this.contentPadding,
    this.fillColor,
    required this.filled,
    this.enabled = true,
    this.textStyle,
    this.hintStyle,
    this.autoFocus = false,
    this.maxLines = 1,
    this.minLines,
  });

  /// Filled variant
  factory UiTextField.filled({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    Color fillColor = const Color(0xFFF5F5F5),
    Color borderColor = Colors.transparent,
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
  }) {
    return UiTextField._internal(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
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
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor),
      ),
    );
  }

  /// Outlined variant
  factory UiTextField.outlined({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    bool obscureText = false,
    TextInputType keyboardType = TextInputType.text,
    TextInputAction? textInputAction,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    Color borderColor = Colors.grey,
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
  }) {
    return UiTextField._internal(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      filled: false,
      fillColor: null,
      contentPadding: contentPadding,
      enabled: enabled,
      textStyle: textStyle,
      hintStyle: hintStyle,
      autoFocus: autoFocus,
      maxLines: maxLines,
      minLines: minLines,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: borderColor),
      ),
    );
  }

  /// Borderless variant
  factory UiTextField.borderless({
    Key? key,
    TextEditingController? controller,
    String? label,
    String? hintText,
    bool obscureText = false,
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
  }) {
    return UiTextField._internal(
      key: key,
      controller: controller,
      label: label,
      hintText: hintText,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      validator: validator,
      filled: false,
      fillColor: null,
      contentPadding: contentPadding,
      enabled: enabled,
      textStyle: textStyle,
      hintStyle: hintStyle,
      autoFocus: autoFocus,
      maxLines: maxLines,
      minLines: minLines,
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
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        hintStyle: widget.hintStyle,
        prefixIcon: widget.prefixIcon,
        suffixIcon:
            widget.obscureText
                ? IconButton(
                  icon: Icon(
                    _obscure ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: () => setState(() => _obscure = !_obscure),
                )
                : widget.suffixIcon,
        filled: widget.filled,
        fillColor: widget.fillColor,
        border: widget.border,
        enabledBorder: widget.border,
        focusedBorder: widget.border,
        disabledBorder: widget.border,
        contentPadding: widget.contentPadding,
      ),
    );
  }
}
