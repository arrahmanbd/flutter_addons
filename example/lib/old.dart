
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'homepage.dart';
import 'theme/theme_provider.dart';

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
      designSize: Size(375, 812), 
      errorScreenStyle: ErrorScreenStyle.dessert,
      scaleMode: ScaleMode.design
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
      home: StoreHomePage(),
      navigatorKey: NavigatorManager.navigatorKey,
    );
  }
}

// This is a simple example of a design using Flutter Addons
// It demonstrates how to create a responsive layout with reference designSize
class DesignExample extends StatelessWidget {
  const DesignExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 2.w),
              // Intro Card / Banner
              Container(
                height: 300.w,
                width: double.infinity,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(
                        255,
                        204,
                        221,
                        253,
                      ).withValues(alpha: .75),
                      const Color.fromARGB(
                        255,
                        214,
                        198,
                        241,
                      ).withValues(alpha: .65),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Flutter Addons!",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: context.primaryColor,
                      ),
                    ),
                    SizedBox(height: 1.w),
                    Text(
                      "Explore top deals and new arrivals.",
                      style: context.bodyLarge,
                    ),
                    Spacer(),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            dbug(
                              'Your code is like your ex. You wrote it with love, now it only brings pain🗿',
                            );
                          },
                          child: Text('Explore'),
                        ),
                        4.s,
                        OutlinedButton(onPressed: () {}, child: Text('Signup')),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30.w),
              Container(
                width: 250.w, //responsive width
                height: 250.w, //responsive height
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(25.rs), // responsive size
                ),
                child: Center(
                  child: Text(
                    'This is a Responsive Text',
                    style: TextStyle(
                      fontSize: 22.sp, // responsive font-size
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
