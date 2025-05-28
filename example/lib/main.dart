import 'package:example_app/home.dart';
import 'package:example_app/core/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScope(
      enableDebugLogging: true,
      designFrame: Frame(width: 320, height: 812),
      scaleMode: ScaleMode.design,
      layoutBuilder: (context, orientation, screenType) {
        return SoulApp();
      },
    );
  }
}

class SoulApp extends ConsumerWidget {
  const SoulApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Addons Example',
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.themeMode,
      home: const StoreHomePage(),
    );
  }
}
