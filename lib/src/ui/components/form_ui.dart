
part of 'package:flutter_addons/flutter_addons.dart';


//  Reusable UiCheckbox with UiCheckbox.group
class UiCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isDisabled;
  final String? errorText;

  const UiCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isDisabled = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: isDisabled ? null : () => onChanged(!value),
          borderRadius: BorderRadius.circular(6),
          splashColor: theme.primaryColor.withOpacity(0.1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Checkbox(
                value: value,
                onChanged: isDisabled ? null : (val) => onChanged(val!),
                activeColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
              ),
              Text(
                label,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.red),
            ),
          )
      ],
    );
  }

  //  Group version
  static Widget group({
    required List<String> options,
    required List<String> selectedValues,
    required ValueChanged<List<String>> onChanged,
    bool isDisabled = false,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: options.map((option) {
            final isSelected = selectedValues.contains(option);
            return UiCheckbox(
              label: option,
              value: isSelected,
              isDisabled: isDisabled,
              onChanged: (checked) {
                final updated = List<String>.from(selectedValues);
                checked ? updated.add(option) : updated.remove(option);
                onChanged(updated);
              },
            );
          }).toList(),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.red),
            ),
          )
      ],
    );
  }
}

//  Reusable UiRadioButton with UiRadioButton.group
class UiRadioButton<T> extends StatelessWidget {
  final T value;
  final T? groupValue;
  final ValueChanged<T> onChanged;
  final String label;
  final bool isDisabled;
  final String? errorText;

  const UiRadioButton({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
    required this.label,
    this.isDisabled = false,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: isDisabled ? null : () => onChanged(value),
          borderRadius: BorderRadius.circular(20),
          splashColor: theme.primaryColor.withOpacity(0.1),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: isDisabled ? null : (val) => onChanged(val as T),
                activeColor: Colors.blue,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              Text(
                label,
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText!,
              style: theme.textTheme.bodySmall?.copyWith(color: Colors.red),
            ),
          )
      ],
    );
  }

  //  Group version
  static Widget group<T>({
    required List<T> options,
    required T? selectedValue,
    required ValueChanged<T> onChanged,
    required String Function(T value) labelBuilder,
    bool isDisabled = false,
    String? errorText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 12,
          runSpacing: 8,
          children: options.map((option) {
            return UiRadioButton<T>(
              value: option,
              groupValue: selectedValue,
              label: labelBuilder(option),
              onChanged: onChanged,
              isDisabled: isDisabled,
            );
          }).toList(),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              errorText,
              style: const TextStyle(color: Colors.red),
            ),
          )
      ],
    );
  }
}
