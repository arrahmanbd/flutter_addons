part of 'package:flutter_addons/flutter_addons.dart';

/// Exception for network-related issues such as no internet connection,
/// server unavailability, or connection timeout.
// http_exception.dart
class HttpException implements Exception {
  final int statusCode;
  final String message;

  HttpException(this.statusCode, this.message);

  @override
  String toString() => 'HttpException: $statusCode - $message';
}

// Exception handler
class ExceptionHandler {
  static AppError handle(Exception exception) {
    if (exception is TimeoutException) {
      return AppError(error: 'Request timed out.', exception: exception);
    } else if (exception is SocketException) {
      return AppError(error: 'No internet connection.', exception: exception);
    } else if (exception is FormatException) {
      return AppError(error: 'Invalid response format.', exception: exception);
    } else if (exception is HttpException) {
      return AppError(
        error: _mapStatusCodeToMessage(exception.statusCode),
        exception: exception,
      );
    } else {
      return AppError(error: 'Something went wrong.', exception: exception);
    }
  }

  static String _mapStatusCodeToMessage(int code) {
    switch (code) {
      case 400:
        return 'Bad request.';
      case 401:
        return 'Unauthorized.';
      case 403:
        return 'Forbidden.';
      case 404:
        return 'Not found.';
      case 500:
        return 'Server error.';
      default:
        return 'HTTP error: $code';
    }
  }
}
