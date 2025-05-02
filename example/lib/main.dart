import 'package:example/home.dart';
import 'package:example/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      builder: (context, orientation, screenType) {
        return MetaApp();
      },
      designSize: Size(375, 812), // iPhone 12 Pro Max
      errorScreenStyle: ErrorScreenStyle.blueCrash,
    );
  }
}

class MetaApp extends ConsumerWidget {
  const MetaApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Addons Example',
      theme: theme.lightTheme,
      darkTheme: theme.darkTheme,
      themeMode: theme.themeMode,
      home: HomePage(),
    );
  }
}
