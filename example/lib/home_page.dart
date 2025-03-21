import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

import 'list_product.dart';
import 'next_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.primaryColor,
        centerTitle: true,
        title: Image.memory(flutterAddons.toByteData(), height: 34.h),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Debug.bug(
                'Debugging is like being the detective in a crime movie where you are also the murderer.',
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
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        NextScreen().go(context);
                        Debug.warning(
                          'Your code is like your ex. You wrote it with love, now it only brings pain🗿',
                        );
                      },
                      child: Text('Explore'),
                    ),
                    10.s,
                    OutlinedButton(
                      onPressed: () {
                        Debug.info(
                          'Your code doesn’t work? Just add more comments. At least your future self will suffer with context',
                        );

                        Debug.error(
                          'Every time you fix a bug, two new ones spawn. That’s called feature growth.',
                        );
                      },
                      child: Text('Signup'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
