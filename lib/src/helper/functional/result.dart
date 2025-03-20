/// Represents either a success (`Ok`) or failure (`Err`)
sealed class Result<T, E> {
  const Result();

  /// Returns `onSuccess` if `Ok`, otherwise `onError`
  R fold<R>(R Function(T value) onSuccess, R Function(E error) onError);

  bool get isSuccess => this is Ok<T, E>;
  bool get isError => this is Err<T, E>;
}

class Ok<T, E> extends Result<T, E> {
  final T value;
  const Ok(this.value);

  @override
  R fold<R>(R Function(T value) onSuccess, R Function(E error) onError) => onSuccess(value);
}

class Err<T, E> extends Result<T, E> {
  final E error;
  const Err(this.error);

  @override
  R fold<R>(R Function(T value) onSuccess, R Function(E error) onError) => onError(error);
}
