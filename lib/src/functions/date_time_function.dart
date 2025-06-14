part of 'package:flutter_addons/flutter_addons.dart';

enum TimeOfDayGreeting { morning, afternoon, evening, night }

/// Extension for `DateTime` providing utility methods for common date-time operations.
extension DateExtension on DateTime {
  /// Tomorrow at the same hour, minute, and second as now.
  static DateTime get tomorrow => DateTime.now().nextDay;

  /// Yesterday at the same hour, minute, and second as now.
  static DateTime get yesterday => DateTime.now().previousDay;

  /// Current date (Same as [DateTime.now])
  static DateTime get today => DateTime.now();

  /// Returns a [DateTime] for each day in the given range.
  ///
  /// - [start] is inclusive.
  /// - [end] is exclusive.
  static Iterable<DateTime> daysInRange(DateTime start, DateTime end) sync* {
    var i = start;
    var offset = start.timeZoneOffset;
    while (i.isBefore(end)) {
      yield i;
      i = i.addDays(1);
      var timeZoneDiff = i.timeZoneOffset - offset;
      if (timeZoneDiff.inSeconds != 0) {
        offset = i.timeZoneOffset;
        i = i.subtract(Duration(seconds: timeZoneDiff.inSeconds));
      }
    }
  }

  /// Returns a [DateTime] with only the date, setting time to midnight.
  /// Returns the date as a string in "YYYY-MM-DD" format without time.
  String _twoDigits(int n) => n < 10 ? "0$n" : "$n";

  /// Returns the time in 24-hour format "HH:MM:SS"
  String get time24h =>
      "${_twoDigits(hour)}:${_twoDigits(minute)}:${_twoDigits(second)}";

  /// Returns the time in 12-hour format with AM/PM "HH:MM AM/PM"
  String get time12h {
    int h = hour % 12 == 0 ? 12 : hour % 12;
    String period = hour < 12 ? "AM" : "PM";
    return "$h:${_twoDigits(minute)} $period";
  }

  String get dateOnly => "$year-${_twoDigits(month)}-${_twoDigits(day)}";

  /// Returns the formatted date in "12 Sep 2024" format.
  String get formattedDate {
    const List<String> monthNames = [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec",
    ];
    return "$day ${monthNames[month - 1]} $year";
  }

  bool get isToday => isSameDay(DateTime.now());

  bool get isYesterday => isSameDay(DateTime.now().subtract(Duration(days: 1)));

  bool get isTomorrow => isSameDay(DateTime.now().add(Duration(days: 1)));

  /// Adds a certain number of days to this date.
  DateTime addDays(int amount) => DateTime(
    year,
    month,
    day + amount,
    hour,
    minute,
    second,
    millisecond,
    microsecond,
  );

  /// Adds a certain number of hours to this date.
  DateTime addHours(int amount) => DateTime(
    year,
    month,
    day,
    hour + amount,
    minute,
    second,
    millisecond,
    microsecond,
  );

  /// Returns the next day's [DateTime].
  DateTime get nextDay => addDays(1);

  /// Returns the previous day's [DateTime].
  DateTime get previousDay => addDays(-1);

  /// Checks if two [DateTime] instances fall on the same day.
  bool isSameDay(DateTime b) =>
      year == b.year && month == b.month && day == b.day;

  /// Determines the greeting type based on the time of day.
  TimeOfDayGreeting get greeting {
    if (hour >= 5 && hour < 12) {
      return TimeOfDayGreeting.morning;
    } else if (hour >= 12 && hour < 17) {
      return TimeOfDayGreeting.afternoon;
    } else if (hour >= 17 && hour < 21) {
      return TimeOfDayGreeting.evening;
    } else {
      return TimeOfDayGreeting.night;
    }
  }

  /// Returns a list of days in the given month.
  List<DateTime> get daysInMonth {
    var first = firstDayOfMonth;
    var last = lastDayOfMonth;
    return daysInRange(first, last.add(Duration(days: 1))).toList();
  }

  bool get isFirstDayOfMonth => isSameDay(firstDayOfMonth);

  bool get isLastDayOfMonth => isSameDay(lastDayOfMonth);

  DateTime get firstDayOfMonth => DateTime(year, month);

  DateTime get firstDayOfWeek {
    final utcDay = DateTime.utc(year, month, day, 12);
    var decreaseNum = utcDay.weekday % 7;
    return subtract(Duration(days: decreaseNum));
  }

  DateTime get lastDayOfWeek {
    final utcDay = DateTime.utc(year, month, day, 12);
    var increaseNum = utcDay.weekday % 7;
    return utcDay.add(Duration(days: 7 - increaseNum));
  }

  /// Returns the last day of the given month.
  DateTime get lastDayOfMonth {
    var beginningNextMonth =
        (month < 12) ? DateTime(year, month + 1, 1) : DateTime(year + 1, 1, 1);
    return beginningNextMonth.subtract(Duration(days: 1));
  }

  DateTime get previousMonth {
    return month == 1 ? DateTime(year - 1, 12) : DateTime(year, month - 1);
  }

  DateTime get nextMonth {
    return month == 12 ? DateTime(year + 1, 1) : DateTime(year, month + 1);
  }

  DateTime get previousWeek => subtract(Duration(days: 7));

  DateTime get nextWeek => add(Duration(days: 7));

  /// Checks if two dates fall within the same week.
  bool isSameWeek(DateTime b) {
    final a = DateTime.utc(year, month, day);
    b = DateTime.utc(b.year, b.month, b.day);
    final diff = a.toUtc().difference(b.toUtc()).inDays;
    if (diff.abs() >= 7) return false;
    final min = a.isBefore(b) ? a : b;
    final max = a.isBefore(b) ? b : a;
    return max.weekday % 7 - min.weekday % 7 >= 0;
  }

  /// Returns only the time.
  DateTime get time =>
      DateTime(0, 1, 1, hour, minute, second, millisecond, microsecond);

  /// Returns a human-readable "time ago" format (e.g., "3 hours ago").
  String get timeAgo => TimeFormatter.formatTime(millisecondsSinceEpoch);

  /// Returns the current time in milliseconds since epoch.
  int currentMillisecondsTimeStamp() => DateTime.now().millisecondsSinceEpoch;

  /// Returns the current timestamp in seconds (integer value).
  int currentTimeStamp() {
    return (DateTime.now().millisecondsSinceEpoch ~/ 1000).toInt();
  }

  /// Determines if a given year is a leap year.
  /// A year is a leap year if it is divisible by 4, but not divisible by 100 unless it is also divisible by 400.
  bool leapYear(int year) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
      return true;
    }
    return false;
  }

  /// Returns the number of days in the given month and year.
  /// The months are indexed starting from 1 (January = 1, December = 12).
  int daysInAMonth(int monthNum, int year) {
    // Length of months for a non-leap year
    List<int> monthLengths = [
      31, // January
      28, // February (29 for leap years)
      31, // March
      30, // April
      31, // May
      30, // June
      31, // July
      31, // August
      30, // September
      31, // October
      30, // November
      31, // December
    ];

    // Adjust February days for leap years
    if (leapYear(year)) {
      monthLengths[1] = 29; // February in a leap year
    }

    return monthLengths[monthNum - 1]; // Return days in the specified month
  }

  ///Print day
  String get fullDayName {
    return _fullDayName();
  }

  String get sortDayName {
    return _shortDayName();
  }

  String _fullDayName() {
    return [
      "Sunday",
      "Monday",
      "Tuesday",
      "Wednesday",
      "Thursday",
      "Friday",
      "Saturday",
    ][weekday % 7];
  }

  String _shortDayName() {
    return ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"][weekday % 7];
  }
}
