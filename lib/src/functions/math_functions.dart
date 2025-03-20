
part of 'package:flutter_addons/flutter_addons.dart';

// This file contains a collection of useful mathematical extensions for the Dart language.
// These extensions provide additional functionality for numerical operations, making it easier
// to perform common mathematical tasks. Each extension is designed to be intuitive and easy to use.
// Simply import this file and start using the extensions in your Dart projects.



// 1. Extension to Get the Angle in Radians from Degrees
extension DegreesToRadians on num {
  double toRadians() {
    return this * (pi / 180);
  }
}

// Usage:
// final angleInDegrees = 90;
// final angleInRadians = angleInDegrees.toRadians();  // 1.5708


// 2. Extension to Get the Angle in Degrees from Radians
extension RadiansToDegrees on num {
  double toDegrees() {
    return this * (180 / pi);
  }
}

// Usage:
// final angleInRadians = 1.5708;
// final angleInDegrees = angleInRadians.toDegrees();  // 90.0


// 3. Extension to Calculate the Power of a Number
extension Power on num {
  double power(num exponent) {
    return pow(this, exponent).toDouble();
  }
}

// Usage:
// final base = 2;
// final result = base.power(3);  // 8.0


// 4. Extension to Calculate the Factorial of a Number
extension Factorial on int {
  int factorial() {
    if (this < 0) return 0; // Factorial is not defined for negative numbers
    int result = 1;
    for (int i = 1; i <= this; i++) {
      result *= i;
    }
    return result;
  }
}

// Usage:
// final number = 5;
// final fact = number.factorial();  // 120


// 5. Extension to Calculate the Absolute Value of a Number
extension AbsoluteValue on num {
  num get absoluteValue {
    return this < 0 ? -this : this;
  }
}

// Usage:
// final number = -10;
// final absolute = number.absoluteValue;  // 10


// 6. Extension to Calculate the Square Root of a Number
extension SquareRoot on num {
  double get squareRoot {
    if (this < 0) return double.nan; // Square root is not defined for negative numbers
    return sqrt(this);
  }
}

// Usage:
// final number = 16;
// final sqrtValue = number.squareRoot;  // 4.0


// 7. Extension to Round a Number to N Decimal Places
extension RoundToDecimal on num {
  double roundTo(int places) {
    return (this * pow(10, places)).round() / pow(10, places);
  }
}

// Usage:
// final number = 3.141592653589793;
// final rounded = number.roundTo(2);  // 3.14


// 8. Extension to Get the Random Value from a Range
extension RandomRange on int {
  int randomInRange(int min, int max) {
    return min + Random().nextInt(max - min + 1);
  }
}

// Usage:
// final randomValue = 0.randomInRange(1, 100);  // Random value between 1 and 100


// 9. Extension to Get the Sign of a Number (Positive/Negative/Zero)
extension SignOfNumber on num {
  String get sign {
    if (this > 0) return 'Positive';
    if (this < 0) return 'Negative';
    return 'Zero';
  }
}

// Usage:
// final number = -5;
// final sign = number.sign;  // Negative


// 10. Extension to Get the Mean of a List of Numbers
extension Mean on List<num> {
  double get mean {
    if (isEmpty) return double.nan;
    return reduce((a, b) => a + b) / length;
  }
}

// Usage:
// final numbers = [1, 2, 3, 4, 5];
// final meanValue = numbers.mean;  // 3.0


// 11. Extension to Get the Median of a List of Numbers
extension Median on List<num> {
  double get median {
    if (isEmpty) return double.nan;
    List<num> sorted = List.from(this)..sort();
    int middle = sorted.length ~/ 2;
    if (sorted.length % 2 == 1) {
      return sorted[middle].toDouble();
    } else {
      return (sorted[middle - 1] + sorted[middle]) / 2;
    }
  }
}

// Usage:
// final numbers = [1, 3, 2, 4, 5];
// final medianValue = numbers.median;  // 3.0


// 12. Extension to Get the Distance Between Two Points (Euclidean Distance)
extension EuclideanDistance on Point {
  double distanceTo(Point other) {
    return sqrt(pow(x - other.x, 2) + pow(y - other.y, 2));
  }
}

// Usage:
// final point1 = Point(0, 0);
// final point2 = Point(3, 4);
// final distance = point1.distanceTo(point2);  // 5.0


// 13. Extension to Get the Angle Between Two Vectors
extension AngleBetweenVectors on List<num> {
  double angleBetween(List<num> other) {
    if (length != other.length) throw ArgumentError('Vectors must have the same dimensions.');
    double dotProduct = 0;
    double magnitudeA = 0;
    double magnitudeB = 0;
    for (int i = 0; i < length; i++) {
      dotProduct += this[i] * other[i];
      magnitudeA += pow(this[i], 2);
      magnitudeB += pow(other[i], 2);
    }
    magnitudeA = sqrt(magnitudeA);
    magnitudeB = sqrt(magnitudeB);
    return acos(dotProduct / (magnitudeA * magnitudeB)).toDegrees();
  }
}

// Usage:
// final vectorA = [1, 0];
// final vectorB = [0, 1];
// final angle = vectorA.angleBetween(vectorB);  // 90.0


// 14. Extension to Clamp a Value Between a Minimum and Maximum
extension ClampValue on num {
  num clampValue(num min, num max) {
    return (this < min) ? min : (this > max) ? max : this;
  }
}

// Usage:
// final value = 15;
// final clamped = value.clampValue(10, 20);  // 15


// 15. Extension to Calculate the Exponential of a Number
extension Exponential on num {
  double get exp {
    return math.exp(this);
  }
}

// Usage:
// final number = 2;
// final expValue = number.exp;  // 7.389056098930649
