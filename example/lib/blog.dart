import 'package:example_app/core/theme/theme_provider.dart';
import 'package:example_app/core/widgets/appbar.dart';
import 'package:example_app/core/widgets/post_card.dart';
import 'package:example_app/ui.dart';
import 'package:example_app/users.dart';
import 'package:example_app/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogPage extends StatelessWidget {
  const BlogPage({super.key});

  static const List<String> categories = [
    'All',
    'Technology',
    'Design',
    'Business',
    'Health',
    'Travel',
  ];

  @override
  Widget build(BuildContext context) {
    final aspectRatio = context.isMobile? .78 : 1.12;
    return Scaffold(
      backgroundColor: context.background,
      appBar: FacebookAppBar(
        title: 'Flutter Addons',
        // ignore: avoid_print
        onSearchTap: () {
          context.push(UiExamples());
        },
        onPrfileTap: () {
          context.push(UserScreen());
        },
        onNotificationsTap: () {},
      ),
      body: Padding(
        padding: 24.p,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            SizedBox(height: 24.h),
            _buildCategoryList(context),
            SizedBox(height: 16.h),
          
            ResponsiveBuilder(
              builder: (screen) {
                if (screen.isLandscape) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 8, // or dynamic
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: aspectRatio,
                    ),
                    itemBuilder: (context, index) => PostCard().onTap(() {
                      // Dummy post example
                      dummyPost.launch(context);
                    }),
                  );
                }
                return GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8, // or dynamic
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: aspectRatio,
                  ),
                  itemBuilder: (context, index) => PostCard().onTap(() {
                    // Dummy post example
                    dummyPost.launch(context);
                  }),
                );
              },
            ),
          ],
        ),
      ).scrollable(physics: const BouncingScrollPhysics()),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 250.h,
      padding: 16.p,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        gradient: LinearGradient(
          colors: [Kolors.slate200, Kolors.violet200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to Flutter Addons!",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: context.primaryColor,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Explore top deals and new arrivals.",
                style: context.bodyLarge.copyWith(
                  color: context.secondaryContent,
                ),
              ),
              SizedBox(height: 16.h),
              _buildButtons(context),
              SizedBox(height: 20.h),
              _buildSearchBar(context),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Consumer(
              builder: (context, ref, _) {
                final manager = ref.watch(themeProvider);
                return ThemeToggleButton(manager: manager, iconSize: 24.sp);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      spacing: 12,
      children: [
        UiFlatButton(
          label: "Primary",
          icon: Icon(Icons.arrow_right_alt_outlined, size: 24.sp),
          onPressed: () => dummyPost.launch(context),
          backgroundColor: context.primaryColor,
        ),
        UiFlatButton.outlined(
          label: "Save",
          icon: const Icon(Icons.save_alt),
          onPressed: () => print("Outlined clicked"),
        ),

        UiFlatButton.text(
          label: "Cancel",
          onPressed: () => print("Text clicked"),
        ),
      ],
    ).scrollable(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    final outline = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100.r),
      borderSide: BorderSide.none,
    );
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search articles, topics...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: context.cardBackground,
        contentPadding: 8.py,
        border: outline,
        enabledBorder: outline,
        focusedBorder: outline,
      ),
      onChanged: (value) {},
    );
  }

  Widget _buildCategoryList(BuildContext context) {
    return SizedBox(
      height: 36.sp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.w),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = false;

          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (_) {},
            selectedColor: Kolors.neutral200,
            backgroundColor: context.cardBackground,
            labelStyle: TextStyle(
              color: context.bodyTextColor,
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          );
        },
      ),
    );
  }
}
