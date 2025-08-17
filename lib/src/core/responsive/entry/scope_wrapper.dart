part of 'package:flutter_addons/flutter_addons.dart';

// Still in experimental phase, not yet part of the public API.
// This code is subject to change in future releases [3.0.0].
class _ScopeWrapper extends StatelessWidget {
  const _ScopeWrapper({required this.wrapped});

  final Directionality wrapped;

  @override
  Widget build(BuildContext context) {
    return WidgetsApp(
      debugShowCheckedModeBanner: true, // hide default banner
      onGenerateRoute:
          (settings) => PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => wrapped,
          ),
      builder: (context, widget) {
        return Stack(
          fit: StackFit.expand, // Make the Stack fill the parent
          clipBehavior: Clip.none, // Allow overlays to overflow if needed
          children: [
            // Main widget fills the entire available space
            if (widget != null) Positioned.fill(child: widget),
            // Custom banner overlay, conditionally visible
            Positioned(top: 25, right: -30, child: _CustomDebugBanner()),
          ],
        );
      },
      color: Colors.white,
    );
  }
}

class _CustomDebugBanner extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const _CustomDebugBanner({
    Key? key,
    this.text = 'F-ADDON',
    this.backgroundColor = Colors.blue,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool showBanner = false;
    assert(() {
      showBanner = true;
      return true;
    }());
    if (!showBanner) return const SizedBox.shrink();

    return Transform.rotate(
      angle: math.pi / 4, // 45 degrees
      child: Container(
        color: backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 4),
        child: Text(
          text,
          style:
              textStyle ??
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 10,
                letterSpacing: 1.5,
              ),
        ),
      ),
    );
  }
}
