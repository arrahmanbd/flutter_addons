import 'package:example/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';




// Example of ThemeEngine
final lightTheme = ThemePainter(SoulColor());
final darkTheme = ThemePainter(DarkSoul());
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UIConfig(
      frame: const Size(360, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Addons Example',
          theme: lightTheme.themeData,
          darkTheme:darkTheme.themeData,
          home: HomePage(),
        );
      },
    );
  }
}
