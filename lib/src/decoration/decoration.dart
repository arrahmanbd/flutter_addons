part of 'package:flutter_addons/flutter_addons.dart';

/// Extension for Fluent Input Decoration
extension InputDecorationX on InputDecoration {
  InputDecoration border(InputBorder border) => copyWith(border: border);
  InputDecoration label(String labelText) => copyWith(labelText: labelText);
  InputDecoration hint(String hintText) => copyWith(hintText: hintText);
  InputDecoration icon(IconData icon) => copyWith(prefixIcon: Icon(icon));
  InputDecoration focusedBorder(InputBorder border) =>
      copyWith(focusedBorder: border);
  InputDecoration enabledBorder(InputBorder border) =>
      copyWith(enabledBorder: border);
  InputDecoration errorText(String text) => copyWith(errorText: text);
  InputDecoration filled(bool isFilled, {Color fillColor = Colors.white}) =>
      copyWith(filled: isFilled, fillColor: fillColor);
  InputDecoration suffixIcon(IconData icon) => copyWith(suffixIcon: Icon(icon));
}

/// Extension for Fluent BoxDecoration
extension BoxDecorationX on BoxDecoration {
  BoxDecoration rounded(double radius) =>
      copyWith(borderRadius: BorderRadius.circular(radius));
  BoxDecoration shadow(double spread) =>
      copyWith(boxShadow: [BoxShadow(blurRadius: spread)]);
  BoxDecoration border(Color color, {double width = 1}) =>
      copyWith(border: Border.all(color: color, width: width));
  BoxDecoration gradient(List<Color> colors) =>
      copyWith(gradient: LinearGradient(colors: colors));
  BoxDecoration solidColor(Color color) => copyWith(color: color);
  BoxDecoration dottedBorder(Color color, {double width = 2.0}) => copyWith(
    border: Border.all(color: color, width: width),
    shape: BoxShape.rectangle,
    // Create a dotted border effect using BorderStyle.dotted
    boxShadow: [
      BoxShadow(
        color: color.withAlpha(144),
        offset: Offset(0, 0),
        spreadRadius: -3,
        blurRadius: 2,
      ),
    ],
  );
  BoxDecoration circle() => copyWith(borderRadius: BorderRadius.circular(999));
}

/// Extension for Fluent BorderSide
extension BorderSideX on BorderSide {
  BorderSide color(Color color) => copyWith(color: color);
  BorderSide width(double width) => copyWith(width: width);
}

extension BoxDecorationExtension on BoxDecoration {
  /// Adds a solid color background with rounded corners.
  BoxDecoration withRoundedCorners({
    Color color = Colors.white,
    double borderRadius = 8.0,
  }) {
    return BoxDecoration(
      // color: color,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  /// Adds a shadow effect to the decoration.
  BoxDecoration withShadow({
    Color color = Colors.black,
    double blurRadius = 8.0,
    double spreadRadius = 2.0,
    Offset offset = const Offset(0, 2),
  }) {
    return BoxDecoration(
      //color: this.color,
      borderRadius: borderRadius,
      boxShadow: [
        BoxShadow(
          color: color,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: offset,
        ),
      ],
    );
  }

  /// Adds a border with optional radius.
  BoxDecoration withBorder({
    Color color = Colors.black,
    double width = 1.0,
    double borderRadius = 8.0,
  }) {
    return BoxDecoration(
      // color: this.color,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      border: Border.all(color: color, width: width),
    );
  }

  /// Adds a gradient to the background.
  BoxDecoration withGradient({
    required Gradient gradient,
    double borderRadius = 8.0,
  }) {
    return BoxDecoration(
      gradient: gradient,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
    );
  }

  /// Adds a combination of background color, border, and shadow.
  BoxDecoration withFullDecoration({
    Color color = Colors.white,
    double borderRadius = 8.0,
    double borderWidth = 1.0,
    Color borderColor = Colors.black,
    Color shadowColor = Colors.black,
    double blurRadius = 8.0,
    double spreadRadius = 2.0,
    Offset shadowOffset = const Offset(0, 2),
  }) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
      border: Border.all(color: borderColor, width: borderWidth),
      boxShadow: [
        BoxShadow(
          color: shadowColor,
          blurRadius: blurRadius,
          spreadRadius: spreadRadius,
          offset: shadowOffset,
        ),
      ],
    );
  }
}

/// Uses

// TextField(
//   decoration: InputDecoration()
//       .label("Username")
//       .hint("Enter your username")
//       .icon(Icons.person)
//       .focusedBorder(OutlineInputBorder(borderRadius: BorderRadius.circular(8)))
//       .enabledBorder(OutlineInputBorder(borderRadius: BorderRadius.circular(8)))
//       .errorText("Invalid username")
//       .filled(true, fillColor: Colors.grey[200]),
// );

// Container(
//   decoration: BoxDecoration()
//       .rounded(12)
//       .shadow(4)
//       .border(Colors.blue, width: 2)
//       .gradient([Colors.blue, Colors.purple]),
//   child: Text("Styled Box with Gradient"),
// );
// Container(
//   decoration: BoxDecoration().dottedBorder(Colors.red, width: 2),
//   child: Text("Dotted Border Box"),
// );
