import 'package:example/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.background,
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: context.titleColor),
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Text("Flutter Addons"),
        actions: [
          Consumer(
            builder: (context, ref, child) {
              final manager = ref.watch(themeProvider);
              return ThemeToggleButton(manager: manager, iconSize: 18.sp);
            },
          ),
          2.s,
        ],
      ),
      body: SafeArea(
        child: Container(
          color: context.background,
          padding: EdgeInsets.symmetric(horizontal: 4.pw),
          child: ListView(
            children: [
              SizedBox(height: 2.ph),
              // Intro Card / Banner
              Container(
                height: 25.ph,
                width: double.infinity,
                padding: EdgeInsets.all(4.pw),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.pw),
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
                    SizedBox(height: 1.ph),
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

              SizedBox(height: 3.ph),

              // Category Scroll
              SizedBox(
                height: 18.ph,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (_, __) => SizedBox(width: 3.pw),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 22.pw,
                      padding: EdgeInsets.all(2.pw),
                      decoration: BoxDecoration(
                        color: context.cardBackground,
                        borderRadius: BorderRadius.circular(2.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2.dp,
                            offset: Offset(0, 1.dp),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.category,
                            size: 32.sp,
                            color: context.primaryColor,
                          ),
                          SizedBox(height: 1.ph),
                          Text(
                            "Category",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: context.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: 3.ph),

              // Product Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      Device.screenType == ScreenType.tablet ? 3 : 2,
                  crossAxisSpacing: 3.pw,
                  mainAxisSpacing: 3.ph,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(3.pw),
                    decoration: BoxDecoration(
                      color: context.cardBackground,
                      borderRadius: BorderRadius.circular(2.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2.dp,
                          offset: Offset(0, 1.dp),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 15.ph,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.pw),
                            color: context.secondaryButton,
                          ),
                        ),
                        SizedBox(height: 1.5.ph),
                        Text("Product Name", style: context.bodyLarge),
                        SizedBox(height: 0.5.ph),
                        Text(
                          "\$49.99",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.ph),
                        Text(
                          "Short description of the product goes here.",
                          style: context.bodyMedium,
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 4.ph),
            ],
          ),
        ),
      ),
    );
  }
}
