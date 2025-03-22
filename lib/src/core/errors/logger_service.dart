abstract class LogService {
  void logError(Exception error, StackTrace? stackTrace);
}

class DefaultLogService implements LogService {
  @override
  void logError(Exception error, StackTrace? stackTrace) {
    //  integrate with a remote logging service like Firebase, Sentry, or just log locally
    print("Logging error: ${error.toString()}");
    print("Stack trace: ${stackTrace.toString()}");

    // Example: Send the error to Sentry or Firebase (using their SDKs)
    // Sentry.captureException(error, stackTrace: stackTrace);
    // FirebaseCrashlytics.instance.recordError(error, stackTrace);
  }
}
