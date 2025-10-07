import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: context.surfaceElevated,
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
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[300],
                child: Icon(Icons.broken_image, size: 48),
              ),
            ),
          ),
          Padding(
            padding: 16.p,
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
                  style: context.bodyMedium,
                ),
                SizedBox(height: 16.sp),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 16.r,
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
