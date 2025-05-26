import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

import 'appbar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveApp(
      designSize: const Size(375, 812), // Reference design size
      scaleMode: ScaleMode.design, // Use design scaling
      debugLog: true,
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Addons Example',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.light,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<String> categories = const [
    'All',
    'Technology',
    'Design',
    'Business',
    'Health',
    'Travel',
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: FacebookAppBar(
        title: 'My Blog',
        onSearchTap: () => print('Search tapped'),
        onMessagesTap: () => print('Messages tapped'),
        onNotificationsTap: () => print('Notifications tapped'),
      ),
      body: Padding(
        padding: 16.px,
        child: CustomScrollView(
          slivers: [
            // Sliver: Search Bar
            SliverToBoxAdapter(
              child: Padding(padding: 16.py, child: _buildSearchBar(theme)),
            ),

            // Sliver: Categories
            SliverToBoxAdapter(
              child: Padding(padding: 16.py, child: _buildCategoryList()),
            ),

            // Sliver: Header
            SliverToBoxAdapter(
              child: Padding(
                padding: 16.py,
                child: Label(
                  'Discover Latest Posts!',
                  style: 'text-lg text-gray-500 text-left font-bold',
                ),
              ),
            ),

            // Sliver: Grid of posts
            SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (context, index) => const PostCard(),
                childCount: 6,
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: context.isMobile ? 1 : 3,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: context.isMobile ? 1.2 : 1.8,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new post
        },
        tooltip: 'Add New Post',
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildSearchBar(ThemeData theme) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Search articles, topics...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: theme.colorScheme.onSecondary,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
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
          final isSelected = index == 0;

          return ChoiceChip(
            label: Text(category),
            selected: isSelected,
            onSelected: (selected) {
              // Category filter logic
            },
            selectedColor: Colors.blueAccent,
            backgroundColor: Colors.grey.shade200,
            labelStyle: TextStyle(
              color: isSelected ? Colors.white : Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12),
          );
        },
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: .5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 120.h,
            child: Image.network(
              'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Flutter Responsive Blog Card',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.sp),
                Text(
                  'Build beautiful and responsive blog cards easily with Flutter and flutter_addons.',
                  style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),
                ),
                SizedBox(height: 16.sp),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16.rs,
                      backgroundImage: NetworkImage(
                        'https://randomuser.me/api/portraits/men/32.jpg',
                      ),
                    ),
                    8.s,
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.calendar_today, size: 14.sp, color: Colors.grey),
                    SizedBox(width: 4.sp),
                    Text(
                      'Jun 10, 2024',
                      style: TextStyle(fontSize: 12.sp, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
