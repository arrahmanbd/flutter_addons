part of 'package:flutter_addons/flutter_addons.dart';

//This is cool 😎
// I love music and cool vibes!
// "I ❤️ 🎵 and 😎 vibes!"
extension EmojiExtension on String {
  /// Returns `true` if the string contains any emoji
  bool get containsEmoji {
    final emojiRegex = RegExp(
      r'[\u{1F600}-\u{1F64F}' // Emoticons
      r'\u{1F300}-\u{1F5FF}' // Symbols & pictographs
      r'\u{1F680}-\u{1F6FF}' // Transport & map symbols
      r'\u{1F700}-\u{1F77F}' // Alchemical symbols
      r'\u{1F780}-\u{1F7FF}' // Geometric symbols
      r'\u{1F800}-\u{1F8FF}' // Supplemental arrows
      r'\u{1F900}-\u{1F9FF}' // Supplemental symbols and pictographs
      r'\u{1FA00}-\u{1FA6F}' // Chess symbols
      r'\u{1FA70}-\u{1FAFF}' // More symbols
      r']',
      unicode: true,
    );
    return emojiRegex.hasMatch(this);
  }

  /// Replaces common words with emojis
  String get toEmoji {
    final Map<String, String> emojiMap = {
      "love": "❤️",
      "happy": "😊",
      "sad": "😢",
      "cool": "😎",
      "fire": "🔥",
      "music": "🎵",
      "star": "⭐",
      "ok": "👌",
      "thumbs up": "👍",
      "heart": "💖",
    };

    String updatedText = this;
    emojiMap.forEach((key, emoji) {
      updatedText = updatedText.replaceAll(
        RegExp('\\b$key\\b', caseSensitive: false),
        emoji,
      );
    });

    return updatedText;
  }
}
