import 'package:example/list_product.dart';
import 'package:example/secrren.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.memory(flutterAddons.toByteData(), height: 34.h),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              Debug.bug(
                'Debugging is like being the detective in a crime movie where you are also the murderer.',
              );
              Debug.info(
                'Your code doesn’t work? Just add more comments. At least your future self will suffer with context',
              );
              Debug.warning(
                'Your code is like your ex. You wrote it with love, now it only brings pain🗿',
              );
              Debug.error(
                'Every time you fix a bug, two new ones spawn. That’s called feature growth.',
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
              Container(
                padding: 4.p,
                height: 150.h,
                width: 420.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(testBackground.toByteData()),
                    fit: BoxFit.cover,
                  ),
                ),

                child: Container(
                  decoration: BoxDecoration()
                      .withShadow(color: Colors.black)
                      .withRoundedCorners(borderRadius: 34),
                  margin: 20.m,
                  width: 120.w,
                  child: Padding(
                    padding: 16.p,
                    child: Column(
                      children: [
                        Center(
                          child:
                              Text(
                                'Hello World',
                                style: context.bodyLg.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 28,
                                ),
                              ).animate().spring(),
                        ),
                        Text(
                          'Good ${DateTime.now().greeting.name}',
                          style: context.bodyLg.copyWith(color: Colors.green),
                        ),
                        Text(
                          'Today ${DateTime.now().formattedDate}',
                          style: context.bodyLg.copyWith(color: Colors.blue),
                        ),
                        Text(
                          'It\'s ${DateTime.now().time12h}',
                          style: context.bodyLg.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ).blur(
                    borderColor: Colors.red,
                    blurRadius: 12.r,
                    borderWidth: 2,
                  ),
                ),
              ),

              Row(
                children: List.generate(
                  12,
                  (i) => Chip(label: Text('Menu $i')),
                ).separatedBy(SizedBox(width: 12.w)),
              ).scrollable(scrollDirection: Axis.horizontal),
              ListOfProduct(),

              ElevatedButton(
                onPressed: () {
                  //context.toNamed(NextScreen.route);
                  NextScreen().go(context);
                },
                child: Text('Go TO Next'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
