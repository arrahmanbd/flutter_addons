part of 'package:flutter_addons/flutter_addons.dart';

class Feedback {
  static void showSnackbar(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    FeedbackController.instance.showSnackbar(message, duration: duration);
  }

  static void showToast(String message) {
    FeedbackController.instance.showToast(message);
  }

  static void showAlert(String title, String message) {
    FeedbackController.instance.showAlert(title, message);
  }
}

abstract class FeedbackService {
  void showSnackbar(String message, {Duration duration});
  void showToast(String message);
  void showAlert(String title, String message);
}

class FeedbackController {
  static FeedbackService? _instance;

  static bool get isInstalled => _instance != null;

  static void install(FeedbackService service) {
    _instance = service;
  }

  static FeedbackService get instance {
    if (_instance == null) {
      throw Exception(
        '⚠️ FeedbackService not installed. Call FeedbackController.install() first.',
      );
    }
    return _instance!;
  }
}

class DefaultFeedbackService implements FeedbackService {
  final BuildContext context;

  DefaultFeedbackService(this.context);

  @override
  void showSnackbar(
    String message, {
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message), duration: duration));
  }

  @override
  void showToast(String message) {
    showSnackbar(message);
  }

  @override
  void showAlert(String title, String message) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(title),
            content: Text(message),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
    );
  }
}
