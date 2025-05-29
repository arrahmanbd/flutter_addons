part of 'package:flutter_addons/flutter_addons.dart';

/// Enum representing different orientation lock modes
enum AppOrientationLock {
  portraitUp,
  portraitDown,
  landscapeLeft,
  landscapeRight,
  portraitOnly,
  landscapeOnly,
  none, // Default: allows all orientations
}

extension AppOrientationLockExtension on AppOrientationLock {
  List<DeviceOrientation> get orientations {
    switch (this) {
      case AppOrientationLock.portraitUp:
        return [DeviceOrientation.portraitUp];
      case AppOrientationLock.portraitDown:
        return [DeviceOrientation.portraitDown];
      case AppOrientationLock.landscapeLeft:
        return [DeviceOrientation.landscapeLeft];
      case AppOrientationLock.landscapeRight:
        return [DeviceOrientation.landscapeRight];
      case AppOrientationLock.portraitOnly:
        return [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown];
      case AppOrientationLock.landscapeOnly:
        return [
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ];
      case AppOrientationLock.none:
        return [
          DeviceOrientation.portraitUp,
          DeviceOrientation.portraitDown,
          DeviceOrientation.landscapeLeft,
          DeviceOrientation.landscapeRight,
        ];
    }
  }
}
