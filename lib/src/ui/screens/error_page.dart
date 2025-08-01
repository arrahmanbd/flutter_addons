part of 'package:flutter_addons/flutter_addons.dart';

class UiErrorPage extends StatelessWidget {
  final String message;

  const UiErrorPage(this.message, {super.key});

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
              SizedBox(height: 20.ph),
              Text(
                message,
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
