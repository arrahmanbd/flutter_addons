part of 'package:flutter_addons/flutter_addons.dart';

class UiDropdown<T> extends StatelessWidget {
  final List<DropdownMenuItem<T>> items;
  final T? value;
  final void Function(T?)? onChanged;
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final bool isDense;
  final bool isExpanded;
  final bool enabled;
  final Widget? prefixIcon;

  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? shadowColor;

  const UiDropdown({
    super.key,
    required this.items,
    required this.value,
    required this.onChanged,
    this.hintText,
    this.labelText,
    this.errorText,
    this.isDense = true,
    this.isExpanded = true,
    this.enabled = true,
    this.prefixIcon,
    this.padding = const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    this.borderRadius = 12.0,
    this.backgroundColor,
    this.borderColor,
    this.shadowColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 6.0),
            child: Text(
              labelText!,
              style: theme.textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor ?? theme.cardColor,
            borderRadius: BorderRadius.circular(borderRadius),
            border: Border.all(
              color:
                  borderColor ??
                  (errorText != null
                      ? theme.colorScheme.error
                      : theme.dividerColor),
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? Colors.black.withValues(alpha: 0.05),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Padding(
            padding: padding,
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: value,
                items: items,
                onChanged: enabled ? onChanged : null,
                isDense: isDense,
                isExpanded: isExpanded,
                icon: const Icon(Icons.keyboard_arrow_down),
                hint: hintText != null ? Text(hintText!) : null,
                style: theme.textTheme.bodyMedium,
                disabledHint: value != null ? Text(value.toString()) : null,
              ),
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: Text(
              errorText!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ),
      ],
    );
  }
}
