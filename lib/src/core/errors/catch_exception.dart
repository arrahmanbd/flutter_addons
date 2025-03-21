part of 'package:flutter_addons/flutter_addons.dart';

class CatchException {
  // Singleton pattern
  static final CatchException _instance = CatchException._internal();

  factory CatchException() {
    return _instance;
  }

  CatchException._internal();

  void initialize() {
    // Initialize error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      // Log the error
      log('Error caught by FlutterError.onError: ${details.exception}');
      // Optionally send the error to analytics or your own error service here
      FlutterError.presentError(details);
    };

    // Custom error widget builder
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Material(
        //color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(
                        255,
                        250,
                        142,
                        134,
                      ).withValues(alpha: .25),
                      blurRadius: 20,
                      spreadRadius: 15,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Image.memory(
                  errorIcon.toByteData(),
                  width: 96,
                  height: 96,
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Whoops!! Something went wrong.",
                style: TextStyle(
                  fontSize: 22.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              SizedBox(height: 10),
              Text(
                details.exception.toString(),
                style: TextStyle(fontSize: 14, color: Colors.black54),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),

              // Retry Button (Optional)
              // Working on it soon
              ElevatedButton.icon(
                onPressed: () {
                  log(details.exception.toString());
                },
                icon: const Icon(Icons.refresh),
                label: const Text("Show Logs"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFFFF7d7d),
                  elevation: .15,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    };
  }
}
