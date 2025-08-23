part of 'package:flutter_addons/flutter_addons.dart';

extension IntExtensions on int? {
  /// Validate given int is not null and returns given value if null.
  int validate({int value = 0}) {
    return this ?? value;
  }

  /// Leaves given height of space
  Widget get height => SizedBox(height: this?.toDouble());

  /// Leaves given width of space
  Widget get width => SizedBox(width: this?.toDouble());

  /// HTTP status code
  bool isSuccessful() => this! >= 200 && this! <= 206;

  BorderRadius borderRadius([double? val]) =>
      (this != null)
          ? BorderRadius.all(Radius.circular(val ?? 0))
          : BorderRadius.zero;

  /// Returns microseconds duration
  /// 5.microseconds
  Duration get mcs => Duration(microseconds: validate());

  /// Returns milliseconds duration
  /// ```dart
  /// 5.milliseconds
  /// ```
  Duration get mls => Duration(milliseconds: validate());

  /// Returns seconds duration
  /// ```dart
  /// 5.seconds
  /// ```
  Duration get seconds => Duration(seconds: validate());

  /// Returns minutes duration
  /// ```dart
  /// 5.minutes
  /// ```
  Duration get minutes => Duration(minutes: validate());

  /// Returns hours duration
  /// ```dart
  /// 5.hours
  /// ```
  Duration get hours => Duration(hours: validate());

  /// Returns days duration
  /// ```dart
  /// 5.days
  /// ```
  Duration get days => Duration(days: validate());

  /// Returns if a number is between `first` and `second`
  /// ```dart
  /// 100.isBetween(50, 150) // true;
  /// 100.isBetween(100, 100) // true;
  /// ```
  bool isBetween(num first, num second) {
    if (first <= second) {
      return validate() >= first && validate() <= second;
    } else {
      return validate() >= second && validate() <= first;
    }
  }

  /// Returns Size
  Size get size => Size(this!.toDouble(), this!.toDouble());

  // return suffix (th,st,nd,rd) of the given month day number
  String toMonthDaySuffix() {
    if (!(this! >= 1 && this! <= 31)) {
      throw Exception('Invalid day of month');
    }

    if (this! >= 11 && this! <= 13) {
      return '$this th';
    }

    switch (this! % 10) {
      case 1:
        return '$this st';
      case 2:
        return '$this nd';
      case 3:
        return '$this rd';
      default:
        return '$this th';
    }
  }

  // returns month name from the given int
  String toMonthName({bool isHalfName = false}) {
    String status = '';
    if (!(this! >= 1 && this! <= 12)) {
      throw Exception('Invalid day of month');
    }
    if (this == 1) {
      return status = isHalfName ? 'Jan' : 'January';
    } else if (this == 2) {
      return status = isHalfName ? 'Feb' : 'February';
    } else if (this == 3) {
      return status = isHalfName ? 'Mar' : 'March';
    } else if (this == 4) {
      return status = isHalfName ? 'Apr' : 'April';
    } else if (this == 5) {
      return status = isHalfName ? 'May' : 'May';
    } else if (this == 6) {
      return status = isHalfName ? 'Jun' : 'June';
    } else if (this == 7) {
      return status = isHalfName ? 'Jul' : 'July';
    } else if (this == 8) {
      return status = isHalfName ? 'Aug' : 'August';
    } else if (this == 9) {
      return status = isHalfName ? 'Sept' : 'September';
    } else if (this == 10) {
      return status = isHalfName ? 'Oct' : 'October';
    } else if (this == 11) {
      return status = isHalfName ? 'Nov' : 'November';
    } else if (this == 12) {
      return status = isHalfName ? 'Dec' : 'December';
    }
    return status;
  }

  // returns WeekDay from the given int
  String toWeekDay({bool isHalfName = false}) {
    if (!(this! >= 1 && this! <= 7)) {
      throw Exception('Invalid day of month');
    }
    String weekName = '';

    if (this == 1) {
      return weekName = isHalfName ? "Mon" : "Monday";
    } else if (this == 2) {
      return weekName = isHalfName ? "Tue" : "Tuesday";
    } else if (this == 3) {
      return weekName = isHalfName ? "Wed" : "Wednesday";
    } else if (this == 4) {
      return weekName = isHalfName ? "Thu" : "Thursday";
    } else if (this == 5) {
      return weekName = isHalfName ? "Fri" : "Friday";
    } else if (this == 6) {
      return weekName = isHalfName ? "Sat" : "Saturday";
    } else if (this == 7) {
      return weekName = isHalfName ? "Sun" : "Sunday";
    }
    return weekName;
  }

  /// Extension for integer (`int`) values to convert them to boolean (`bool`) values.
  /// Converts the integer to a boolean value:
  /// 1 for true, 0 for false.
  ///
  /// Example:
  /// ```dart
  /// int flag = 1;
  /// print(flag.toBool()); // Output: true
  /// ```
  bool toBool() => this == 1;

  String toHumanTime() {
    if (this! <= 0) return "0 sec";

    int totalSeconds = this! ~/ 1000; // Convert milliseconds to seconds
    int hours = totalSeconds ~/ 3600;
    int minutes = (totalSeconds % 3600) ~/ 60;
    int seconds = totalSeconds % 60;

    List<String> parts = [];

    if (hours > 0) parts.add('$hours ${hours == 1 ? "hour" : "hours"}');
    if (minutes > 0) parts.add('$minutes ${minutes == 1 ? "min" : "min"}');
    if (seconds > 0 && hours == 0) {
      parts.add('$seconds ${seconds == 1 ? "sec" : "sec"}');
    }

    return parts.join(' ');
  }
}
