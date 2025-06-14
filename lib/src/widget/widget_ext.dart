part of 'package:flutter_addons/flutter_addons.dart';

// 2. Extension to Set a Padding to a Widget
extension CenterWidget on Widget {
  Widget center() => Center(child: this);
}
// Usage:
// Text("Hello, world!").center(alignment: Alignment.topRight);

// 2. Extension to Set a Padding to a Widget
extension PaddingWidget on Widget {
  Widget withPadding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }
}

// Usage:
// Text("Hello").withPadding(EdgeInsets.all(16));

// 3. Extension to Set a Margin to a Widget
extension MarginWidget on Widget {
  Widget withMargin(EdgeInsetsGeometry margin) {
    return Container(margin: margin, child: this);
  }
}

// Usage:
// Text("Hello").withMargin(EdgeInsets.symmetric(horizontal: 16));

// 4. Extension to Apply GestureDetector with onTap
extension OnTapGesture on Widget {
  Widget onTap(void Function() onTap) {
    return GestureDetector(onTap: onTap, child: this);
  }
}

// Usage:
// Text("Tap me!").onTap(() => print("Tapped"));

// 5. Extension to Set a Border Radius to a Widget
extension BorderRadiusWidget on Widget {
  Widget withBorderRadius(BorderRadius borderRadius) {
    return ClipRRect(borderRadius: borderRadius, child: this);
  }
}

// Usage:
// Text("Hello").withBorderRadius(BorderRadius.circular(8));

// 6. Extension to Set a BoxDecoration to a Widget
extension DecorationWidget on Widget {
  Widget withDecoration(BoxDecoration decoration) {
    return DecoratedBox(decoration: decoration, child: this);
  }
}

// Usage:
// Text("Hello").withDecoration(BoxDecoration(color: Colors.blue));

// 7. Extension to Add a Visibility to a Widget (Conditionally Visible)
extension VisibilityWidget on Widget {
  Widget visible(bool visible) {
    return Visibility(visible: visible, child: this);
  }
}

// Usage:
// Text("This is visible").visible(true);

// 8. Extension to Wrap Widget with a SizedBox for a Fixed Size
extension SizedBoxWidget on Widget {
  Widget sizedBox({double? width, double? height}) {
    return SizedBox(width: width, height: height, child: this);
  }
}

// Usage:
// Text("Hello").sizedBox(width: 100, height: 50);

// 9. Extension to Add a Tooltip to a Widget
extension TooltipWidget on Widget {
  Widget withTooltip(String message) {
    return Tooltip(message: message, child: this);
  }
}

// Usage:
// Icon(Icons.info).withTooltip("Info Icon");

// 10. Extension to Convert Widget to a Column
extension ColumnWidget on Widget {
  Widget asColumn({
    MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start,
  }) {
    return Column(mainAxisAlignment: mainAxisAlignment, children: [this]);
  }
}

// Usage:
// Text("This is a single column").asColumn();

// 11. Extension to Wrap Widget with an AnimatedOpacity
extension AnimatedOpacityWidget on Widget {
  Widget withAnimatedOpacity({
    required double opacity,
    required Duration duration,
    required Curve curve,
  }) {
    return AnimatedOpacity(
      opacity: opacity,
      duration: duration,
      curve: curve,
      child: this,
    );
  }
}

// Usage:
// Text("Fade In").withAnimatedOpacity(opacity: 1.0, duration: Duration(seconds: 1), curve: Curves.easeIn);

// 12. Extension to Set a Box Shadow to a Widget
extension ShadowWidget on Widget {
  Widget withBoxShadow({
    Color color = Colors.black,
    double offsetX = 0.0,
    double offsetY = 2.0,
    double blurRadius = 6.0,
  }) {
    return Material(elevation: blurRadius, shadowColor: color, child: this);
  }
}

// Usage:
// Text("Hello").withBoxShadow(color: Colors.blue, blurRadius: 10);

// 13. Extension to Set a Custom Shape to a Widget
extension ShapeWidget on Widget {
  Widget withShape(ShapeBorder shape) {
    return ClipPath(clipper: ShapeBorderClipper(shape: shape), child: this);
  }
}

// Usage:
// Container(color: Colors.red).withShape(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));

// 14. Extension to Make a Widget Scrollable
extension ScrollableWidget on Widget {
  Widget scrollable({
    Axis scrollDirection = Axis.vertical,
    bool reverse = false,
    EdgeInsetsGeometry? padding,
    bool primary = false,
    ScrollPhysics? physics,
    ScrollController? controller,
    Clip clipBehavior = Clip.hardEdge,
    String? restorationId,
    Key? key,
  }) {
    return SingleChildScrollView(
      key: key,
      scrollDirection: scrollDirection,
      reverse: reverse,
      padding: padding,
      primary: primary,
      physics: physics,
      controller: controller,
      clipBehavior: clipBehavior,
      restorationId: restorationId,
      child: this,
    );
  }
}

// Usage:
// Column(children: [Text("Hello"), Text("World")]).scrollable();

// 15.  Allows to insert a separator between the items of the iterable.
extension SeparatedIterable on Iterable<Widget> {
  /// Allows to insert a [separator] between the items of the iterable.
  List<Widget> separatedBy(Widget separator) {
    final result = <Widget>[];
    final iterator = this.iterator;
    if (iterator.moveNext()) {
      result.add(iterator.current);
      while (iterator.moveNext()) {
        result
          ..add(separator)
          ..add(iterator.current);
      }
    }
    return result;
  }
}

// Usage:
// final widgets = [Text('Item 1'), Text('Item 2'), Text('Item 3')];
// final separator = Divider(color: Colors.black);
// final separatedWidgets = widgets.separatedBy(separator);

// 16. Extension to Make a Widget Circular
extension CircularWidget on Widget {
  Widget circular({
    double radius = 50.0, // Default radius for the circle
    Color? color, // Optional color for the background
    BoxFit fit =
        BoxFit.cover, // Optional BoxFit to fit image properly in the circle
  }) {
    return ClipOval(
      child: Container(
        width: radius * 2, // Width is twice the radius
        height: radius * 2, // Height is twice the radius
        color:
            color ??
            Colors.transparent, // Use transparent color if not provided
        child: this,
      ),
    );
  }
}

// Usage:
// Image.network("https://example.com/image.jpg").circular(radius: 100);

// 17. Extension to Make a Widget Rounded
extension RoundedWidget on Widget {
  Widget rounded({
    double borderRadius = 16.0, // Default border radius
    Color? color, // Optional color for the background
    BoxFit fit =
        BoxFit.cover, // Optional BoxFit to fit image properly in the shape
  }) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Container(
        color:
            color ??
            Colors.transparent, // Use transparent color if not provided
        child: this,
      ),
    );
  }
}

// Usage:
// Image.network("https://example.com/image.jpg").rounded(borderRadius: 20);

// 18. Extension to Apply Blur Effect with Border Outline
extension BlurEffectWidget on Widget {
  Widget blur({
    double blurRadius = 0.0, // Default blur radius
    double borderWidth = 2.0, // Default border width
    Color borderColor = Colors.white, // Border color
    double borderRadius = 2.0, // Border radius for rounded corners
    Color backgroundColor = Colors.black54, // Background color (transparent)
    double opacity = 0.3, // Opacity for the background blur
  }) {
    return ClipRRect(
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(borderRadius), // Apply border radius
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Stack(
          children: [
            // BackdropFilter to create the blur effect
            BackdropFilter(
              filter: ui.ImageFilter.blur(
                sigmaX: blurRadius,
                sigmaY: blurRadius,
              ),
              child: Container(
                color: backgroundColor.withValues(
                  alpha: opacity,
                ), // Semi-transparent background
              ),
            ),
            this, // The actual widget that will have the blur effect applied
          ],
        ),
      ),
    );
  }
}

// Usage:
// Text("Hello with blur effect").blur(
//   blurRadius: 10,
//   borderWidth: 4,
//   borderColor: Colors.blue,
//   backgroundColor: Colors.black,
//   opacity: 0.4,
// );
