import 'package:example_app/core/widgets/appbar.dart';
import 'package:example_app/core/theme/theme_provider.dart';
import 'package:example_app/core/widgets/post_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoreHomePage extends StatelessWidget {
  final List<String> categories = const [
    'All',
    'Technology',
    'Design',
    'Business',
    'Health',
    'Travel',
  ];
  const StoreHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: context.background,
      appBar: FacebookAppBar(
        title: 'Flutter Addons',
        onSearchTap: () {
          // Handle search tap
        },
        onMessagesTap: () {
          // Handle messages tap
        },
        onNotificationsTap: () {
          // Handle notifications tap
        },
      ),

      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: _buildHeader(context)),
        // Sliver: Categories
        SliverToBoxAdapter(
          child: Padding(padding: 16.p, child: _buildCategoryList()),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => const PostCard(),
              childCount: 8,
            ),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: context.isMobile ? 1 : 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: context.isMobile ? 1.1 : 1.8,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      height: 220.h,
      padding: 16.p,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.r),
        gradient: LinearGradient(
          colors: [Kolors.slate300, Kolors.violet200],
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
              fontWeight: FontWeight.w600,
              color: context.primaryColor,
            ),
          ),
          SizedBox(height: 1.h),
          Text(
            "Explore top deals and new arrivals.",
            style: context.bodyLarge.copyWith(color: context.secondaryContent),
          ),
          const Spacer(),
          Row(
            spacing: 12.w,
            children: [
              FlatButton(
                icon: Icon(Icons.arrow_right_alt_outlined, size: 24.sp),
                label: "Primary",
                onPressed: () {
                  print(context.isDark);
                },
                variant: ButtonVariant.primary,
                customBorderColor: context.secondaryButton,
                background: context.primaryColor,
              ),

              FlatButton(
                label: "Save",
                icon: Icon(Icons.save),
                onPressed: () {
                  print(context.isLight);
                },
                variant: ButtonVariant.outline,
                size: ButtonSize.md,
                isRounded: true,
                isLoading: false,
                customBorderColor: Kolors.neutral900,
                elevation: 0,
              ),
            ],
          ),
          20.s,
          _buildSearchBar(context),
        ],
      ),
    ).stackedWith([
      Consumer(
        builder: (context, ref, _) {
          final manager = ref.watch(themeProvider);
          return ThemeToggleButton(manager: manager, iconSize: 24.sp);
        },
      ).positioned(top: 0, right: 16.w),
    ]);
  }

  Widget _buildSearchBar(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
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
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
      ),
      onChanged: (value) {
        // Search logic here
      },
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 36.sp,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        separatorBuilder: (_, __) => SizedBox(width: 12.sp),
        itemBuilder: (context, index) {
          final category = categories[index];
          final isSelected = index == 7;

          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (selected) {
              // Category filter logic
            },
            selectedColor: Kolors.neutral200,
            backgroundColor: context.cardBackground,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : context.bodyTextColor,
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          );
        },
      ),
    );
  }
}
