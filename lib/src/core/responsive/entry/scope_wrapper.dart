// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

// Still in experimental phase, not yet part of the public API.
// This code is subject to change in future releases [3.0.0].
// ignore: unused_element
class _ScopeWrapper extends StatelessWidget {
  const _ScopeWrapper({
    required this.wrapped,
    required this.debugBanner,
    required this.showGrid,
    required this.columnCount,
  });

  final Directionality wrapped;
  final bool debugBanner;
  final bool showGrid;
  final int columnCount;

  @override
  Widget build(BuildContext context) {
    Widget content =
        showGrid
            ? PixelPerfectGridOverlay(
              visible: true,
              columns: columnCount,
              child: wrapped,
            )
            : wrapped;

    return WidgetsApp(
      debugShowCheckedModeBanner: false, // hide default banner
      onGenerateRoute:
          (settings) => PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => content,
          ),
      builder: (context, widget) {
        return Stack(
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            if (widget != null) Positioned.fill(child: widget),
            if (debugBanner)
              Positioned(
                top: 16,
                right: -48,
                child: _CustomDebugBanner(text: 'DEV', version: '3.0.0-dev'),
              ),
          ],
        );
      },
      color: Colors.white,
    );
  }
}

class _CustomDebugBanner extends StatelessWidget {
  final String text;
  final String version;

  const _CustomDebugBanner({required this.text, required this.version});

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
      child: SizedBox(
        width: 150,
        height: 24,
        child: Container(
          decoration: BoxDecoration(
            color: Kolors.red700,
            borderRadius: BorderRadius.circular(2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Kolors.red800,
                Color.lerp(Kolors.red700, Colors.black, 0.1)!,
              ],
            ),
          ),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 10,
                    letterSpacing: 1.5,
                    height: 1.2,
                  ),
                ),
                Text(
                  version,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontWeight: FontWeight.w500,
                    fontSize: 8,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
