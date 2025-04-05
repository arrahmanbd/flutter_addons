import 'package:example/home.dart';
import 'package:example/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  // Ensure ScreenUtils is initialized
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return UIConfig(
      frame: UIUtils.getFrame(context),
      minTextAdapt: true,
      splitScreenMode: true,
      //useNewErrorPainter: false,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Addons Example',
          theme: theme.lightTheme,
          darkTheme: theme.darkTheme,
          themeMode: theme.themeMode,
          home: HomePage(),
        );
      },
    );
  }
}
