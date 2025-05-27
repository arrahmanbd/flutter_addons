part of 'package:flutter_addons/flutter_addons.dart';

abstract class AdaptiveLayout {
  Widget buildXs(BuildContext context); // Extra small
  Widget buildSm(BuildContext context); // Small
  Widget buildMd(BuildContext context); // Medium
  Widget buildLg(BuildContext context); // Large
  Widget buildXl(BuildContext context); // Extra large
}

mixin Responsive {
  Widget buildXs(BuildContext context) => const SizedBox();
  Widget buildSm(BuildContext context) => buildXs(context);
  Widget buildMd(BuildContext context) => buildSm(context);
  Widget buildLg(BuildContext context) => buildMd(context);
  Widget buildXl(BuildContext context) => buildLg(context);
}

class ResponsiveView extends StatelessWidget {
  final Responsive layout;

  const ResponsiveView({super.key, required this.layout});

  @override
  Widget build(BuildContext context) {
    if (context.isSm) return layout.buildSm(context);
    if (context.isMd) return layout.buildMd(context);
    if (context.isLg) return layout.buildLg(context);

    return layout.buildXl(context);
  }
}
