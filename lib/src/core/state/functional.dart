part of 'package:flutter_addons/flutter_addons.dart';

/// Represents either a success (Ok) or a failure (Err)
///
/// Better use in repository
///  Example
// ignore: unintended_html_in_doc_comment
/// Future< Result<User, AppError>> getUser() async {
//   try {
//     final data = await api.getUser();
//     return Ok(data);
//   } catch (e) {
//     return Err(handleException(e)); // convert to AppError
//   }
// }

sealed class Result<T, E> {
  const Result();

  /// Returns `onSuccess` if `Ok`, otherwise `onError`
  R fold<R>(R Function(T value) onSuccess, R Function(E error) onError);

  /// Pattern matching
  R when<R>({
    required R Function(T value) ok,
    required R Function(E error) err,
  }) => fold(ok, err);

  /// Transforms the success value
  Result<U, E> map<U>(U Function(T value) transform) {
    return this is Ok<T, E>
        ? Ok<U, E>(transform((this as Ok<T, E>).value))
        : this as Err<U, E>;
  }

  /// Transforms the error
  Result<T, F> mapError<F>(F Function(E error) transform) {
    return this is Err<T, E>
        ? Err<T, F>(transform((this as Err<T, E>).error))
        : this as Ok<T, F>;
  }

  /// Chains another Result-returning operation (monadic flatMap)
  Result<U, E> flatMap<U>(Result<U, E> Function(T value) transform) {
    return this is Ok<T, E>
        ? transform((this as Ok<T, E>).value)
        : this as Err<U, E>;
  }

  bool get isSuccess => this is Ok<T, E>;
  bool get isError => this is Err<T, E>;
}

class Ok<T, E> extends Result<T, E> {
  final T value;
  const Ok(this.value);

  @override
  R fold<R>(R Function(T value) onSuccess, R Function(E error) onError) =>
      onSuccess(value);

  Ok<T, E> copyWith({T? value}) => Ok<T, E>(value ?? this.value);
}

class Err<T, E> extends Result<T, E> {
  final E error;
  const Err(this.error);

  @override
  R fold<R>(R Function(T value) onSuccess, R Function(E error) onError) =>
      onError(error);

  Err<T, E> copyWith({E? error}) => Err<T, E>(error ?? this.error);
}

// Logic flow
// Example usage
// Custom error
// class AuthError {
//   final String message;
//   AuthError(this.message);
// }

// Fake API
// Future<Result<String, AuthError>> login(String username, String password) async {
//   if (username.isEmpty || password.isEmpty) {
//     return Err(AuthError('Fields cannot be empty.'));
//   }

// simulate API call
//   await Future.delayed(Duration(milliseconds: 300));
//   return username == 'admin' && password == '1234'
//       ? Ok('token_xyz')
//       : Err(AuthError('Invalid credentials'));
// }

// Usage
// void runLoginFlow() async {
//   final result = await login('admin', '1234');

//   result.when(
//     ok: (token) => print('Login success: $token'),
//     err: (e) => print('Login failed: ${e.message}'),
//   );

//   final mapped = result
//       .map((token) => 'Bearer $token')
//       .mapError((e) => '⚠️ ${e.message}');

//   mapped.fold(
//     (v) => print('Mapped token: $v'),
//     (e) => print('Mapped error: $e'),
//   );
// }
