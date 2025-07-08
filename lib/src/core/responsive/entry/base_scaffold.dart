part of 'package:flutter_addons/flutter_addons.dart';

abstract class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  /// ≥576 && <768 → Mobile
  Widget buildMobile(BuildContext context);

  /// ≥768 && <992 → Tablet
  Widget buildTablet(BuildContext context);

  /// ≥992 → Desktop
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    if (width < 768) {
      // sm and below
      return buildMobile(context);
    } else if (width < 992) {
      // md
      return buildTablet(context);
    } else {
      // lg and above
      return buildDesktop(context);
    }
  }
}
