import 'package:example/example.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

void main() {
  runApp(MyApp());
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.dense2014.apply(fontSizeFactor: 1.sp),
          ),
          home: HomePage(),
        );
      },
    );
  }
}
