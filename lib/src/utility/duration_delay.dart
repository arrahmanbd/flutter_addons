
part of 'package:flutter_addons/flutter_addons.dart';

extension GetDurationUtils on Duration {
  ///  await Duration(seconds: 1).delay();
  Future<void> get delay => Future.delayed(this);
}
