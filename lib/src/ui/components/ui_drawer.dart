part of 'package:flutter_addons/flutter_addons.dart';

class UiDrawer extends StatelessWidget {
  final List<Widget> items;
  final Widget? header;

  const UiDrawer({super.key, required this.items, this.header});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          if (header != null) DrawerHeader(child: header!),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, index) => items[index],
            ),
          ),
        ],
      ),
    );
  }
}
