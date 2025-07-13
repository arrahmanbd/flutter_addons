part of 'package:flutter_addons/flutter_addons.dart';

extension ResultUtils<T> on Future<T> {
  Future<Result<T, AppError>> toResult() async {
    try {
      final data = await this;
      return Ok(data);
    } catch (e) {
      return Err(
        ExceptionHandler.handle(e is Exception ? e : Exception(e.toString())),
      );
    }
  }
}

extension ResultFutureExtension<T> on Future<Result<T, AppError>> {
  /// Retry the operation on error [times] times with optional [delay].
  ///
  /// Usage:
  /// ```dart
  /// Future<Result<User, AppError>> getUser() {
  //   return api.getUser().retry(times: 2, delay: Duration(milliseconds: 800));
  // }
  Future<Result<T, AppError>> retry({
    int times = 3,
    Duration delay = const Duration(seconds: 1),
  }) async {
    late Result<T, AppError> result;

    for (int i = 0; i < times; i++) {
      result = await this;

      if (result.isSuccess) return result;

      await Future.delayed(delay);
    }

    return result;
  }

  /// Handle exception and convert to Result
  /// Example
  ///  ```dart
  /// class SimpleApi {
  //   Future<Result<User, AppError>> getUser() {
  //     return ResultFutureExtension.guarded(() async {
  //       await Future.delayed(const Duration(seconds: 1));
  //       return User(name: 'John Doe', email: 'john.doe@example.com');
  //     });
  //   }
  // }
  /// ```
  /// This will catch any exception thrown by the action and convert it to an `AppError
  static Future<Result<T, AppError>> guarded<T>(
    Future<T> Function() action,
  ) async {
    try {
      final result = await action();
      return Ok(result);
    } catch (e) {
      return Err(
        ExceptionHandler.handle(e is Exception ? e : Exception(e.toString())),
      );
    }
  }
}
