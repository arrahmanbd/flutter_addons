import 'package:flutter/material.dart';

// Still in experimental phase, not yet part of the public API.
// This code is subject to change in future releases [3.0.0].

class ScopeWrapper extends StatelessWidget {
  final Widget child;

  const ScopeWrapper({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      color: const Color(0xFF2196F3), // primary color (required)
      debugShowCheckedModeBanner: false, // disable default banner
      onGenerateRoute:
          (settings) => PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => child,
          ),
      builder: (context, widget) {
        // Wrap with Directionality and your custom banner
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Stack(
            children: [
              if (widget != null) widget,
              // Custom banner overlay, conditionally visible
              Positioned(top: 0, left: 0, right: 0, child: _CustomBanner()),
            ],
          ),
        );
      },
      // Add other properties as needed, like locale, navigatorObservers, etc.
    );
  }
}

// Example of a simple custom banner widget
class _CustomBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Show banner only in debug mode (optional)
    bool showBanner = false;
    assert(() {
      showBanner = true;
      return true;
    }());

    if (!showBanner) return const SizedBox.shrink();

    return Container(
      color: const Color(0xAAFF0000),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: const Text(
        '🚧 Custom Debug Banner',
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }
}
