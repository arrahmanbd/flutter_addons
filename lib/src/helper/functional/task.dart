/// Represents an asynchronous computation.
class Task<T> {
  final Future<T> Function() _task;

  Task(this._task);

  Future<T> run() => _task();

  Task<R> map<R>(R Function(T value) transform) {
    return Task(() async => transform(await _task()));
  }

  Task<R> flatMap<R>(Task<R> Function(T value) transform) {
    return Task(() async => await transform(await _task()).run());
  }
}
