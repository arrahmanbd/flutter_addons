part of 'package:flutter_addons/flutter_addons.dart';

class ErrorPage extends StatelessWidget {
  final String message;

  const ErrorPage(this.message, {super.key});

  static Widget _buildSadFace() {
    return Text(
      ":(",
      style: TextStyle(fontSize: 80.sp),
      textAlign: TextAlign.center,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: 18.p,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildSadFace(),
              SizedBox(height: 20.h),
              Text(
                message ?? "Something went wrong",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
