part of 'package:flutter_addons/flutter_addons.dart';

/// A registry of supported languages
class LanguageData {
  static const Map<String, String> languageNames = {
    'en': 'English',
    'bn': 'বাংলা',
    'es': 'Español',
    'fr': 'Français',
    'ar': 'العربية',
    'hi': 'हिन्दी',
    'zh': '中文',
    'ru': 'Русский',
    'ja': '日本語',
    'de': 'Deutsch',
    'pt': 'Português',
    'tr': 'Türkçe',
  };

  /// Get the native name of a language code
  static String getLanguageName(Locale locale) {
    return languageNames[locale.languageCode] ??
        locale.languageCode; // fallback
  }
}
