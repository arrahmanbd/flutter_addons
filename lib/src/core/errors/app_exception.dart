part of 'package:flutter_addons/flutter_addons.dart';

class AppException implements Exception {
  final String message;
  final StackTrace? stackTrace;
  final ErrorMapper errorMapper;

  AppException(this.message, [this.stackTrace, ErrorMapper? errorMapper])
    : errorMapper = errorMapper ?? DefaultErrorMapper();

  @override
  String toString() {
    return message;
  }

  // Factory constructor to create an AppException based on the error and stack trace
  factory AppException.fromError(
    Exception error, {
    StackTrace? stackTrace,
    required ErrorMapper errorMapper,
  }) {
    final message = errorMapper.mapError(error, stackTrace);
    return AppException(message, stackTrace, errorMapper);
  }
}
