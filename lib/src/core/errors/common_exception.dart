part of 'package:flutter_addons/flutter_addons.dart';

/// Exception for network-related issues such as no internet connection,
/// server unavailability, or connection timeout.
class NetworkException extends AppException {
  NetworkException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Exception for database-related errors such as failed queries,
/// connection failures, or data corruption.
class DatabaseException extends AppException {
  DatabaseException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Exception for validation errors such as incorrect user input,
/// missing required fields, or format mismatches.
class ValidationException extends AppException {
  ValidationException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Exception for server-related errors such as internal server failures,
/// bad gateway responses, or HTTP 500 series errors.
class ServerException extends AppException {
  ServerException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Exception for HTTP-related errors such as unauthorized access (401),
/// forbidden access (403), resource not found (404), etc.
class HttpRequestException extends AppException {
  final int statusCode;

  HttpRequestException(
    String message,
    this.statusCode, [
    StackTrace? stackTrace,
    ErrorMapper? errorMapper,
  ]) : super(message, stackTrace, errorMapper);

  @override
  String toString() => "HttpRequestException ($statusCode): $message";
}

/// Exception for timeout scenarios such as request timeouts
/// when waiting for a response from an API or service.
class TimeoutException extends AppException {
  TimeoutException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Exception for file system errors such as failed file reads,
/// writes, or permission issues.
class FileSystemException extends AppException {
  FileSystemException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Exception for platform-related errors, typically arising from native
/// Android/iOS platform channels or system-level failures.
class PlatformException extends AppException {
  PlatformException(super.message, [super.stackTrace, super.errorMapper]);
}

/// Dart Runtime Exception
///
class DartError extends AppException {
  DartError(super.message, [super.stackTrace, super.errorMapper]);
}
