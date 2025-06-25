part of 'package:flutter_addons/flutter_addons.dart';

// Base Error class
class AppError {
  final String error;
  final Exception? exception;
  AppError({required this.error, this.exception});
}
