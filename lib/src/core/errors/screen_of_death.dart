part of 'package:flutter_addons/flutter_addons.dart';

/// *****************************************************************************
/// **Blue Screen of Death (BSOD) Widget**
/// This widget is displayed when an error occurs in the app.
/// I have no idea why I made this, but it looks cool.
/// *****************************************************************************

class _WinDeath extends StatelessWidget {
  final FlutterErrorDetails details;
  const _WinDeath(this.details);

  @override
  Widget build(BuildContext context) {
    final exceptionText = details.exception.toString();

    return Scaffold(
      backgroundColor: const ui.Color.fromARGB(255, 6, 144, 250),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 5.pw, vertical: 4.ph),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                ":(",
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 2.ph),
              Text(
                "Oops! An unexpected issue occurred.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.ph),
              Text(
                "Debug info is being collected. You may restart or fix the issue.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14.sp, color: Colors.white70),
              ),
              SizedBox(height: 3.ph),
              _buildErrorBox(exceptionText),
              SizedBox(height: 3.ph),
              _buildOutlinedDebugButton(
                onPressed: () => _logDebugInfo(exceptionText),
              ),
              SizedBox(height: 4.ph),
              Text(
                _getRandomMotivationalMessage(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontStyle: FontStyle.italic,
                  color: Colors.lightGreenAccent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorBox(String error) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white24),
      ),
      child: Text(
        error,
        style: const TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontFamily: "Courier",
        ),
        maxLines: 6,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildOutlinedDebugButton({required VoidCallback onPressed}) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: const Icon(Icons.bug_report_rounded, color: Colors.white),
      label: const Text(
        "Print Debug Info",
        style: TextStyle(color: Colors.white),
      ),
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white, width: 1),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    );
  }

  void _logDebugInfo(String exception) {
    final message = _getRandomMotivationalMessage();
    final search = _makeQuery(exception);
    Debug.log('''
🚨 ERROR OCCURRED
────────────────────────────────────
💬 $message

❓ Need Help?
🔍 Search: $search

🧠 Exception Summary:
$exception

────────────────────────────────────
''');
  }

  String _getRandomMotivationalMessage() {
    final messages = AuthorSpeech.motivationalMessages;
    return messages[Random().nextInt(messages.length)];
  }

  String _makeQuery(String exception) {
    String cleaned = exception.replaceAll(RegExp(r'\s+'), ' ').trim();
    if (cleaned.length > 50) cleaned = cleaned.substring(0, 50);
    return "https://www.google.com/search?q=${Uri.encodeComponent('$cleaned in Flutter')}";
  }
}

class _AppErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _AppErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.warning_amber_rounded,
                size: 80,
                color: theme.colorScheme.error,
              ),
              const SizedBox(height: 20),
              Text(
                "Oops! Something went wrong.",
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: theme.colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                "The app encountered an unexpected error.\nWe’re working to fix it.",
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isDark ? Colors.white10 : Colors.black12,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  details.exception.toString(),
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: "monospace",
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.85),
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 24),
              FilledButton.icon(
                onPressed: () => {},
                icon: const Icon(Icons.restart_alt_rounded),
                label: const Text("Restart App"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AssistantErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _AssistantErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surfaceContainerHighest,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            color: theme.colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: theme.colorScheme.primary.withValues(
                      alpha: 0.1,
                    ),
                    child: Icon(
                      Icons.smart_toy_rounded,
                      color: theme.colorScheme.primary,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "Hey there! I'm Orbi.",
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Something didn’t go as planned. Let me show you what happened.",
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: theme.colorScheme.outline.withValues(alpha: 0.2),
                      ),
                    ),
                    child: Text(
                      details.exception.toString(),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontFamily: "monospace",
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton.icon(
                        onPressed:
                            () => Debug.log(details.exception.toString()),
                        icon: const Icon(Icons.bug_report, size: 18),
                        label: const Text("Debug Info"),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white, width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      FilledButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.restart_alt),
                        label: const Text("Restart"),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'dfg',
                    //getRandomMotivationalMessage(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 12,
                      color: theme.colorScheme.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// error_screens.dart

class _TerminalErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _TerminalErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            1.s,
            const Text(
              "SYSTEM FAILURE",
              style: TextStyle(
                color: Colors.greenAccent,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Courier',
              ),
            ),
            const SizedBox(height: 16),
            Text(
              details.exception.toString(),
              style: const TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'Courier',
              ),
            ),
            const Spacer(),
            const Text(
              "> Awaiting system reboot...",
              style: TextStyle(
                color: Colors.greenAccent,
                fontFamily: 'Courier',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SciFiErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _SciFiErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF101820),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.cyanAccent, width: 2),
            borderRadius: BorderRadius.circular(12),
            color: Colors.black.withValues(alpha: 0.7),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.warning_amber_rounded,
                size: 60,
                color: Colors.cyanAccent,
              ),
              const SizedBox(height: 16),
              const Text(
                "SYSTEM ERROR - CODE RED",
                style: TextStyle(
                  color: Colors.cyanAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                details.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.white, fontSize: 13),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: () => Debug.warning(details.exception.toString()),
                icon: const Icon(Icons.bug_report),
                label: const Text("Analyze"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.cyanAccent,
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(color: Colors.cyanAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TheaterErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _TheaterErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final error = details.exception.toString();
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade900,
      body: Stack(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.7),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.theater_comedy,
                    size: 60,
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "A Tragic Flutter Tale...",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    error,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontFamily: "Courier",
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  OutlinedButton.icon(
                    onPressed: () => Debug.warning(error),
                    icon: const Icon(Icons.bug_report, color: Colors.white),
                    label: const Text(
                      "Debug Info",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white, width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: CustomPaint(
              size: Size(double.infinity, 120),
              painter: CurtainPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class _PixelArtErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _PixelArtErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2D2D),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: Size(
                double.infinity,
                120,
              ), // Adjust height to fit your design
              painter: EightBitSkullPainter(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Uh-oh!",
              style: TextStyle(
                fontFamily: "PressStart2P",
                color: Colors.redAccent,
                fontSize: 20,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                details.exception.toString(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: "PressStart2P",
                  fontSize: 10,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Debug.warning(details.exception.toString()),
              style: TextButton.styleFrom(foregroundColor: Colors.redAccent),
              child: const Text("VIEW ERROR LOG"),
            ),
          ],
        ),
      ),
    );
  }
}

class _FrostErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _FrostErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final error = details.exception.toString();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFa1c4fd), Color(0xFFc2e9fb)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(
                width: 320,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: Colors.white38, width: 1),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.ac_unit_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "Oops, Things Got Chilly!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      error,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontFamily: "Courier",
                      ),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () => Debug.warning(error),
                      icon: const Icon(Icons.refresh),
                      label: const Text("Retry"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CatHackerErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _CatHackerErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final error = details.exception.toString();
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomPaint(
              size: Size(
                double.infinity,
                120,
              ), // You can adjust height based on your needs
              painter: HackerCatPainter(),
            ),

            const SizedBox(height: 20),
            const Text(
              "MEOWTRIX BREACHED",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Courier",
                color: Colors.greenAccent,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Courier",
                fontSize: 14,
                color: Colors.greenAccent,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              icon: const Icon(Icons.terminal, color: Colors.greenAccent),
              label: const Text(
                "View Logs",
                style: TextStyle(color: Colors.greenAccent),
              ),
              onPressed: () => Debug.warning(error),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.greenAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ScrollErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _ScrollErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final error = details.exception.toString();
    return Scaffold(
      backgroundColor: const Color(0xFFf3eac2),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(24),
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: const Color(0xFFfcf4db),
            border: Border.all(color: Colors.brown.shade400),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.brown.shade200,
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.menu_book_rounded,
                color: Colors.brown,
                size: 40,
              ),
              const SizedBox(height: 12),
              const Text(
                "By the decree of code, an error has been summoned.",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Serif',
                  color: Colors.brown,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                error,
                style: const TextStyle(
                  fontFamily: "Courier",
                  fontSize: 14,
                  color: Colors.brown,
                ),
                textAlign: TextAlign.center,
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              OutlinedButton.icon(
                onPressed: () => Debug.warning(error),
                icon: const Icon(Icons.library_books, color: Colors.brown),
                label: const Text(
                  "Log Error",
                  style: TextStyle(color: Colors.brown),
                ),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.brown.shade300),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Desert404ErrorScreen extends StatelessWidget {
  final FlutterErrorDetails details;
  const _Desert404ErrorScreen(this.details);

  @override
  Widget build(BuildContext context) {
    final error = details.exception.toString();
    return Scaffold(
      backgroundColor: Colors.orange.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.wb_sunny, size: 80, color: Colors.orange.shade800),
            CustomPaint(
              size: Size(120, 120), // Size of the canvas
              painter: DesertCactusPainter(),
            ),
            const SizedBox(height: 20),
            const Text(
              "Lost in the desert of bugs...",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.brown,
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                error,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.brown,
                  fontFamily: "Courier",
                ),
                textAlign: TextAlign.center,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () => Debug.warning(error),
              icon: const Icon(Icons.refresh, color: Colors.brown),
              label: const Text("Retry", style: TextStyle(color: Colors.brown)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.brown.shade300, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DesertCactusPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill;

    // Draw the main trunk of the cactus (vertical rectangle)
    final trunkRect = Rect.fromLTWH(
      size.width * 0.4,
      size.height * 0.3,
      size.width * 0.2,
      size.height * 0.5,
    );
    canvas.drawRect(trunkRect, paint);

    // Draw cactus arms (two small rectangles on the sides)
    final armPaint = Paint()..color = Colors.green;

    // Left arm
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.25,
        size.height * 0.4,
        size.width * 0.15,
        size.height * 0.2,
      ),
      armPaint,
    );

    // Right arm
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.6,
        size.height * 0.4,
        size.width * 0.15,
        size.height * 0.2,
      ),
      armPaint,
    );

    // Draw the pot (bottom part, a rectangle)
    final potPaint = Paint()..color = Colors.brown;
    final potRect = Rect.fromLTWH(
      size.width * 0.3,
      size.height * 0.75,
      size.width * 0.4,
      size.height * 0.2,
    );
    canvas.drawRect(potRect, potPaint);

    // Draw the base of the pot (darker shade)
    final basePaint = Paint()..color = Colors.black.withValues(alpha: 0.2);
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.3,
        size.height * 0.9,
        size.width * 0.4,
        size.height * 0.02,
      ),
      basePaint,
    );

    // Add some desert soil under the pot (brownish sand)
    final soilPaint = Paint()..color = Color(0xFFd9a700); // Sand color
    final soilRect = Rect.fromLTWH(
      0,
      size.height * 0.95,
      size.width,
      size.height * 0.05,
    );
    canvas.drawRect(soilRect, soilPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CurtainPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final curtainPaint =
        Paint()
          ..shader = LinearGradient(
            colors: [Colors.red.shade900, Colors.red.shade700],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    final path = Path();

    // Draw top curve
    path.moveTo(0, 0);
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.3,
      size.width * 0.5,
      size.height * 0.15,
    );
    path.quadraticBezierTo(
      size.width * 0.75,
      0,
      size.width,
      size.height * 0.25,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, curtainPaint);

    // Draw folds
    final foldPaint =
        Paint()
          ..color = Colors.red.shade800.withValues(alpha: 0.3)
          ..strokeWidth = 4
          ..style = PaintingStyle.stroke;

    for (double x = 0; x < size.width; x += size.width / 10) {
      final path = Path();
      path.moveTo(x, 0);
      path.quadraticBezierTo(
        x + size.width * 0.02,
        size.height * 0.15,
        x,
        size.height * 0.3,
      );
      canvas.drawPath(path, foldPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HackerCatPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Cat face shape (circle)
    final facePaint = Paint()..color = Colors.grey.shade800;
    canvas.drawCircle(
      Offset(size.width / 2, size.height / 2),
      size.height / 2,
      facePaint,
    );

    // Cat ears (triangular)
    final earPaint = Paint()..color = Colors.grey.shade700;
    final earPathLeft =
        Path()
          ..moveTo(size.width * 0.25, size.height * 0.1)
          ..lineTo(size.width * 0.1, size.height * 0.3)
          ..lineTo(size.width * 0.4, size.height * 0.3)
          ..close();

    final earPathRight =
        Path()
          ..moveTo(size.width * 0.75, size.height * 0.1)
          ..lineTo(size.width * 0.9, size.height * 0.3)
          ..lineTo(size.width * 0.6, size.height * 0.3)
          ..close();

    canvas.drawPath(earPathLeft, earPaint);
    canvas.drawPath(earPathRight, earPaint);

    // Cat eyes (glowing)
    final eyePaint =
        Paint()
          ..color = Colors.greenAccent
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 10.0); // Glow effect
    canvas.drawCircle(
      Offset(size.width * 0.35, size.height * 0.45),
      size.height * 0.08,
      eyePaint,
    );
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.45),
      size.height * 0.08,
      eyePaint,
    );

    // Cat nose (small triangle)
    final nosePaint = Paint()..color = Colors.pink.shade300;
    final nosePath =
        Path()
          ..moveTo(size.width / 2, size.height * 0.55)
          ..lineTo(size.width * 0.45, size.height * 0.6)
          ..lineTo(size.width * 0.55, size.height * 0.6)
          ..close();
    canvas.drawPath(nosePath, nosePaint);

    // Cat mouth (curves)
    final mouthPaint =
        Paint()
          ..color = Colors.pink.shade300
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2;

    final mouthPath =
        Path()
          ..moveTo(size.width * 0.45, size.height * 0.65)
          ..quadraticBezierTo(
            size.width * 0.4,
            size.height * 0.7,
            size.width / 2,
            size.height * 0.7,
          )
          ..quadraticBezierTo(
            size.width * 0.6,
            size.height * 0.7,
            size.width * 0.55,
            size.height * 0.65,
          );
    canvas.drawPath(mouthPath, mouthPaint);

    // Cat whiskers
    final whiskerPaint = Paint()..color = Colors.black.withValues(alpha: 0.6);
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.6),
      Offset(size.width * 0.05, size.height * 0.6),
      whiskerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.65),
      Offset(size.width * 0.05, size.height * 0.65),
      whiskerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, size.height * 0.7),
      Offset(size.width * 0.05, size.height * 0.7),
      whiskerPaint,
    );

    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.6),
      Offset(size.width * 0.95, size.height * 0.6),
      whiskerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.65),
      Offset(size.width * 0.95, size.height * 0.65),
      whiskerPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.8, size.height * 0.7),
      Offset(size.width * 0.95, size.height * 0.7),
      whiskerPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class EightBitSkullPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    // Skull outline (rectangle with rounded edges)
    final skullPath =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              size.width * 0.25,
              size.height * 0.2,
              size.width * 0.5,
              size.height * 0.6,
            ),
            Radius.circular(12),
          ),
        );
    canvas.drawPath(skullPath, paint);

    // Eye sockets (black rectangles)
    final eyePaint = Paint()..color = Colors.black;

    // Left eye socket (rectangle)
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.3,
        size.height * 0.35,
        size.width * 0.15,
        size.height * 0.2,
      ),
      eyePaint,
    );

    // Right eye socket (rectangle)
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.55,
        size.height * 0.35,
        size.width * 0.15,
        size.height * 0.2,
      ),
      eyePaint,
    );

    // Nose (triangle)
    final nosePath =
        Path()
          ..moveTo(size.width * 0.47, size.height * 0.55)
          ..lineTo(size.width * 0.53, size.height * 0.55)
          ..lineTo(size.width * 0.5, size.height * 0.65)
          ..close();
    canvas.drawPath(nosePath, eyePaint);

    // Mouth (5 horizontal lines to simulate an 8-bit smile)
    final mouthPaint = Paint()..color = Colors.black;

    final mouthPositions = [
      Offset(size.width * 0.35, size.height * 0.75),
      Offset(size.width * 0.4, size.height * 0.77),
      Offset(size.width * 0.45, size.height * 0.78),
      Offset(size.width * 0.55, size.height * 0.77),
      Offset(size.width * 0.6, size.height * 0.75),
    ];

    for (int i = 0; i < mouthPositions.length - 1; i++) {
      canvas.drawLine(mouthPositions[i], mouthPositions[i + 1], mouthPaint);
    }

    // Skull shadow effect (darker shade)
    final shadowPaint = Paint()..color = Colors.black.withValues(alpha: 0.2);
    final shadowPath =
        Path()..addRRect(
          RRect.fromRectAndRadius(
            Rect.fromLTWH(
              size.width * 0.27,
              size.height * 0.4,
              size.width * 0.46,
              size.height * 0.55,
            ),
            Radius.circular(8),
          ),
        );
    canvas.drawPath(shadowPath, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
