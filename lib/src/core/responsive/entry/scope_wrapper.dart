// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'package:flutter_addons/flutter_addons.dart';

/// 🏗️  PRODUCTION BEHAVIOR NOTES
///
/// ## Release Mode Behavior
/// • Returns wrapper component only - no widget rendering that could cause localization errors
/// • Localization dependency issues are completely avoided in production builds
///
/// ## Debug Mode Considerations
/// • If alerts are not appearing during development:
///   → Set `enableDebugLog` to `false` when working with alert dialogs
///   → This is a debug-only constraint for cleaner development experience
///
/// ## Safety & Optimization
/// • ✅ Production-safe implementation
/// • ✅ Clean architecture with no side effects
/// • ✅ Fully optimized for release environments
/// • ✅ No localization conflicts in deployed applications
class _ScopeWrapper extends StatelessWidget {
  const _ScopeWrapper({
    required this.wrapped,
    required this.debugBanner,
    required this.showGrid,
    required this.columnCount,
    required this.version,
  });

  final Directionality wrapped;
  final bool debugBanner;
  final bool showGrid;
  final int columnCount;
  final String version;

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
      debugShowCheckedModeBanner: false,
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
                top: 20,
                right: -52,
                child: _DevelopmentBanner(version:  version,),
              ),
          ],
        );
      },
      color: Colors.white,
    );
  }
}

class _DevelopmentBanner extends StatelessWidget {
  final String version;
  const _DevelopmentBanner({
    required this.version,
  });


  @override
  Widget build(BuildContext context) {
    bool showBanner = false;
    assert(() {
      showBanner = true;
      return true;
    }());

    if (!showBanner) return const SizedBox.shrink();

    return Transform.rotate(
      angle: math.pi / 4,
      child: Container(
        width: 160,
        height: 28,
        decoration: BoxDecoration(
          // color: Colors.red,
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.red, Colors.redAccent],
          ),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 6,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'DEV',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 10,
                  letterSpacing: 1.5,
                  height: 1.2,
                ),
              ),
              Text(
                version,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.85),
                  fontWeight: FontWeight.w500,
                  fontSize: 8,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
