part of 'package:flutter_addons/flutter_addons.dart';

//bootstrap breadcrumb

class BreadConstantData {
  final double containerRadius;
  final double cardRadius;
  final double buttonRadius;

  final BreadcrumbItem? defaultBreadCrumbItem;

  BreadConstantData({
    this.containerRadius = 4,
    this.cardRadius = 4,
    this.buttonRadius = 4,
    this.defaultBreadCrumbItem,
  });
}

class BreadConstant {
  static BreadConstantData _constant = BreadConstantData();

  static BreadConstantData get constant => _constant;

  static setConstant(BreadConstantData constantData) {
    _constant = constantData;
  }
}

/// Represents each breadcrumb item.
class BreadcrumbItem {
  final String name;
  final bool active;
  final String? route;

  BreadcrumbItem({required this.name, this.active = false, this.route});
}

/// reusable breadcrumb widget.
class Breadcrumb extends StatelessWidget {
  final List<BreadcrumbItem> _items;
  final bool hideOnMobile;

  /// Optional custom navigation callback.
  /// If provided, this overrides default GoRouter/ Navigator behavior.
  final void Function(BuildContext context, String route)? onNavigate;

  Breadcrumb({
    super.key,
    required List<BreadcrumbItem> children,
    this.hideOnMobile = true,
    this.onNavigate,
  }) : _items = [
         if (BreadConstant.constant.defaultBreadCrumbItem != null)
           BreadConstant.constant.defaultBreadCrumbItem!,
         ...children,
       ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> list = [];

    for (int i = 0; i < _items.length; i++) {
      final item = _items[i];

      final textWidget = Text(
        item.name,
        style: TextStyle(
          fontWeight: item.active ? FontWeight.w600 : FontWeight.w500,
          fontSize: 13,
          color:
              item.active
                  ? Theme.of(context).colorScheme.onSurface
                  : item.route != null
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onSurfaceVariant,
        ),
      );

      if (item.active || item.route == null) {
        list.add(textWidget);
      } else {
        list.add(
          InkWell(
            onTap: () => _handleTap(context, item.route!),
            child: textWidget,
          ),
        );
      }

      if (i < _items.length - 1) {
        list.add(const SizedBox(width: 8));
        list.add(const Icon(Icons.chevron_right, size: 16));
        list.add(const SizedBox(width: 8));
      }
    }

    return LayoutBuilder(
      builder: (_, constraints) {
        final isMobile = constraints.maxWidth < 600; // Adjust as needed
        return isMobile && hideOnMobile
            ? const SizedBox()
            : Row(mainAxisSize: MainAxisSize.min, children: list);
      },
    );
  }

  void _handleTap(BuildContext context, String route) {
    if (onNavigate != null) {
      onNavigate!(context, route);
    } else {
      // Try GoRouter first

      // Fallback to Navigator if GoRouter navigation fails
      Navigator.of(context).pushNamed(route);
    }
  }
}
