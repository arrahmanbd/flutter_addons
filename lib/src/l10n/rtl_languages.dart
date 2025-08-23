part of 'package:flutter_addons/flutter_addons.dart';

/// List of Right-to-Left (RTL) languages
const rtlLanguages = [
  'ar', // Arabic
  'he', // Hebrew
  'fa', // Persian
  'ur', // Urdu
];

/// Utility function to check if a language is RTL
bool isRtlLanguage(String languageCode) {
  return rtlLanguages.contains(languageCode);
}
