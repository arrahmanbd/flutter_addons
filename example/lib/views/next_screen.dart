import 'package:example/views/list_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_addons/flutter_addons.dart';

class NextScreen extends StatelessWidget {
  static String route = '/next';
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Next Screen',)),
      body:
          Column(children: [_buildHero(context), ListOfProduct()]).scrollable(),
    );
  }

  Container _buildHero(BuildContext context) {
    return Container(
      padding: 4.p,
      height: 0.32.sh,
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
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello World',
                style: context.bodyLarge.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28.sp,
                ),
              ).animate().spring(),
              Text(
                'Good ${DateTime.now().greeting.name}',
                style: context.bodyLarge.copyWith(color: Colors.green),
              ),
              Text(
                'Today ${DateTime.now().formattedDate}',
                style: context.bodyLarge.copyWith(color: Colors.blue),
              ),
              Text(
                'It\'s ${DateTime.now().time12h}',
                style: context.bodyLarge.copyWith(color: Colors.grey),
              ),
              5.s,

              ElevatedButton(
                onPressed: () {
                  //context.toNamed(NextScreen.route);
                },
                child: Text('Go TO Next'),
              ),
            ],
          ),
        ).blur(borderColor: Colors.red, blurRadius: 12.r, borderWidth: 2),
      ),
    );
  }
}
