import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

// Dummy post example
final dummyPost = PostDetailsScreen(
  title: "Flutter Addons: Elevate Your UI",
  author: "Jane Doe",
  time: "2 hours ago",
  coverImage:
      "https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80",
  content:
      "Discover how Flutter Addons can help you build beautiful and responsive UIs with ease. "
      "From custom widgets to advanced layout utilities, this package streamlines your development process. "
      "Explore the features, see code samples, and get inspired to create your next amazing Flutter app!",
);

class PostDetailsScreen extends StatelessWidget {
  final String title;
  final String author;
  final String time;
  final String coverImage;
  final String content;

  const PostDetailsScreen({
    super.key,
    required this.title,
    required this.author,
    required this.time,
    required this.coverImage,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
        ),
        // backgroundColor: context.primaryColor,
        elevation: 0,
        // iconTheme: IconThemeData(color: context.primaryColor),
      ),
      backgroundColor: context.background,
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.network(
                coverImage,
                width: double.infinity,
                height: 180.h,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
                color: context.primaryColor,
              ),
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Icon(
                  Icons.person,
                  size: 16.sp,
                  color: context.secondaryContent,
                ),
                SizedBox(width: 4.w),
                Text(
                  author,
                  style: context.bodyMedium.copyWith(
                    color: context.secondaryContent,
                  ),
                ),
                SizedBox(width: 16.w),
                Icon(
                  Icons.access_time,
                  size: 16.sp,
                  color: context.secondaryContent,
                ),
                SizedBox(width: 4.w),
                Text(
                  time,
                  style: context.bodyMedium.copyWith(
                    color: context.secondaryContent,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Text(content, style: context.bodyLarge.copyWith(fontSize: 16.sp)),
          ],
        ),
      ).scrollable(),
    );
  }
}
