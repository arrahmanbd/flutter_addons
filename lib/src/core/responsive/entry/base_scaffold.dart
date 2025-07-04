part of 'package:flutter_addons/flutter_addons.dart';

abstract class ResponsivePage extends StatelessWidget {
  const ResponsivePage({super.key});

  Widget buildMobile(BuildContext context);
  Widget buildTablet(BuildContext context);
  Widget buildDesktop(BuildContext context);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return buildMobile(context);
        } else if (constraints.maxWidth < 1024) {
          return buildTablet(context);
        } else {
          return buildDesktop(context);
        }
      },
    );
  }
}
