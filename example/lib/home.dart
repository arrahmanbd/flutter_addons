import 'package:example/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'views/list_product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
  throw Exception('ok error_message',);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor.withAlpha(10),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.menu, color: context.titleColor),
          onPressed: () {
            GlassSnackbar.show(
              context,
              message: "This is a custom Snackbar!",
              duration: Duration(seconds: 4),
              //animation: SnackBarAnimation., // Choose animation
              backgroundColor: const Color(0x114489FF),
              // textStyle: TextStyle(fontSize: 16, color: Colors.white),
              // actionLabel: "Undo",
              // onActionTap: () {
              //   print("Undo Clicked!");
              // },
            );
          },
        ),
        title: Image.memory(flutterAddons.toByteData(), height: 34.h),
        actions: [
          Consumer(
            builder: (_, WidgetRef ref, __) {
              return ThemeToggleButton(
                manager: ref.watch(themeProvider),
                iconSize: 24,
                iconColor: context.titleColor,
              );
            },
          ),

          IconButton(
            icon: Icon(Icons.info_outline, color: context.titleColor),
            onPressed: () {
              GlassAlertDialog.show(
                context,
                title: "Confirmation",
                message: "Are you sure you want to change Theme?",
                confirmText: "Yes",
                onConfirm: () {
                  dbug("Confirmed!");
                },
                cancelText: "No",
                onCancel: () {
                  dbug("Cancelled!");
                },
                animation: AlertAnimation.scale, // Choose animation
                backgroundColor: context.background.withValues(alpha: .25),
                // border: Border.all(
                //   color: const Color.fromARGB(35, 39, 39, 39),
                //   width: 2,
                // ),
              );
              GlassToaster.show(
                "Theme Changed!",
                context,
                duration: GlassToaster.lengthLong,
                position: GlassToaster.bottom,
                animation: ToastAnimation.scale, // Choose animation
                backgroundColor: const Color(0xFF202020),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              );
              GlassDialog.show(
                context,
                title: "Alert",
                message: "This is a custom glassmorphic dialog.",
                icon: Icons.warning_amber_rounded,
                onConfirm:
                    () => Debug.bug(
                      'Debugging is like being the detective in a crime movie where you are also the murderer.',
                    ),
                animation: DialogAnimation.scale,
              );

              Debug.success(
                'A bug in production is just a feature users didn’t pay for.',
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _buildCard(context),
              10.s,
              Row(
                children: List.generate(
                  12,
                  (i) => Chip(label: Text('Menu $i')),
                ).separatedBy(SizedBox(width: 12.w)),
              ).scrollable(scrollDirection: Axis.horizontal),
              ListOfProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Column _buildCard(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: 16.p,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧩 Flutter Addons',
                  style: TextStyle(
                    fontSize: 24.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate(),
                SizedBox(height: 8.0.h),
                Text(
                  'This is the content of the blog post. It can be multiple lines long and will wrap accordingly.',
                  style: TextStyle(fontSize: 16.0.sp),
                ).animate(),
                10.s,
                
              ],
            ),
          ),
        ),
      ],
    );
  }
}
