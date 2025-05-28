

### 🧩 Widget Extensions Overview

| Method                   | Description                                     | Example Snippet                                    |
| ------------------------ | ----------------------------------------------- | -------------------------------------------------- |
| `.center()`              | Wraps the widget in a `Center`.                 | `Text("Hi").center()`                              |
| `.withPadding()`         | Adds custom padding via `EdgeInsets`.           | `Text("Hi").withPadding(EdgeInsets.all(16))`       |
| `.withMargin()`          | Adds margin using `EdgeInsets` and a container. | `Text("Hi").withMargin(EdgeInsets.symmetric(...))` |
| `.onTap()`               | Wraps with `GestureDetector` for taps.          | `Text("Tap").onTap(() => print("Tapped"))`         |
| `.withBorderRadius()`    | Applies clipping using `BorderRadius`.          | `Text("Hi").withBorderRadius(...)`                 |
| `.withDecoration()`      | Applies `BoxDecoration` via a container.        | `Text("Hi").withDecoration(BoxDecoration(...))`    |
| `.visible()`             | Conditionally shows/hides widget.               | `Text("Shown").visible(true)`                      |
| `.sizedBox()`            | Wraps in a `SizedBox`.                          | `Text("Hi").sizedBox(width: 100, height: 50)`      |
| `.withTooltip()`         | Adds a tooltip.                                 | `Icon(Icons.info).withTooltip("Info")`             |
| `.asColumn()`            | Wraps in a single-child `Column`.               | `Text("Hi").asColumn()`                            |
| `.withAnimatedOpacity()` | Applies `AnimatedOpacity`.                      | `Text("Fade").withAnimatedOpacity(...)`            |
| `.withBoxShadow()`       | Adds shadow styling.                            | `Text("Shadow").withBoxShadow(...)`                |
| `.withShape()`           | Clips with a custom shape.                      | `Container(...).withShape(...)`                    |
| `.scrollable()`          | Makes a widget scrollable.                      | `Column(...).scrollable()`                         |
| `.separatedBy()`         | Separates iterable of widgets.                  | `widgets.separatedBy(Divider())`                   |
| `.circular()`            | Clips widget to a circle.                       | `Image(...).circular(radius: 100)`                 |
| `.rounded()`             | Applies rounded clipping.                       | `Image(...).rounded(borderRadius: 20)`             |
| `.blur()`                | Adds a blur and optional styling.               | `Text("Blur").blur(...)`                           |
| `.stackedWith()`                | wrap base widged into stack.               | `Text("Blur").stackedWith[]`                           |

