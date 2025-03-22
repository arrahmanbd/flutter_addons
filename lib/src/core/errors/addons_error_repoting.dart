part of 'package:flutter_addons/flutter_addons.dart';


// This singleton class is designed to handle and enhance Flutter's error reporting.
// It logs errors, provides helpful debugging assistance, and includes a motivational message
// to keep developers motivated during tough moments.
// The custom error painter creates a unique and visually distinct debugging experience.
// Additionally, it offers utility methods for logging errors, displaying detailed error information,
// and quickly searching for potential solutions online.
// I have redesigned the default Flutter error page to resemble the Windows blue screen.
// giving it a professional yet nostalgic twist with an improved user interface.

class FlutterAddonsErrorReporting {
  // Singleton pattern
  static final FlutterAddonsErrorReporting _instance =
      FlutterAddonsErrorReporting._internal();

  factory FlutterAddonsErrorReporting() {
    return _instance;
  }

  FlutterAddonsErrorReporting._internal();

  void initialize({required bool useNewPainter}) {
    // Initialize error handling
    FlutterError.onError = (FlutterErrorDetails details) {
      // Optionally send the error to analytics or your own error service here
      Debug.info(
        '🥷 Flutter Addons Ninja detected an issue: ${details.exception}',
      );
      FlutterError.presentError(details);
      Debug.info(
        '🧩 Flutter Addons Help:\n'
        '🔍 Troubleshoot: ${makeQuery(details.exception.toString())}',
      );
    };

    ErrorWidget.builder =
        (FlutterErrorDetails details) =>
            useNewPainter
                ? _addonNewErrorPainter(details)
                : _addonOldErrorPainter(details);
  }

  Material _addonOldErrorPainter(FlutterErrorDetails details) {
    return Material(
      color: Color.fromARGB(255, 18, 18, 22),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Animated Error Icon with Glow Effect
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromARGB(88, 250, 17, 0),
                    blurRadius: 135,
                    spreadRadius: 15,
                    offset: const Offset(0, 60),
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                child: Image.memory(
                  errorIcon.toByteData(),
                  key: ValueKey<int>(1), // Ensures a new animation every time
                  width: 120,
                  height: 120,
                ),
              ),
            ),

            const SizedBox(height: 30),
            // Error Message inside a Dotted Border
            CustomPaint(
              painter: DottedBorderPainter(color: Colors.red),
              child: Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(52, 255, 255, 255),
                ),
                child: Column(
                  children: [
                    Text(
                      "Flutter Error Caught!",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.redAccent,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      details.exception.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontFamily: "Courier",
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Retry and Help Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                buildLogButton(
                  onPressed: () {
                    log(details.exception.toString());
                  },
                  label: "View Log",
                  icon: Icons.bug_report,
                  color: const Color.fromARGB(255, 255, 207, 207),
                  backgroundColor: Colors.redAccent,
                  shadowColor: Colors.red,
                ),
                const SizedBox(width: 20),

                buildLogButton(
                  onPressed: () => errorHelper(details.exception.toString()),
                  label: "Help",
                  icon: Icons.help,
                  color: Colors.redAccent,
                  backgroundColor: const Color.fromARGB(255, 248, 229, 229),
                  shadowColor: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _addonNewErrorPainter(FlutterErrorDetails details) {
    return Material(
      color: const Color.fromARGB(255, 3, 167, 243), // Windows BSOD Blue
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildSadFace(),
            const SizedBox(height: 20),
            _buildMainMessage(),
            const SizedBox(height: 10),
            _buildAdditionalMessage(),
            const SizedBox(height: 20),
            _buildErrorDetails(details),
            const SizedBox(height: 20),
            _buildActionButtons(details),
          ],
        ),
      ),
    );
  }

  // Sad face widget
  Widget _buildSadFace() {
    return const Text(
      ":(",
      style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    );
  }

  // Main BSOD Message
  Widget _buildMainMessage() {
    return const Text(
      "Your app ran into a problem and needs to debug.",
      style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    );
  }

  // Additional message explaining error information
  Widget _buildAdditionalMessage() {
    return const Text(
      "We're collecting some error information, Please resolve the issue and perform a hot reload.",
      style: TextStyle(fontSize: 16, color: Colors.white70),
      textAlign: TextAlign.center,
    );
  }

  // Error details (Simulated Stack Trace)
  Widget _buildErrorDetails(FlutterErrorDetails details) {
    return CustomPaint(
      painter: DottedBorderPainter(),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.35),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          details.exception.toString(),
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontFamily: "Courier",
          ),
          textAlign: TextAlign.center,
          maxLines: 4,
        ),
      ),
    );
  }

  // Action buttons: View Log and Get Help
  Widget _buildActionButtons(FlutterErrorDetails details) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildLogButton(
          onPressed: () => log("Error: ${details.exception.toString()}"),
          label: "View Log",
          icon: Icons.bug_report_outlined,
          backgroundColor: const Color.fromARGB(255, 81, 194, 250),
          borderColor: const Color.fromARGB(255, 212, 249, 250),
        ),
        const SizedBox(width: 20),
        _buildLogButton(
          onPressed: () => errorHelper(details.exception.toString()),
          label: "Get Help",
          icon: Icons.help_outline,
          backgroundColor: const Color(0x0FFFFFFF),
          borderColor: const Color(0xFF51C2FA),
        ),
      ],
    );
  }

  // Reusable Log Button widget
  Widget _buildLogButton({
    required VoidCallback onPressed,
    required String label,
    required IconData icon,
    Color color = Colors.white,
    Color backgroundColor = Colors.blueAccent,
    Color borderColor = Colors.black,
  }) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: Text(label, style: TextStyle(color: color, fontSize: 18)),
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor, // Background color
        side: BorderSide(color: borderColor), // Border color
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        elevation: .3,
      ),
    );
  }

  String getRandomMotivationalMessage() {
    final random = Random();
    final message = AuthorSpeech.motivationalMessages;
    return message[random.nextInt(message.length)];
    // Get a random index and return the corresponding motivational message
  }

  // Create a more specific Google search query with additional context
String makeQuery(String? exception) {
  // Ensure the exception is not null or empty, fallback to a default message
  String formattedException = (exception ?? "Unknown error")
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  // Limit the exception message to 40 characters
  if (formattedException.length > 40) {
    formattedException = formattedException.substring(0, 40);
  }

  // Encode and generate the Google search URL
  String searchQuery = Uri.encodeComponent("$formattedException in Flutter Dart");
  return "https://www.google.com/search?q=$searchQuery";
}

  void errorHelper(String exception) {
    String randomMessages = getRandomMotivationalMessage();
    Debug.log(
      'Hey Developer! 🚀 \n'
      '====================================\n'
      '$randomMessages\n\n'
      '✨ Keep learning, keep building, and trust the process.\n'
      '   Even the greatest apps started with a single line of code.\n'
      '   You\'re creating something amazing!\n\n'
      '💻 Happy coding! – (AR)\n'
      '====================================\n'
      '🧩 Flutter Addons Help:\n'
      '🔍 Troubleshoot: ${makeQuery(exception.toString())} \n\n',
    );
  }

  Widget buildLogButton({
    required VoidCallback onPressed,
    String label = "Print Log",
    IconData icon = Icons.refresh,
    Color color = const Color.fromARGB(239, 250, 214, 214), // Icon & Text Color
    Color backgroundColor = Colors.redAccent,
    Color shadowColor = Colors.red,
  }) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: color),
      label: Text(label, style: TextStyle(color: color)),
      style: ElevatedButton.styleFrom(
        foregroundColor: color, // Ensures text and icon color match
        backgroundColor: backgroundColor,
        elevation: .35,
        shadowColor: shadowColor.withValues(alpha: 0.3),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    );
  }
}

// Custom Painter for Dotted Border
class DottedBorderPainter extends CustomPainter {
  final Color color;
  DottedBorderPainter({this.color = Colors.yellowAccent});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = color
          ..strokeWidth = 2
          ..style = PaintingStyle.stroke;

    const double dashWidth = 8, dashSpace = 8;
    double startX = 0;
    final Path path =
        Path()..addRRect(RRect.fromRectXY(Offset.zero & size, 12, 12));

    Path dashPath = Path();
    for (final PathMetric pathMetric in path.computeMetrics()) {
      while (startX < pathMetric.length) {
        final double endX = (startX + dashWidth).clamp(0, pathMetric.length);
        dashPath.addPath(pathMetric.extractPath(startX, endX), Offset.zero);
        startX = endX + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
