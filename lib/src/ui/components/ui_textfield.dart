// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

/// A modern, customizable text field component with extensive styling options
/// and built-in functionality like password visibility toggle.
class UiTextField extends StatefulWidget {
  /// Controller for the text field
  final TextEditingController? controller;

  /// Label text displayed above the field
  final String? label;

  /// Hint text displayed when the field is empty
  final String? hintText;

  /// Whether the text should be obscured (for passwords)
  final bool obscureText;

  /// Whether to show toggle button for password visibility
  final bool enableObscureToggle;

  /// Keyboard type for the text input
  final TextInputType keyboardType;

  /// Action button on the keyboard
  final TextInputAction? textInputAction;

  /// Icon displayed before the input text
  final Widget? prefixIcon;

  /// Icon displayed after the input text
  final Widget? suffixIcon;

  /// Constraints for the prefix icon
  final BoxConstraints? prefixIconConstraints;

  /// Constraints for the suffix icon
  final BoxConstraints? suffixIconConstraints;

  /// Validation function for the input
  final String? Function(String?)? validator;

  /// Custom border configuration
  final InputBorder? border;

  /// Padding around the content
  final EdgeInsetsGeometry? contentPadding;

  /// Background color of the text field
  final Color? fillColor;

  /// Whether the text field should be filled with color
  final bool filled;

  /// Whether the text field is enabled
  final bool enabled;

  /// Style for the input text
  final TextStyle? textStyle;

  /// Style for the hint text
  final TextStyle? hintStyle;

  /// Style for the label text
  final TextStyle? labelStyle;

  /// Style for the error text
  final TextStyle? errorStyle;

  /// Style for the helper text
  final TextStyle? helperStyle;

  /// Behavior of the floating label
  final FloatingLabelBehavior floatingLabelBehavior;

  /// Whether the field should be focused automatically
  final bool autoFocus;

  /// Maximum number of lines for the input
  final int? maxLines;

  /// Minimum number of lines for the input
  final int? minLines;

  /// Input formatters for the text
  final List<TextInputFormatter>? inputFormatters;

  /// Custom error text
  final String? errorText;

  /// Helper text displayed below the field
  final String? helperText;

  /// Focus node for the text field
  final FocusNode? focusNode;

  /// Icon for obscured text state
  final IconData obscureIcon;

  /// Icon for visible text state
  final IconData visibleIcon;

  /// Border radius for the text field
  final double borderRadius;

  /// Color of the border
  final Color borderColor;

  /// Width of the border
  final double borderWidth;

  /// Custom border configuration
  final UiTextFieldBorder? borderConfig;

  /// Callback when the text changes
  final ValueChanged<String>? onChanged;

  /// Callback when editing is complete
  final VoidCallback? onEditingComplete;

  /// Callback when the field is submitted
  final ValueChanged<String>? onSubmitted;

  /// Callback when the field is tapped
  final GestureTapCallback? onTap;

  /// Whether the field should automatically correct input
  final bool autocorrect;

  /// Whether to enable suggestions
  final bool enableSuggestions;

  /// Style for the counter text
  final TextStyle? counterStyle;

  /// Maximum number of characters allowed
  final int? maxLength;

  /// Whether to show character counter
  final bool showCounter;

  /// Cursor color
  final Color? cursorColor;

  /// Cursor width
  final double? cursorWidth;

  /// Cursor height
  final double? cursorHeight;

  /// Radius of the cursor corners
  final Radius? cursorRadius;

  /// Selection controls enabled
  final bool enableInteractiveSelection;

  /// Build counter widget
  final InputCounterWidgetBuilder? buildCounter;

  /// Creates a modern, customizable text field
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
    this.prefixIconConstraints,
    this.suffixIconConstraints,
    this.validator,
    this.border,
    this.contentPadding,
    this.fillColor,
    this.filled = true,
    this.enabled = true,
    this.textStyle,
    this.hintStyle,
    this.labelStyle,
    this.errorStyle,
    this.helperStyle,
    this.floatingLabelBehavior = FloatingLabelBehavior.auto,
    this.autoFocus = false,
    this.maxLines = 1,
    this.minLines,
    this.inputFormatters,
    this.errorText,
    this.helperText,
    this.focusNode,
    this.obscureIcon = Icons.visibility_off,
    this.visibleIcon = Icons.visibility,
    this.borderRadius = 12.0,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0,
    this.borderConfig,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
    this.onTap,
    this.autocorrect = true,
    this.enableSuggestions = true,
    this.counterStyle,
    this.maxLength,
    this.showCounter = false,
    this.cursorColor,
    this.cursorWidth = 2.0,
    this.cursorHeight,
    this.cursorRadius,
    this.enableInteractiveSelection = true,
    this.buildCounter,
  });

  @override
  State<UiTextField> createState() => _UiTextFieldState();
}

class _UiTextFieldState extends State<UiTextField> {
  late bool _obscureText;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _controller = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return TextFormField(
      controller: _controller,
      obscureText: _obscureText,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      autofocus: widget.autoFocus,
      enabled: widget.enabled,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      inputFormatters: widget.inputFormatters,
      autocorrect: widget.autocorrect,
      enableSuggestions: widget.enableSuggestions,
      cursorColor: widget.cursorColor ?? colorScheme.primary,
      cursorWidth: widget.cursorWidth ?? 2.0,
      cursorHeight: widget.cursorHeight,
      cursorRadius: widget.cursorRadius,
      enableInteractiveSelection: widget.enableInteractiveSelection,
      buildCounter: widget.buildCounter,
      onChanged: widget.onChanged,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: widget.onSubmitted,
      onTap: widget.onTap,
      validator: widget.validator,
      style: widget.textStyle ?? theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        labelText: widget.label,
        hintText: widget.hintText,
        prefixIcon: widget.prefixIcon,
        suffixIcon: _buildSuffixIcon(),
        prefixIconConstraints: widget.prefixIconConstraints,
        suffixIconConstraints: widget.suffixIconConstraints,
        border: widget.border ?? _buildDefaultBorder(),
        enabledBorder:
            widget.borderConfig?.enabledBorder ?? _buildDefaultBorder(),
        focusedBorder:
            widget.borderConfig?.focusedBorder ?? _buildFocusedBorder(),
        errorBorder: widget.borderConfig?.errorBorder ?? _buildErrorBorder(),
        focusedErrorBorder:
            widget.borderConfig?.focusedErrorBorder ?? _buildErrorBorder(),
        disabledBorder:
            widget.borderConfig?.disabledBorder ?? _buildDefaultBorder(),
        contentPadding: widget.contentPadding ?? const EdgeInsets.all(16.0),
        fillColor: widget.fillColor ?? theme.cardColor,
        filled: widget.filled,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        hintStyle:
            widget.hintStyle ??
            theme.textTheme.bodyMedium?.copyWith(color: theme.hintColor),
        labelStyle: widget.labelStyle ?? theme.textTheme.bodyMedium,
        errorStyle:
            widget.errorStyle ??
            theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.error),
        helperStyle: widget.helperStyle ?? theme.textTheme.bodySmall,
        errorText: widget.errorText,
        helperText: widget.helperText,
        counterStyle: widget.counterStyle,
        counterText: widget.showCounter ? null : '',
      ),
    );
  }

  Widget? _buildSuffixIcon() {
    if (widget.enableObscureToggle && widget.obscureText) {
      return IconButton(
        icon: Icon(
          _obscureText ? widget.obscureIcon : widget.visibleIcon,
          color: Theme.of(context).hintColor,
        ),
        onPressed: () {
          setState(() {
            _obscureText = !_obscureText;
          });
        },
      );
    }
    return widget.suffixIcon;
  }

  InputBorder _buildDefaultBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: widget.borderColor,
        width: widget.borderWidth,
      ),
    );
  }

  InputBorder _buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.primary,
        width: widget.borderWidth * 1.5,
      ),
    );
  }

  InputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.borderRadius),
      borderSide: BorderSide(
        color: Theme.of(context).colorScheme.error,
        width: widget.borderWidth,
      ),
    );
  }
}

/// Configuration class for customizing text field borders
class UiTextFieldBorder {
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final InputBorder? focusedErrorBorder;
  final InputBorder? disabledBorder;

  const UiTextFieldBorder({
    this.enabledBorder,
    this.focusedBorder,
    this.errorBorder,
    this.focusedErrorBorder,
    this.disabledBorder,
  });
}

/// Model class to configure TextField borders easily
// class UiTextFieldBorder {
//   /// Default border color
//   final Color color;

//   /// Border width
//   final double width;

//   /// Border radius
//   final double radius;

//   /// Color when focused
//   final Color focusedColor;

//   /// Width when focused
//   final double focusedWidth;

//   /// Color when error occurs
//   final Color errorColor;

//   /// Optional disabled color
//   final Color? disabledColor;

//   const UiTextFieldBorder({
//     this.color = const Color(0xFFD0D7DE),
//     this.width = 1,
//     this.radius = 6,
//     this.focusedColor = const Color(0xFF0969DA),
//     this.focusedWidth = 1.2,
//     this.errorColor = Colors.red,
//     this.disabledColor,
//   });

//   OutlineInputBorder _build(Color c, double w) => OutlineInputBorder(
//         borderRadius: BorderRadius.circular(radius),
//         borderSide: BorderSide(color: c, width: w),
//       );

//   OutlineInputBorder get enabled => _build(color, width);
//   OutlineInputBorder get focused => _build(focusedColor, focusedWidth);
//   OutlineInputBorder get error => _build(errorColor, width);
//   OutlineInputBorder get disabled =>
//       _build(disabledColor ?? color.withValues(alpha:0.5), width);
// }

// class UiTextField extends StatefulWidget {
//   final TextEditingController? controller;
//   final String? label;
//   final String? hintText;
//   final bool obscureText;
//   final bool enableObscureToggle;
//   final TextInputType keyboardType;
//   final TextInputAction? textInputAction;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final BoxConstraints? prefixConstraints;
//   final BoxConstraints? suffixConstraints;
//   final String? Function(String?)? validator;
//   final InputBorder? border;
//   final EdgeInsetsGeometry? contentPadding;
//   final Color? fillColor;
//   final bool filled;
//   final bool enabled;
//   final TextStyle? textStyle;
//   final TextStyle? hintStyle;
//   final TextStyle? labelStyle;
//   final TextStyle? errorStyle;
//   final TextStyle? helperStyle;
//   final FloatingLabelBehavior floatingLabelBehavior;
//   final bool autoFocus;
//   final int? maxLines;
//   final int? minLines;
//   final List<TextInputFormatter>? inputFormatters;
//   final String? errorText;
//   final String? helperText;
//   final FocusNode? focusNode;
//   final IconData obscureIcon;
//   final IconData visibleIcon;
//   final double borderRadius;
//   final Color borderColor;
//   final double borderWidth;
//   final UiTextFieldBorder? borderConfig;

//   const UiTextField({
//     Key? key,
//     this.controller,
//     this.label,
//     this.hintText,
//     this.obscureText = false,
//     this.enableObscureToggle = false,
//     this.keyboardType = TextInputType.text,
//     this.textInputAction,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.prefixConstraints,
//     this.suffixConstraints,
//     this.validator,
//     this.border,
//     this.contentPadding,
//     this.fillColor,
//     this.filled = false,
//     this.enabled = true,
//     this.textStyle,
//     this.hintStyle,
//     this.labelStyle,
//     this.errorStyle,
//     this.helperStyle,
//     this.floatingLabelBehavior = FloatingLabelBehavior.auto,
//     this.autoFocus = false,
//     this.maxLines = 1,
//     this.minLines,
//     this.inputFormatters,
//     this.errorText,
//     this.helperText,
//     this.focusNode,
//     this.obscureIcon = Icons.visibility_off,
//     this.visibleIcon = Icons.visibility,
//     this.borderRadius = 8,
//     this.borderColor = Colors.grey,
//     this.borderWidth = 1,
//     this.borderConfig,
//   }) : super(key: key);

//   /// ✅ Filled variant
//   factory UiTextField.filled({
//     Key? key,
//     TextEditingController? controller,
//     String? label,
//     String? hintText,
//     bool obscureText = false,
//     bool enableObscureToggle = false,
//     TextInputType keyboardType = TextInputType.text,
//     TextInputAction? textInputAction,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     BoxConstraints? prefixConstraints,
//     BoxConstraints? suffixConstraints,
//     String? Function(String?)? validator,
//     Color fillColor = const Color(0xFFF5F5F5),
//     Color borderColor = Colors.transparent,
//     UiTextFieldBorder? borderConfig,
//     double borderRadius = 8,
//     EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
//       horizontal: 16,
//       vertical: 8,
//     ),
//     bool enabled = true,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     TextStyle? labelStyle,
//     TextStyle? errorStyle,
//     TextStyle? helperStyle,
//     bool autoFocus = false,
//     int? maxLines = 1,
//     int? minLines,
//     List<TextInputFormatter>? inputFormatters,
//     String? errorText,
//     String? helperText,
//     FocusNode? focusNode,
//   }) {
//     return UiTextField(
//       key: key,
//       controller: controller,
//       label: label,
//       hintText: hintText,
//       obscureText: obscureText,
//       enableObscureToggle: enableObscureToggle,
//       keyboardType: keyboardType,
//       textInputAction: textInputAction,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       prefixConstraints: prefixConstraints,
//       suffixConstraints: suffixConstraints,
//       validator: validator,
//       filled: true,
//       fillColor: fillColor,
//       contentPadding: contentPadding,
//       enabled: enabled,
//       textStyle: textStyle,
//       hintStyle: hintStyle,
//       labelStyle: labelStyle,
//       errorStyle: errorStyle,
//       helperStyle: helperStyle,
//       autoFocus: autoFocus,
//       maxLines: maxLines,
//       minLines: minLines,
//       inputFormatters: inputFormatters,
//       errorText: errorText,
//       helperText: helperText,
//       focusNode: focusNode,
//       borderColor: borderColor,
//       borderRadius: borderRadius,
//       borderWidth: 1,
//       borderConfig:
//           borderConfig ??
//           UiTextFieldBorder(color: borderColor, radius: borderRadius, width: 1),
//     );
//   }

//   /// ✅ Outlined variant
//   factory UiTextField.outlined({
//     Key? key,
//     TextEditingController? controller,
//     String? label,
//     String? hintText,
//     bool obscureText = false,
//     bool enableObscureToggle = false,
//     TextInputType keyboardType = TextInputType.text,
//     TextInputAction? textInputAction,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     BoxConstraints? prefixConstraints,
//     BoxConstraints? suffixConstraints,
//     String? Function(String?)? validator,
//     Color borderColor = Colors.grey,
//     double borderRadius = 8,
//     double borderWidth = 1,
//     EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
//       horizontal: 16,
//       vertical: 8,
//     ),
//     bool enabled = true,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     TextStyle? labelStyle,
//     TextStyle? errorStyle,
//     TextStyle? helperStyle,
//     bool autoFocus = false,
//     int? maxLines = 1,
//     int? minLines,
//     List<TextInputFormatter>? inputFormatters,
//     String? errorText,
//     String? helperText,
//     FocusNode? focusNode,
//     UiTextFieldBorder? borderConfig,
//   }) {
//     return UiTextField(
//       key: key,
//       controller: controller,
//       label: label,
//       hintText: hintText,
//       obscureText: obscureText,
//       enableObscureToggle: enableObscureToggle,
//       keyboardType: keyboardType,
//       textInputAction: textInputAction,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       prefixConstraints: prefixConstraints,
//       suffixConstraints: suffixConstraints,
//       validator: validator,
//       filled: false,
//       contentPadding: contentPadding,
//       enabled: enabled,
//       textStyle: textStyle,
//       hintStyle: hintStyle,
//       labelStyle: labelStyle,
//       errorStyle: errorStyle,
//       helperStyle: helperStyle,
//       autoFocus: autoFocus,
//       maxLines: maxLines,
//       minLines: minLines,
//       inputFormatters: inputFormatters,
//       errorText: errorText,
//       helperText: helperText,
//       focusNode: focusNode,
//       borderColor: borderColor,
//       borderRadius: borderRadius,
//       borderWidth: borderWidth,
//       borderConfig: borderConfig ??
//           UiTextFieldBorder(
//             color: borderColor,
//             radius: borderRadius,
//             width: borderWidth,
//           ),
//     );
//   }

//   /// ✅ Borderless variant
//   factory UiTextField.borderless({
//     Key? key,
//     TextEditingController? controller,
//     String? label,
//     String? hintText,
//     bool obscureText = false,
//     bool enableObscureToggle = false,
//     TextInputType keyboardType = TextInputType.text,
//     TextInputAction? textInputAction,
//     Widget? prefixIcon,
//     Widget? suffixIcon,
//     BoxConstraints? prefixConstraints,
//     BoxConstraints? suffixConstraints,
//     String? Function(String?)? validator,
//     EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
//       horizontal: 0,
//       vertical: 12,
//     ),
//     bool enabled = true,
//     TextStyle? textStyle,
//     TextStyle? hintStyle,
//     TextStyle? labelStyle,
//     TextStyle? errorStyle,
//     TextStyle? helperStyle,
//     bool autoFocus = false,
//     int? maxLines = 1,
//     int? minLines,
//     List<TextInputFormatter>? inputFormatters,
//     String? errorText,
//     String? helperText,
//     FocusNode? focusNode,
//   }) {
//     return UiTextField(
//       key: key,
//       controller: controller,
//       label: label,
//       hintText: hintText,
//       obscureText: obscureText,
//       enableObscureToggle: enableObscureToggle,
//       keyboardType: keyboardType,
//       textInputAction: textInputAction,
//       prefixIcon: prefixIcon,
//       suffixIcon: suffixIcon,
//       prefixConstraints: prefixConstraints,
//       suffixConstraints: suffixConstraints,
//       validator: validator,
//       filled: false,
//       contentPadding: contentPadding,
//       enabled: enabled,
//       textStyle: textStyle,
//       hintStyle: hintStyle,
//       labelStyle: labelStyle,
//       errorStyle: errorStyle,
//       helperStyle: helperStyle,
//       autoFocus: autoFocus,
//       maxLines: maxLines,
//       minLines: minLines,
//       inputFormatters: inputFormatters,
//       errorText: errorText,
//       helperText: helperText,
//       focusNode: focusNode,
//       border: InputBorder.none,
//     );
//   }

//   @override
//   State<UiTextField> createState() => _UiTextFieldState();
// }

// class _UiTextFieldState extends State<UiTextField> {
//   late bool _obscure;

//   @override
//   void initState() {
//     super.initState();
//     _obscure = widget.obscureText;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final effectiveBorder = widget.border ??
//         OutlineInputBorder(
//           borderRadius: BorderRadius.circular(widget.borderRadius),
//           borderSide: BorderSide(
//             color: widget.borderColor,
//             width: widget.borderWidth,
//           ),
//         );

//     return TextFormField(
//       controller: widget.controller,
//       obscureText: _obscure,
//       keyboardType: widget.keyboardType,
//       textInputAction: widget.textInputAction,
//       validator: widget.validator,
//       enabled: widget.enabled,
//       autofocus: widget.autoFocus,
//       maxLines: widget.obscureText ? 1 : widget.maxLines,
//       minLines: widget.obscureText ? 1 : widget.minLines,
//       style: widget.textStyle ?? const TextStyle(fontSize: 16),
//       inputFormatters: widget.inputFormatters,
//       focusNode: widget.focusNode,
//       decoration: InputDecoration(
//         labelText: widget.label,
//         labelStyle: widget.labelStyle ??
//             TextStyle(
//               color: widget.borderConfig?.focusedColor ??
//                   Theme.of(context).primaryColor,
//               fontSize: 14,
//             ),
//         floatingLabelBehavior: widget.floatingLabelBehavior,
//         hintText: widget.hintText,
//         hintStyle: widget.hintStyle,
//         prefixIcon: widget.prefixIcon,
//         suffixIcon: widget.enableObscureToggle
//             ? IconButton(
//                 icon: Icon(
//                     _obscure ? widget.obscureIcon : widget.visibleIcon),
//                 onPressed: () => setState(() => _obscure = !_obscure),
//               )
//             : widget.suffixIcon,
//         prefixIconConstraints: widget.prefixConstraints,
//         suffixIconConstraints: widget.suffixConstraints,
//         filled: widget.filled,
//         fillColor: widget.fillColor,
//         border: widget.borderConfig?.enabled ?? effectiveBorder,
//         enabledBorder: widget.borderConfig?.enabled ?? effectiveBorder,
//         focusedBorder: widget.borderConfig?.focused ?? effectiveBorder,
//         errorBorder: widget.borderConfig?.error ?? effectiveBorder,
//         focusedErrorBorder:
//             widget.borderConfig?.focused ?? effectiveBorder,
//         disabledBorder: widget.borderConfig?.disabled ?? effectiveBorder,
//         contentPadding: widget.contentPadding,
//         errorText: widget.errorText,
//         helperText: widget.helperText,
//         errorStyle: widget.errorStyle ??
//             TextStyle(
//               color: widget.borderConfig?.errorColor ?? Colors.red,
//               fontSize: 12,
//             ),
//         helperStyle: widget.helperStyle ??
//             TextStyle(
//               color: Theme.of(context).hintColor,
//               fontSize: 12,
//             ),
//       ),
//     );
//   }
// }
