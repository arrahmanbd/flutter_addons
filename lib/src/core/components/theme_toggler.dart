part of 'package:flutter_addons/flutter_addons.dart';

class ThemeToggleButton extends StatelessWidget {
  final ThemeManager manager;
  final double iconSize;
  final bool isSystemMode;
  final Duration animationDuration;
  final Color? iconColor;
  final Color? splashColor;
  final IconData? lightIcon;
  final IconData? darkIcon;
  final IconData? systemIcon;

  const ThemeToggleButton({
    super.key,
    required this.manager,
    required this.iconSize,
    this.isSystemMode = true,
    this.animationDuration = const Duration(milliseconds: 400),
    this.iconColor,
    this.splashColor,
    this.lightIcon = Icons.wb_sunny_rounded,
    this.darkIcon = Icons.nightlight_round,
    this.systemIcon = Icons.brightness_auto,
  });

  @override
  Widget build(BuildContext context) {
    IconData icon;
    switch (manager.themeMode) {
      case ThemeMode.light:
        icon = lightIcon!;
        break;
      case ThemeMode.dark:
        icon = darkIcon!;
        break;
      case ThemeMode.system:
        icon = systemIcon!;
        break;
    }

    return IconButton(
      onPressed: isSystemMode ? manager.toggleThemeMode : manager.toggleTheme,
      tooltip: "Toggle Theme",
      iconSize: iconSize,
      splashRadius: 28,
      color: iconColor ?? Theme.of(context).iconTheme.color,
      highlightColor:
          splashColor ?? Theme.of(context).primaryColor.withValues(alpha: 0.15),
      icon: AnimatedSwitcher(
        duration: animationDuration,
        transitionBuilder:
            (child, animation) => ScaleTransition(
              scale: animation.drive(
                Tween(
                  begin: 0.7,
                  end: 1.0,
                ).chain(CurveTween(curve: Curves.easeOut)),
              ),
              child: FadeTransition(
                opacity: animation,
                child: RotationTransition(turns: animation, child: child),
              ),
            ),
        child: Icon(icon, key: ValueKey(icon), size: iconSize),
      ),
    );
  }
}
