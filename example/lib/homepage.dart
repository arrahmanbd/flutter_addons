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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _buildHeaderCard(context)),
          
          SliverPadding(
            padding: 16.p,
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return _buildProductCard(context);
              }, childCount: 8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.adaptive.grid.crossAxisCount,
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: context.adaptive.cardWithImageRatio,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _buildProductCard(BuildContext context) {
    return Container(
      padding: 4.p,
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
            height: 150.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2.pw),
              color: context.secondaryButton,
            ),
          ),
          SizedBox(height: 20.h),
          Text("Product Name", style: context.bodyLarge),
          SizedBox(height: 5.h),
          Text(
            "\$49.99",
            style: TextStyle(
              fontSize: 15.sp,
              color: Colors.deepPurple,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            "Short description of the product goes here.",
            style: context.bodyMedium,
          ),
        ],
      ),
    );
  }

  Container _buildHeaderCard(BuildContext context) {
    return Container(
      height: 20.ph, // 20% height of screen
      padding: EdgeInsets.all(4.pw),
      decoration: BoxDecoration(
       // borderRadius: BorderRadius.circular(2.r),
        gradient: LinearGradient(
          colors: [
            const Color.fromARGB(255, 204, 221, 253),
            const Color.fromARGB(255, 214, 198, 241),
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
          Text("Explore top deals and new arrivals.", style: context.bodyLarge),
          Spacer(),
          Row(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Explore')),
              4.s,
              OutlinedButton(onPressed: () {}, child: Text('Signup')),
            ],
          ),
        ],
      ),
    );
  }
}
