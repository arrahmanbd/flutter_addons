
part of 'package:flutter_addons/flutter_addons.dart';

class TimeFormatter {
  /// Returns a human-readable "time ago" string from a timestamp.
  static String formatTime(int timestamp) {
    final int difference = DateTime.now().millisecondsSinceEpoch - timestamp;

    if (difference < _minute) return _formatSeconds(difference);
    if (difference < _hour) return _formatMinutes(difference);
    if (difference < _day) return _formatHours(difference);
    if (difference < _week) return _formatDays(difference);
    if (difference < _month) return _formatWeeks(difference);
    if (difference < _year) return _formatMonths(difference);

    return _formatYears(difference);
  }

  // Constants for time units in milliseconds
  static const int _second = 1000;
  static const int _minute = 60 * _second;
  static const int _hour = 60 * _minute;
  static const int _day = 24 * _hour;
  static const int _week = 7 * _day;
  static const int _month = 30 * _day; // Approximate
  static const int _year = 365 * _day; // Approximate

  /// Converts time difference to seconds
  static String _formatSeconds(int difference) {
    int count = (difference / _second).truncate();
    return count > 1 ? '$count seconds ago' : 'Just now';
  }

  /// Converts time difference to minutes
  static String _formatMinutes(int difference) {
    int count = (difference / _minute).truncate();
    return '$count minute${count > 1 ? 's' : ''} ago';
  }

  /// Converts time difference to hours
  static String _formatHours(int difference) {
    int count = (difference / _hour).truncate();
    return '$count hour${count > 1 ? 's' : ''} ago';
  }

  /// Converts time difference to days
  static String _formatDays(int difference) {
    int count = (difference / _day).truncate();
    return '$count day${count > 1 ? 's' : ''} ago';
  }

  /// Converts time difference to weeks
  static String _formatWeeks(int difference) {
    int count = (difference / _week).truncate();
    return count > 3 ? '1 month ago' : '$count week${count > 1 ? 's' : ''} ago';
  }

  /// Converts time difference to months
  static String _formatMonths(int difference) {
    int count = (difference / _month).round();
    return count > 12 ? '1 year ago' : '$count month${count > 1 ? 's' : ''} ago';
  }

  /// Converts time difference to years
  static String _formatYears(int difference) {
    int count = (difference / _year).truncate();
    return '$count year${count > 1 ? 's' : ''} ago';
  }
}
