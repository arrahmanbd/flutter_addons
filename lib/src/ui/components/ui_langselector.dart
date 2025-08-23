part of 'package:flutter_addons/flutter_addons.dart';

/// A reusable language selection sheet.
/// Shows a list of supported locales and allows selecting one.
class UiLanguageSelectionSheet extends StatelessWidget {
  /// List of supported locales
  final List<Locale> locales;

  /// Currently selected locale
  final Locale currentLocale;

  /// Callback when a locale is selected
  final ValueChanged<Locale> onLocaleSelected;

  /// Optional sheet header text
  final String headerText;

  /// Optional styling
  final TextStyle? headerStyle;
  final Color? backgroundColor;
  final Color? checkIconColor;
  final double? checkIconSize;
  final double borderRadius;

  const UiLanguageSelectionSheet({
    super.key,
    required this.locales,
    required this.currentLocale,
    required this.onLocaleSelected,
    this.headerText = "Select Language",
    this.headerStyle,
    this.backgroundColor,
    this.checkIconColor = Colors.green,
    this.checkIconSize = 20,
    this.borderRadius = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(borderRadius)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Text(
              headerText,
              style: headerStyle ?? Theme.of(context).textTheme.titleMedium,
            ),
          ),
          const Divider(height: 1),

          // List of locales
          ...locales.map(
            (locale) => ListTile(
              title: Text(LanguageUtils.getName(locale)),
              trailing: currentLocale == locale
                  ? Icon(Icons.check, color: checkIconColor, size: checkIconSize)
                  : null,
              onTap: () {
                onLocaleSelected(locale);
                Navigator.pop(context); // Close sheet
              },
            ),
          ),
        ],
      ),
    );
  }
}
