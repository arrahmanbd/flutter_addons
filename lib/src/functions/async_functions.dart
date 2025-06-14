part of 'package:flutter_addons/flutter_addons.dart';

/// **Async Utilities Functions**
extension AsyncUtilities<T> on Future<T> {
  /// **Handles errors gracefully**
  Future<T?> safe({T? fallback}) async {
    try {
      return await this;
    } catch (e, stackTrace) {
      debug("Async Error: $e\n$stackTrace"); // Log error
      return fallback;
    }
  }

  /// **Retries Future if it fails**
  Future<T> retry({
    int retries = 3,
    Duration delay = const Duration(milliseconds: 500),
  }) async {
    for (int attempt = 1; attempt <= retries; attempt++) {
      try {
        return await this;
      } catch (e) {
        if (attempt == retries) rethrow;
        await Future.delayed(delay);
      }
    }
    throw Exception("Retry failed after $retries attempts");
  }

  /// **Timeouts a Future**
  Future<T> withTimeout(Duration duration, {T? fallback}) {
    return timeout(
      duration,
      onTimeout:
          () => fallback ?? (throw TimeoutException('Operation timed out')),
    );
  }

  /// **Runs a Future after a delay**
  Future<T> delayed(Duration duration) async {
    await Future.delayed(duration);
    return await this;
  }
}

/// **Batch Processing & Mapping for Streams**
extension StreamExtensions<T> on Stream<T> {
  /// **Converts Stream into List**
  Future<List<T>> collect() => toList();

  /// **Maps values asynchronously**
  Stream<R> asyncMap<R>(Future<R> Function(T) mapper) async* {
    await for (final value in this) {
      yield await mapper(value);
    }
  }

  /// **Delays stream items**
  Stream<T> delayEach(Duration duration) async* {
    await for (final value in this) {
      await Future.delayed(duration);
      yield value;
    }
  }

  /// **Batches stream values into lists of size [batchSize]**
  Stream<List<T>> batch(int batchSize) async* {
    List<T> batch = [];
    await for (final value in this) {
      batch.add(value);
      if (batch.length >= batchSize) {
        yield batch;
        batch = [];
      }
    }
    if (batch.isNotEmpty) yield batch;
  }
}

/// **Future Helpers**
class FutureUtils {
  /// **Waits for multiple Futures safely**
  static Future<List<T>> waitAll<T>(
    List<Future<T>> futures, {
    bool ignoreErrors = false,
  }) async {
    if (!ignoreErrors) return Future.wait(futures);

    List<T> results = [];
    for (var future in futures) {
      try {
        results.add(await future);
      } catch (e) {
        debug("Ignoring error in Future.waitAll: $e");
      }
    }
    return results;
  }
}
