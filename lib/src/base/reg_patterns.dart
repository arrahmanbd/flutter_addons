part of 'package:flutter_addons/flutter_addons.dart';

/// Predefined Patterns for different validation
class Patterns {
  static String url =
      r'^(https?|ftp):\/\/[a-zA-Z0-9\-\.]+(?:\.[a-zA-Z]{2,})(?::\d{1,5})?(?:\/[^\s?#]*)?(?:\?[^\s#]*)?(?:#[^\s]*)?$';

  static String phone = r'(^(?:[+0]9)?[0-9]{10,12}$)';

  static String email =
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  static String validIPv4 =
      r'^(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])'
      r'(\.(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])){3}$';
  static String emailEnhanced =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';

  static String image = r'.(jpeg|jpg|gif|png|bmp)$';

  /// Audio regex
  static String audio = r'.(mp3|wav|wma|amr|ogg|opus|aac|flac|alac)$';

  /// Video regex
  static String video =
      r'.(mp4|avi|wmv|rmvb|mpg|mpeg|3gp|mkv|webm|flv|ogg|ogv)$';

  /// Txt regex
  static String txt = r'.txt$';

  /// Document regex
  static String doc = r'.(doc|docx)$';

  /// Excel regex
  static String excel = r'.(xls|xlsx)$';

  /// PPT regex
  static String ppt = r'.(ppt|pptx)$';

  /// Document regex
  static String apk = r'.apk$';

  /// PDF regex
  static String pdf = r'.pdf$';

  /// HTML regex
  static String html = r'.html$';

  /// Zip/Compressed Files regex
  static String zip = r'.(zip|rar|tar|gz|7z)$';

  /// IP Address regex
  static String ipAddress =
      r'^(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.('
      r'25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.('
      r'25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.('
      r'25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$';

  /// Date regex (YYYY-MM-DD)
  static String date =
      r'^(19|20)\d\d-(0[1-9]|1[0-2])-(0[1-9]|[12][0-9]|3[01])$';

  /// Time regex (HH:MM:SS)
  static String time = r'^([01]?[0-9]|2[0-3]):([0-5]?[0-9]):([0-5]?[0-9])$';

  /// Credit Card regex (Visa, MasterCard, AMEX, Discover)
  static String creditCard =
      r'^(?:4[0-9]{12}(?:[0-9]{3})?|5[1-5][0-9]{14}|6(?:011|5[0-9]{2})[0-9]{12}|3[47][0-9]{13}|(?:2131|1800|35\d{3})\d{11})$';

  /// Password (at least 8 characters, 1 uppercase, 1 number, 1 special character)
  static String password =
      r'^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  /// MAC Address regex
  static String macAddress = r'([0-9A-Fa-f]{2}[:|-]?){5}([0-9A-Fa-f]{2})$';

  /// ISBN-10 regex
  static String isbn10 = r'^\d{9}[\d|X]$';

  /// ISBN-13 regex
  static String isbn13 = r'^\d{13}$';

  /// UUID regex (Version 4)
  static String uuid =
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[4][0-9a-fA-F]{3}-[89ab][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$';

  static String domain = r'^(?!-)[A-Za-z0-9-]{1,63}(?<!-)\.[A-Za-z]{2,6}$';
}
