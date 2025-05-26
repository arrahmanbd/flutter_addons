import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class FacebookAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onMessagesTap;
  final VoidCallback? onNotificationsTap;

  const FacebookAppBar({
    super.key,
    this.title = 'My Blog',
    this.onSearchTap,
    this.onMessagesTap,
    this.onNotificationsTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(56.h);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 0,
      color: Colors.blueAccent,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: preferredSize.height,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Row(
            children: [
              // Logo or Title
              Text(
                title,
                style: theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),

              const Spacer(),

              // Search icon (tap to open search)
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: onSearchTap,
                tooltip: 'Search',
              ),

              // Messages icon
              IconButton(
                icon: const Icon(Icons.message_outlined, color: Colors.white),
                onPressed: onMessagesTap,
                tooltip: 'Messages',
              ),

              // Notifications icon
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: onNotificationsTap,
                tooltip: 'Notifications',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
