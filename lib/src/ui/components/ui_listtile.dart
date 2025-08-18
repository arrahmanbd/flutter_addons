part of 'package:flutter_addons/flutter_addons.dart';

/// A professional and customizable list tile for menus, settings, and drawers.
class UiListTile extends StatelessWidget {
  final Widget? leading;
  final String title;
  final TextStyle? titleStyle; // Optional custom style for title
  final String? subtitle;
  final TextStyle? subtitleStyle; // Optional custom style for subtitle
  final Widget? trailing;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry contentPadding;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;
  final bool enabled;
  final bool dense;

  const UiListTile({
    super.key,
    required this.title,
    this.leading,
    this.titleStyle,
    this.subtitle,
    this.subtitleStyle,
    this.trailing,
    this.onTap,
    this.contentPadding = const EdgeInsets.symmetric(
      horizontal: 16,
      vertical: 12,
    ),
    this.backgroundColor,
    this.borderRadius,
    this.enabled = true,
    this.dense = false,
  });

  /// Standard professional list tile
  factory UiListTile.standard({
    Key? key,
    required String title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    bool enabled = true,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return UiListTile(
      key: key,
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: onTap,
      enabled: enabled,
      backgroundColor: backgroundColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      borderRadius: BorderRadius.circular(12),
      dense: false,
      titleStyle:
          titleStyle ??
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      subtitleStyle:
          subtitleStyle ?? const TextStyle(fontSize: 13, color: Colors.grey),
    );
  }

  /// Compact variant for drawers, menus, or dense lists
  factory UiListTile.compact({
    Key? key,
    required String title,
    String? subtitle,
    Widget? leading,
    Widget? trailing,
    VoidCallback? onTap,
    bool enabled = true,
    Color? backgroundColor,
    TextStyle? titleStyle,
    TextStyle? subtitleStyle,
  }) {
    return UiListTile(
      key: key,
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,
      onTap: onTap,
      enabled: enabled,
      backgroundColor: backgroundColor,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      borderRadius: BorderRadius.circular(8),
      dense: true,
      titleStyle:
          titleStyle ??
          const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      subtitleStyle:
          subtitleStyle ?? const TextStyle(fontSize: 12, color: Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    final effectiveTitleStyle =
        titleStyle ??
        Theme.of(context).textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.w500,
          color: enabled ? null : Colors.grey,
        );

    final effectiveSubtitleStyle =
        subtitleStyle ??
        Theme.of(context).textTheme.bodySmall?.copyWith(
          color: enabled ? Colors.grey[600] : Colors.grey[400],
        );

    return Material(
      color: backgroundColor ?? Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(12),
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(12),
        onTap: enabled ? onTap : null,
        child: Padding(
          padding: contentPadding,
          child: Row(
            children: [
              if (leading != null) ...[leading!, const SizedBox(width: 12)],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment:
                      dense
                          ? MainAxisAlignment.center
                          : MainAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: effectiveTitleStyle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle != null)
                      Text(
                        subtitle!,
                        style: effectiveSubtitleStyle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                  ],
                ),
              ),
              if (trailing != null) ...[const SizedBox(width: 8), trailing!],
            ],
          ),
        ),
      ),
    );
  }
}
