import 'package:example/home.dart';
import 'package:example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return UIConfig(
      frame: const Size(360, 890),
      minTextAdapt: true,
      splitScreenMode: true,
      //useNewErrorPainter: false,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Addons Example',
          theme: theme.theme.themeData,
          darkTheme: theme.darkTheme.themeData,
          themeMode: theme.mode,
          home: HomePage(),
        );
      },
    );
  }
}
