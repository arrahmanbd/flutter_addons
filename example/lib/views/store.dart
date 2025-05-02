import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class StoreHomePage extends StatelessWidget {
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: context.titleColor),
          onPressed: () {
            // Handle menu button press
          },
        ),
        title: Text("Orkitt Store"),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: context.titleColor),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: ListView(
            children: [
              SizedBox(height: 2.h),
              // Intro Card / Banner
              Container(
                height: 25.h,
                width: double.infinity,
                padding: EdgeInsets.all(4.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.w),
                  gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.deepPurple],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome to Orkitt Store!",
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Text(
                      "Explore top deals and new arrivals.",
                      style: TextStyle(fontSize: 16.sp, color: Colors.white70),
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

              SizedBox(height: 3.h),

              // Category Scroll
              SizedBox(
                height: 12.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  separatorBuilder: (_, __) => SizedBox(width: 3.w),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 22.w,
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2.w),
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
                          SizedBox(height: 1.h),
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

              SizedBox(height: 3.h),

              // Product Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      Device.screenType == ScreenType.tablet ? 3 : 2,
                  crossAxisSpacing: 3.w,
                  mainAxisSpacing: 3.h,
                  childAspectRatio: 0.7,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(3.w),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2.w),
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
                          height: 15.h,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.w),
                            color: Colors.grey[300],
                          ),
                        ),
                        SizedBox(height: 1.5.h),
                        Text(
                          "Product Name",
                          style: context.bodyLarge.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 0.5.h),
                        Text(
                          "\$49.99",
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 4.h),
            ],
          ),
        ),
      ),
    );
  }
}
