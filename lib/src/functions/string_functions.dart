part of 'package:flutter_addons/flutter_addons.dart';

/// Regular Expression for Alphabet characters
final RegExp alphaRegExp = RegExp(r'^[a-zA-Z]+$');

/// String Extension to add useful utility methods
extension StringExtension on String {
  Uint8List toByteData() {
    // Check if the string contains a Base64 prefix (e.g., 'data:image/png;base64,')
    if (contains(',') && split(',').length > 1) {
      return base64Decode(split(',')[1]);
    } else {
      return base64Decode(
        this,
      ); // If there's no prefix, decode the whole string
    }
  }

  /// Validates if the string is a valid email address.
  bool get isValidEmail {
    final regex = RegExp(Patterns.email);
    return regex.hasMatch(this);
  }

  /// Validates if the string is a valid email address with enhanced checks.
  bool validateEmailEnhanced() => hasMatch(Patterns.emailEnhanced);

  /// Validates if the string is a valid phone number.
  bool validatePhone() => hasMatch(Patterns.phone);

  /// Validates if the string is a valid URL.
  bool validateURL() => hasMatch(Patterns.url);

  /// Returns true if the string is either null or empty.
  bool get isEmptyOrNull => isEmpty || this == 'null';

  /// Returns a default value if the string is null or empty.
  String validate({String value = ''}) => isEmptyOrNull ? value : this;

  /// Checks if the string is a valid image URL.
  bool get isImage => hasMatch(Patterns.image);

  /// Checks if the string is a valid audio URL.
  bool get isAudio => hasMatch(Patterns.audio);

  /// Checks if the string is a valid video URL.
  bool get isVideo => hasMatch(Patterns.video);

  /// Checks if the string is a valid text file URL.
  bool get isTxt => hasMatch(Patterns.txt);

  /// Checks if the string is a valid document URL.
  bool get isDoc => hasMatch(Patterns.doc);

  /// Checks if the string is a valid Excel file URL.
  bool get isExcel => hasMatch(Patterns.excel);

  /// Checks if the string is a valid PowerPoint file URL.
  bool get isPPT => hasMatch(Patterns.ppt);

  /// Checks if the string is a valid APK file URL.
  bool get isApk => hasMatch(Patterns.apk);

  /// Checks if the string is a valid PDF file URL.
  bool get isPdf => hasMatch(Patterns.pdf);

  /// Checks if the string is a valid HTML string.
  bool get isHtml => hasMatch(Patterns.html);

  /// Returns true if the string is a digit.
  bool isDigit() {
    if (validate().isEmpty) return false;
    for (var rune in runes) {
      if (rune ^ 0x30 > 9) return false;
    }
    return true;
  }

  /// Checks if the string is an integer.
  bool get isInt => isDigit();

  /// Checks if the string contains only alphabetic characters.
  bool isAlpha() => alphaRegExp.hasMatch(validate());

  /// Checks if the string is a valid JSON.
  bool isJson() {
    try {
      json.decode(validate());
    } catch (e) {
      return false;
    }
    return true;
  }

  /// Copies the string to clipboard.
  Future<void> copyToClipboard() async {
    await service.Clipboard.setData(service.ClipboardData(text: validate()));
  }

  /// Formats a number in the string with a comma separator (e.g., 1000 -> 1,000).
  String formatNumberWithComma({String separator = ','}) {
    return validate().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}$separator',
    );
  }

  /// Reverses the string.
  String get reverse =>
      validate().isEmpty ? '' : validate().split('').reversed.join();

  /// Converts the string into a list of characters.
  List<String> toList() => validate().trim().split('');

  /// Splits the string after a pattern match.
  String splitAfter(Pattern pattern) {
    var matchIterator = pattern.allMatches(this).iterator;
    if (matchIterator.moveNext()) {
      var match = matchIterator.current;
      return validate().substring(match.end);
    }
    return '';
  }

  /// Splits the string before a pattern match.
  String splitBefore(Pattern pattern) {
    var matchIterator = pattern.allMatches(validate()).iterator;
    Match? match;
    while (matchIterator.moveNext()) {
      match = matchIterator.current;
    }
    return match != null ? validate().substring(0, match.start) : '';
  }

  /// Splits the string between two patterns.
  String splitBetween(Pattern startPattern, Pattern endPattern) {
    return splitAfter(startPattern).splitBefore(endPattern);
  }

  /// Converts the string to an integer with a default value if conversion fails.
  int toInt({int defaultValue = 0}) =>
      isDigit() ? int.parse(this) : defaultValue;

  /// Converts the string to a double with a default value if conversion fails.
  double toDouble({double defaultValue = 0.0}) {
    try {
      return double.parse(this);
    } catch (_) {
      return defaultValue;
    }
  }

  /// Extracts the YouTube video ID from a URL.
  String toYouTubeId({bool trimWhitespaces = true}) {
    String url = validate();
    if (!url.contains('http') && url.length == 11) return url;
    if (trimWhitespaces) url = url.trim();
    for (var exp in [
      RegExp(
        r"^https://(?:www\.|m\.)?youtube\.com/watch\?v=([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(
        r"^https://(?:www\.|m\.)?youtube(?:-nocookie)?\.com/embed/([_\-a-zA-Z0-9]{11}).*$",
      ),
      RegExp(r"^https://youtu\.be/([_\-a-zA-Z0-9]{11}).*$"),
    ]) {
      var match = exp.firstMatch(url);
      if (match != null && match.groupCount >= 1) return match.group(1)!;
    }
    return '';
  }

  /// Returns YouTube thumbnail image URL for the given video ID.
  String getYouTubeThumbnail({bool trimWhitespaces = true}) {
    return 'https://img.youtube.com/vi/${toYouTubeId(trimWhitespaces: trimWhitespaces)}/maxresdefault.jpg';
  }

  /// Removes all whitespace characters from the string.
  String removeAllWhiteSpace() =>
      validate().replaceAll(RegExp(r"\s+\b|\b\s"), "");

  /// Returns only numeric characters from the string.
  String getNumericOnly({bool aFirstWordOnly = false}) {
    return validate().replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Repeats the string `n` times, optionally with a separator.
  String repeat(int n, {String separator = ''}) {
    if (n < 0) throw ArgumentError('n must be a positive value greater than 0');
    return List.generate(
      n,
      (i) => (i > 0 ? separator : '') + validate(),
    ).join();
  }

  /// Renders HTML encoded string to a plain text representation.
  String get renderHtml {
    return replaceAll('&ensp;', ' ')
        .replaceAll('&nbsp;', ' ')
        .replaceAll('&emsp;', ' ')
        .replaceAll('<br>', '\n')
        .replaceAll('<br/>', '\n')
        .replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>');
  }

  /// Calculates the average reading time in seconds based on word count and words per minute.
  double calculateReadTime({int wordsPerMinute = 200}) {
    return countWords() / wordsPerMinute;
  }

  /// Returns the number of words in the string.
  int countWords() {
    return validate().trim().split(RegExp(r'\s+')).length;
  }

  /// Generates a URL-friendly slug from the string.
  String toSlug({String delimiter = '_'}) {
    return validate().trim().toLowerCase().replaceAll(' ', delimiter);
  }

  /// Returns a list of search parameters to store for Firebase queries.
  List<String> setSearchParam() {
    String word = validate();
    List<String> caseSearchList = [];
    String temp = '';
    for (int i = 0; i < word.length; i++) {
      temp += word[i];
      caseSearchList.add(temp.toLowerCase());
    }
    return caseSearchList;
  }

  /// Converts the string to a boolean value based on 'true' or 'false' string.
  bool toBool() => validate().toLowerCase() == 'true';

  /// Adds a prefix to the string.
  String prefixText({required String value}) => '$value$this';

  /// Adds a suffix to the string.
  String suffixText({required String value}) => '$this$value';

  /// Strips out the non-alphanumeric characters from the string.
  String stripNonAlphaNumeric() =>
      validate().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');

  /// Replaces all non-alphanumeric characters with underscores.
  String replaceNonAlphaNumericWithUnderscore() =>
      validate().replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_');

  Color getColorFromHex() {
    // Regular expression for validating hex color code
    final hexRegex = RegExp(r'^#?([0-9A-Fa-f]{6}|[0-9A-Fa-f]{8})$');

    // If the string doesn't match the regex pattern, throw an exception
    if (!hexRegex.hasMatch(this)) {
      throw FormatException('Invalid Hex color code');
    }

    // Remove the '#' if it exists
    String hexColor = replaceAll('#', '');

    // Parse the color from the hex string
    int colorValue = int.parse(hexColor, radix: 16);

    // If it's a 6-character hex code, add full opacity (0xFF)
    if (hexColor.length == 6) {
      colorValue = 0xFF000000 | colorValue; // 0xFF is for full opacity
    }

    return Color(colorValue);
  }
}
