part of 'package:flutter_addons/flutter_addons.dart';

/// Professional reusable Drawer widget
class UiDrawer extends StatelessWidget {
  final Widget? header;
  final List<Widget> items;
  final Widget? footer;

  // Customization
  final Color? backgroundColor;
  final double elevation;
  final ShapeBorder? shape;
  final EdgeInsetsGeometry padding;
  final Divider? separator;

  const UiDrawer({
    super.key,
    required this.items,
    this.header,
    this.footer,
    this.backgroundColor,
    this.elevation = 16,
    this.shape,
    this.padding = EdgeInsets.zero,
    this.separator,
  });

  /// Ready-made variant with a professional header (user info style)
  factory UiDrawer.standard({
    Key? key,
    required String title,
    String? subtitle,
    Widget? avatar,
    Color? headerBackground,
    required List<Widget> items,
    Widget? footer,
  }) {
    return UiDrawer(
      key: key,
      items: items,
      footer: footer,
      header: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(color: headerBackground ?? Colors.blue),
        child: Row(
          children: [
            avatar ??
                const CircleAvatar(
                  radius: 28,
                  child: Icon(Icons.person, size: 32, color: Colors.white),
                ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Compact variant (minimalist, no background color in header)
  factory UiDrawer.compact({
    Key? key,
    required String title,
    String? subtitle,
    Widget? avatar,
    required List<Widget> items,
    Widget? footer,
  }) {
    return UiDrawer(
      key: key,
      items: items,
      footer: footer,
      header: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            avatar ??
                const CircleAvatar(
                  radius: 24,
                  child: Icon(Icons.person, size: 28),
                ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null)
                    Text(
                      subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: elevation,
      backgroundColor:
          backgroundColor ??
          Theme.of(context).drawerTheme.backgroundColor ??
          Theme.of(context).scaffoldBackgroundColor,
      shape:
          shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ),
          ),
      child: SafeArea(
        child: Column(
          children: [
            if (header != null) header!,

            // Items
            Expanded(
              child: ListView.separated(
                padding: padding,
                itemCount: items.length,
                separatorBuilder:
                    (_, __) =>
                        separator ?? const Divider(height: 1, thickness: 0.5),
                itemBuilder: (_, index) => items[index],
              ),
            ),

            // Footer
            if (footer != null)
              Padding(padding: const EdgeInsets.all(8.0), child: footer!),
          ],
        ),
      ),
    );
  }
}
