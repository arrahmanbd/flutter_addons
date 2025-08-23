part of 'package:flutter_addons/flutter_addons.dart';

class UiThemeSwitch extends StatelessWidget {
  final ThemeManager manager;
  final double iconSize;
  final Duration animationDuration;
  final Color? activeColor;
  final Color? inactiveColor;
  final Color? thumbColor;
  final IconData? lightIcon;
  final IconData? darkIcon;
  final IconData? systemIcon;
  final bool useSlideSwitch;
  final bool enableSystemMode; // NEW FIELD

  const UiThemeSwitch({
    super.key,
    required this.manager,
    this.iconSize = 24,
    this.animationDuration = const Duration(milliseconds: 400),
    this.activeColor,
    this.inactiveColor,
    this.thumbColor,
    this.lightIcon = Icons.wb_sunny_rounded,
    this.darkIcon = Icons.nightlight_round,
    this.systemIcon = Icons.brightness_auto,
    this.useSlideSwitch = false,
    this.enableSystemMode = true, // default true
  });

  factory UiThemeSwitch.slideSwitch({
    required ThemeManager manager,
    Color? activeColor,
    Color? inactiveColor,
    Color? thumbColor,
    Duration animationDuration = const Duration(milliseconds: 300),
  }) {
    return UiThemeSwitch(
      manager: manager,
      useSlideSwitch: true,
      activeColor: activeColor,
      inactiveColor: inactiveColor,
      thumbColor: thumbColor,
      animationDuration: animationDuration,
      enableSystemMode: false, // slide switch always only light/dark
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: manager,
      builder: (_, __) =>
          useSlideSwitch ? _buildSlideSwitch(context) : _buildIconSwitch(context),
    );
  }

  /// Icon toggle
  Widget _buildIconSwitch(BuildContext context) {
    final icon = _getIcon(manager.themeMode);

    return IconButton(
      onPressed: enableSystemMode
          ? manager.toggleThemeMode
          : manager.toggleTheme, // toggle only light/dark if system disabled
      tooltip: "Toggle Theme",
      iconSize: iconSize,
      splashRadius: 28,
      color: Theme.of(context).iconTheme.color,
      icon: AnimatedSwitcher(
        duration: animationDuration,
        transitionBuilder: (child, animation) => ScaleTransition(
          scale: animation.drive(
            Tween(begin: 0.7, end: 1.0).chain(CurveTween(curve: Curves.easeOut)),
          ),
          child: FadeTransition(opacity: animation, child: child),
        ),
        child: Icon(icon, key: ValueKey(manager.themeMode), size: iconSize),
      ),
    );
  }

  /// Slide switch toggle: only Light ↔ Dark
  Widget _buildSlideSwitch(BuildContext context) {
    return Switch(
      value: manager.isDarkMode,
      onChanged: (_) => manager.toggleTheme(),
      activeColor: activeColor,
      inactiveThumbColor: thumbColor,
      inactiveTrackColor: inactiveColor,
      activeTrackColor: activeColor,
    );
  }

  /// Decide which icon to show
  IconData _getIcon(ThemeMode mode) {
    if (!enableSystemMode) {
      // Only light/dark icons
      return manager.isDarkMode ? darkIcon! : lightIcon!;
    }

    switch (mode) {
      case ThemeMode.light:
        return lightIcon!;
      case ThemeMode.dark:
        return darkIcon!;
      case ThemeMode.system:
        return systemIcon!;
    }
  }
}
