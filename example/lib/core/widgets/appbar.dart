import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class FacebookAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onSearchTap;
  final VoidCallback? onPrfileTap;
  final VoidCallback? onNotificationsTap;

  const FacebookAppBar({
    super.key,
    this.title = '',
    this.onSearchTap,
    this.onPrfileTap,
    this.onNotificationsTap,
  });

  @override
  Size get preferredSize => Size.fromHeight(48.h);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 0,
      color: context.primaryColor,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: preferredSize.height,
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Row(
            children: [
              // Logo or Title
              Text(
                title,
                style: context.titleSmall.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1.2,
                ),
              ),

              const Spacer(),

              // Search icon (tap to open search)
              IconButton(
                icon: const Icon(Icons.settings_input_component_outlined, color: Colors.white),
                onPressed: onSearchTap,
                tooltip: 'Search',
              ),

              // Notifications icon
              IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: onNotificationsTap,
                tooltip: 'Notifications',
              ),

              // Messages icon
              IconButton(
                icon: const Icon(
                  Icons.verified_user_outlined,
                  color: Colors.white,
                ),
                onPressed: onPrfileTap,
                tooltip: 'Messages',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
