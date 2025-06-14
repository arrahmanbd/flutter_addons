part of 'package:flutter_addons/flutter_addons.dart';

class DefaultErrorMapper extends ErrorMapper {
  @override
  String mapError(Exception error, [StackTrace? stackTrace]) {
    if (error is NetworkException) {
      return "Network error! Please check your internet connection.";
    } else if (error is SocketException) {
      return "Network issue! Unable to connect to the server.";
    } else if (error is TimeoutException) {
      return "Request timed out! Please try again later.";
    } else if (error is HttpException) {
      return "HTTP error occurred! Please check the request.";
    } else if (error is DatabaseException) {
      return "Database error! Please try again later.";
    } else if (error is ValidationException) {
      return "Validation error! Please check your input.";
    } else if (error is PlatformException) {
      return "Platform error! Something went wrong on the native side.";
    } else if (error is RangeError) {
      return "Range error! Please check the values you provided.";
    } else if (error is ArgumentError) {
      return "Argument error! Invalid argument passed.";
    } else if (error is FormatException) {
      return "Format error! The data format is incorrect.";
    } else if (error is FileSystemException) {
      return "File system error! Unable to read or write to file.";
    } else if (error is DartError) {
      return "Dart error! Something went wrong with the Dart runtime.";
    } else if (error is StateError) {
      return "State error! The operation is not allowed in the current state.";
    } else if (error is UnsupportedError) {
      return "Unsupported operation! This action is not supported.";
    } else {
      return "An unexpected error occurred. Please try again.";
    }
  }
}
