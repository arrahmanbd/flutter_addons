part of 'package:flutter_addons/flutter_addons.dart';

extension DurationUtils on Duration {
  /// ⏱️ Delay execution for this duration
  ///
  /// Example: `await Duration(seconds: 2).delay;`
  Future<void> get delay => Future.delayed(this);

  /// 🧮 Total duration in seconds
  double get inSecondsDouble => inMilliseconds / 1000.0;

  /// 🧮 Total duration in minutes (as double)
  double get inMinutesDouble => inMilliseconds / 60000.0;

  /// 🧮 Total duration in hours (as double)
  double get inHoursDouble => inMilliseconds / 3600000.0;

  /// 🧾 Format duration as `HH:mm:ss`
  ///
  /// Example: `Duration(hours: 2, minutes: 3).formattedTime => 02:03:00`
  String get formattedTime {
    twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(inHours);
    final minutes = twoDigits(inMinutes.remainder(60));
    final seconds = twoDigits(inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  /// 🔤 Format as `1h 5m 20s` (skips zero parts)
  String get humanized {
    final parts = <String>[];
    if (inHours > 0) parts.add('${inHours}h');
    if (inMinutes.remainder(60) > 0) parts.add('${inMinutes.remainder(60)}m');
    if (inSeconds.remainder(60) > 0) parts.add('${inSeconds.remainder(60)}s');
    return parts.join(' ');
  }

  /// 🔄 Returns a new Duration with only hours, minutes and seconds (drops micro/milli)
  Duration get clean => Duration(
    hours: inHours,
    minutes: inMinutes.remainder(60),
    seconds: inSeconds.remainder(60),
  );

  /// 🔁 Repeats a function after a delay
  ///
  /// Example: `Duration(seconds: 1).repeat(() => print('tick'));`
  void repeat(void Function() callback, {int times = 1}) {
    for (var i = 0; i < times; i++) {
      Future.delayed(this * i, callback);
    }
  }
}

extension IntToDuration on int {
  Duration get seconds => Duration(seconds: this);
  Duration get minutes => Duration(minutes: this);
  Duration get hours => Duration(hours: this);
  Duration get days => Duration(days: this);
}
