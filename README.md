
![Logo Image](https://raw.githubusercontent.com/arrahmanbd/flutter_addons/master/images/new_logo.png)

![Flutter](https://img.shields.io/badge/Flutter-3.32.0-blue?logo=flutter&logoColor=white)![Dart](https://img.shields.io/badge/Dart-3.8.0-blue?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-Apache2.0-green)
![Version](https://img.shields.io/badge/Version-1.2.7-blue)
![Build](https://img.shields.io/badge/Build-Passing-brightgreen)
![Issues](https://img.shields.io/github/issues/arrahmanbd/flutter_addons)
![Forks](https://img.shields.io/github/forks/arrahmanbd/flutter_addons)
![Stars](https://img.shields.io/github/stars/arrahmanbd/flutter_addons)
![Contributors](https://img.shields.io/github/contributors/arrahmanbd/flutter_addons)


Flutter Addons is a collection of extensions and utilities designed to simplify and accelerate the development of  responsive Flutter applications. This package includes a variety of tools that help streamline common tasks, such as scaling UI elements, adapting layouts to different screen sizes, making it easier and faster to build high-quality apps quickly and efficiently.

Absolutely! Here's a more convincing and impactful version of that line:

> ⚡ Supercharge your Flutter workflow and become **10x more productive** by using the [Flutter Addons VS Code Extension](https://marketplace.visualstudio.com/items?itemName=arrahmanbd.flutter-addons) – available now on the Visual Studio Marketplace!


## 🚀 **Key Features**

* **🎨 Soul Theme Engine** – Structured theming with defined color palettes, typography, and component styles for a cohesive UI.
* **🔧 Dart Extensions** – Useful extensions for `String`, `Map`, `Bool`, `int`, and more.
* **🧠 Context Helpers** – Access theme, media queries, and text styles easily.
* **📐 Prebuilt Widgets** – Flexible layouts: rows, columns, grids, stacks.
* **🔄 Enhanced Routing** – Smooth navigation and page transitions.
* **🎞️ Animations** – Includes bezier motion, fades, physics-based animations, and more.
* **⚙️ System Utilities** – Network tools, debug helpers, UI handling, error catchers.
* **📊 Math & Time Helpers** – Formatters, delays, calculations, and time utilities.
* **🖼️ Image & Color Tools** – Extract dominant colors, apply filters, and process images.
* **📏 Design Size Scaling** – Responsive scaling based on a fixed `designSize` (for Figma / AdobeXD).
* **📲 Device Type Detection** – Automatically detects `ScreenType.mobile`, `tablet`, and `desktop`.
* **🔁 Orientation Awareness** – Detects `Orientation.portrait` and `landscape`.
* **❄️ Custom Error Screens** – Built-in styles: `frost`, `desert`, `win10`, and more.
* **✅ Split-Screen & DPI Support** – Handles screen density and safe area variations.
* **⚡ Simple Integration** – Just wrap your app with `ResponsiveApp`.





## 📦 **Getting Started**

Add the dependency in your `pubspec.yaml` file. Simply run this command: 

```bash
flutter pub add flutter_addons
```
## ⚙️ Initialize

## 📱 Make Your App Responsive
A modern, flexible alternative to UIConfig for responsive Flutter apps. It allows you to configure the layout to adjust for different screen sizes and orientations by either using a fixed design size or relying on responsive units based on device screen properties (height, width, etc.).

💡 Design Scaling:
- Design Size: A fixed reference design size for scaling (e.g., Figma or AdobeXD).

- Responsive Units: Units like ph, pw, dp, sp, etc., automatically adjust based on screen dimensions and density.

### 🚀 Usage:

```dart
ResponsiveApp(
  builder: (context, orientation, screenType) {
    return const MyApp();
  },
  designSize: Size(375, 812),
  errorScreenStyle: ErrorScreenStyle.dessert,
);
```

Here’s a clean and developer-friendly **README table** comparing your responsive units: **Smart**, **Percent**, and **Design** modes — with a quick explanation for each unit extension:

---

### 📐 Unified Responsive Units Table

| Extension | Purpose        | Example | Description                              |
| --------- | -------------- | ------- | ---------------------------------------- |
| `.w`      | Width          | `16.w`  | Auto-scaled width                        |
| `.h`      | Height         | `24.h`  | Auto-scaled height                       |
| `.sp`     | Font size      | `14.sp` | Auto-scaled font size (like `sp`)        |
| `.rs`     | Radius / Scale | `12.rs` | Based on shortest side (width vs height) |

### 📐 Other Responsive Units


| Extension | Unit Type | Description                                         | Example       |
|-----------|-----------|-----------------------------------------------------|---------------|
| `.pw`     | Percent   | Width as % of screen width (`0.5.pw = 50%`)         | `0.5.pw`      |
| `.ph`     | Percent   | Height as % of screen height (`0.4.ph = 40%`)       | `0.4.ph`      |
| `.pt`     | Percent   | Font size scaling based on pixel/ratio blend        | `12.pt`       |
| `.pr`     | Percent   | Radius scaling based on screen width                | `10.pr`       |
| `.dw`     | Design    | Width based on design reference dimensions          | `20.dw`       |
| `.dh`     | Design    | Height based on design reference dimensions         | `20.dh`       |
| `.dt`     | Design    | Text size from design scale                         | `16.dt`       |
| `.dr`     | Design    | Radius from design scale                            | `10.dr`       |
| `.sx`     | Smart     | Smart X-axis scaling based on shortest screen edge  | `16.sx`       |
| `.sy`     | Smart     | Smart Y-axis scaling based on shortest screen edge  | `16.sy`       |
| `.su`     | Smart     | Smart unit scaling using shortest screen side       | `16.su`       |
| `.st()`   | Smart     | Smart scalable text with optional scale factor      | `14.st(1.1)`  |


## ResponsiveExtension
The `ResponsiveExtension` provides a set of helper getters for determining the screen size category based on the width of the device. It extends `BuildContext` and uses `MediaQuery` to categorize screens into different breakpoints.



### Example Usage
You can use these getters to apply conditional layouts based on screen size.

```dart
if (context.isXs) {
  print("Extra small screen");
} else if (context.isSm) {
  print("Small screen");
} else if (context.isMd) {
  print("Medium screen");
} else if (context.isLg) {
  print("Large screen");
} else if (context.isXl) {
  print("Extra large screen");
}
```

## Breakpoints
| Getter | Description | Width Range |
|--------|------------|-------------|
| `isXs` | Extra small screens (phones) | `< 576px` |
| `isSm` | Small screens (phones) | `576px - 767px` |
| `isMd` | Medium screens (tablets) | `768px - 991px` |
| `isLg` | Large screens (desktops) | `992px - 1199px` |
| `isXl` | Extra large screens (large desktops) | `>= 1200px` |

## Notes
- This extension helps in making responsive UI decisions.
- Use these breakpoints to adjust widget layouts dynamically.

## 🎨 Soul Theme Engine


Soul is a **theme engine** designed by me to streamline and enhance theming in apps.  
It follows the **Material Design Guidelines**, allowing for structured theming with **color palettes, typography, and component styles**.  
It enables **dynamic theming** (light/dark mode) and supports **custom theme extensions**.  

### 🌟 **Key Features**

- **Material-based Theming**: Uses `ColorScheme`  to align with Material 3.
- **Light & Dark Modes**: Supports switching between light and dark themes.
- **Customizable Palettes**: An extendable `Kolors` class that allows for custom themes, supporting primary color `Seed` values or Material `Swatch` colors for flexible theming.
- **Consistent UI Styling**: Defines colors, typography, and component themes globally.

---
### Getting Started


## Extending `Kolors`

To create a custom color palette, extend `Kolors` and define your colors:

```dart
class CustomTheme extends Kolors {
  @override
  Color get primaryColor => const Color(0xFF6200EE);

  @override
  Color get forground => const Color(0xFFFFFFFF);

  @override
  Color get background => const Color(0xFF121212)...
```

Now, use the custom theme:

```dart
final customTheme = ThemeMaker.makeTheme(CustomTheme());
```


## Extending `Typography`

To create a custom typography, extend `Typography` and define your different textStyles:

```dart
class MyTypography extends Typography {
  @override
  String get fontFamily => 'Roboto';

  @override
  TextStyle get bodyText =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500);
```
Now, use the typography in your theme:

## 🎨  Apply Theme
Initialize the theme using `ThemeMaker` with a predefined color palette and apply on your Material App.

```javascript
final  lightTheme = ThemeMaker.makeTheme(LightSoul(),MyTypo());

final  darkTheme = ThemeMaker.makeTheme(DarkSoul(),MyTypo());

```
You can manage and apply theme dynamically by extending  `ThemeManager`. See the example app. 
## TextStyle Extensions Usage


### 1. Applying Text Styles on `num`
You can use the extension on `num` to apply various text styles directly.

```dart
Text(
  "Hello, World!",
  style: 16.t.bold.italic.k(Colors.blue),
);
```

- `16.t` → Sets the font size to 16.
- `.bold` → Applies bold font weight.
- `.italic` → Makes the text italic.
- `.k(Colors.blue)` → Changes the text color.

---

### 2. Using Predefined `TextTheme` Styles from `BuildContext`
Easily access text styles from the app's `ThemeData`.

```dart
Text(
  "Title Text",
  style: context.titleLarge,
);
```

You can use copywith for extends customization.

---
## Spacing Extension Usage

The `Spacing` extension provides convenient methods to easily add margins, paddings, and `SizedBox` elements based on integer values. It uses `w` for width and `h` for height.

## Margin

### `m` - Margin on all sides
```dart
10.m  // Adds margin of 10 units to all sides (top, bottom, left, right)
```

### `mt` - Margin on the top
```dart
10.mt  // Adds margin of 10 units to the top
```

### `mb` - Margin on the bottom
```dart
10.mb  // Adds margin of 10 units to the bottom
```

### `ml` - Margin on the left
```dart
10.ml  // Adds margin of 10 units to the left
```

### `mr` - Margin on the right
```dart
10.mr  // Adds margin of 10 units to the right
```

### `mx` - Horizontal margin (left and right)
```dart
10.mx  // Adds margin of 10 units to both left and right
```

### `my` - Vertical margin (top and bottom)
```dart
10.my  // Adds margin of 10 units to both top and bottom
```

---

## Padding

### `p` - Padding on all sides
```dart
10.p  // Adds padding of 10 units to all sides (top, bottom, left, right)
```

### `pt` - Padding on the top
```dart
10.pt  // Adds padding of 10 units to the top
```

### `pb` - Padding on the bottom
```dart
10.pb  // Adds padding of 10 units to the bottom
```

### `pl` - Padding on the left
```dart
10.pl  // Adds padding of 10 units to the left
```

### `pr` - Padding on the right
```dart
10.pr  // Adds padding of 10 units to the right
```

### `px` - Horizontal padding (left and right)
```dart
10.px  // Adds padding of 10 units to both left and right
```

### `py` - Vertical padding (top and bottom)
```dart
10.py  // Adds padding of 10 units to both top and bottom
```

---

## SizedBox

### `s` - SizedBox with both height and width
```dart
10.s  // Creates a SizedBox with 10 units of height and width
```
--- 

## **Async Functions**
**Dart Async Utility Extension** to simplify asynchronous operations
### **1. Safe Future Execution**
```dart
String? result = await someAsyncFunction().safe(fallback: "Default Value");
```

### **2. Retry Async Calls on Failure**
```dart
String data = await fetchData().retry(retries: 3, delay: Duration(seconds: 2));
```

### **3. Set a Timeout for an Async Task**
```dart
String response = await fetchData().withTimeout(Duration(seconds: 5), fallback: "Timeout Error");
```

### **4. Collect Stream Data as List**
```dart
List<int> numbers = await numberStream.collect();
```

### **5. Map Async Streams**
```dart
Stream<String> upperCaseStream = textStream.asyncMap((text) async => text.toUpperCase());
```

### **6. Delay Stream Emissions**
```dart
Stream<int> delayedNumbers = numberStream.delayEach(Duration(seconds: 1));
```

### **7. Process Data in Batches**
```dart
Stream<List<int>> batches = numberStream.batch(5);
```

### **8. Await Multiple Futures Safely**
```dart
List<String> results = await FutureUtils.waitAll([
  fetchData(),
  fetchOtherData(),
], ignoreErrors: true);
```
## Date Time Extension Usage

### Accessing Dates

```dart
DateTime tomorrow = DateTime.now().tomorrow;
DateTime yesterday = DateTime.now().yesterday;
DateTime today = DateTime.now().today;
```

### Formatting Dates

```dart
String time24h = DateTime.now().time24h;
String time12h = DateTime.now().time12h;
String dateOnly = DateTime.now().dateOnly;
String formattedDate = DateTime.now().formattedDate;
```

### Adding/Subtracting Days

```dart
DateTime nextDay = DateTime.now().nextDay;
DateTime previousDay = DateTime.now().previousDay;
DateTime add5Days = DateTime.now().addDays(5);
DateTime subtract3Days = DateTime.now().addDays(-3);
```

### Checking Days

```dart
bool isToday = DateTime.now().isToday;
bool isYesterday = DateTime.now().isYesterday;
bool isTomorrow = DateTime.now().isTomorrow;
bool isSameDay = DateTime.now().isSameDay(DateTime.now().subtract(Duration(days: 1)));
```

### Getting Time Ago

```dart
String timeAgo = DateTime.now().timeAgo;
```

### Greeting Based on Time

```dart
TimeOfDayGreeting greeting = DateTime.now().greeting;
```

### Week, Month, and Year Operations

```dart
List<DateTime> daysInMonth = DateTime.now().daysInMonth;
DateTime firstDayOfWeek = DateTime.now().firstDayOfWeek;
DateTime lastDayOfWeek = DateTime.now().lastDayOfWeek;
DateTime previousMonth = DateTime.now().previousMonth;
DateTime nextMonth = DateTime.now().nextMonth;
DateTime previousWeek = DateTime.now().previousWeek;
DateTime nextWeek = DateTime.now().nextWeek;
```

### Leap Year and Days in Month

```dart
bool isLeapYear = DateTime.now().leapYear(2024);
int daysInFeb2024 = DateTime.now().daysInAMonth(2, 2024);
```

### Day Names

```dart
String fullDayName = DateTime.now().fullDayName;
String shortDayName = DateTime.now().sortDayName;
``` 

---
## Currency Conversion

Dart extension on num that converts a number into a currency format with a symbol, ensuring a fixed decimal length.

```dart
  double price = 1234.567;
  print(price.toDollar());       // Output: $1234.57
  print(price.toEuro());         // Output: €1234.57
  print(price.toRupee());        // Output: ₹1234.57
  print(price.toBangladeshiTaka()); // Output: ৳1234.57
```

## Navigation Extension Usage

### Animation
Enum for available animations
```dart
AnimationType { fade, slideFromRight, slideFromLeft, scale, rotate,rotatescale }
```
### Navigate using `Context`
```dart
context.navigator
```
### `to(Widget page)`
```dart
context.to(MyPage());
```

### `toNamed(String name)`
```dart
context.toNamed('/myRoute');
```

### `back()`
```dart
context.back();
```

### `toReplace(Widget page)`
```dart
context.toReplace(MyPage());
```


### `go(BuildContext context)`
```dart
MyPage().go(context);
```

---

# Animated Widget Extensions

This extension adds animation effects to Flutter's `Widget` class, allowing for easy animations like fade, scale, slide, rotation, bounce, spring, and more.

## Example Usage

```dart
Text("Hello, Flutter!").animate(),  // Fade + Scale + Slide
SizedBox(height: 20),
Icon(Icons.star, size: 50, color: Colors.amber).spring(),  // Spring Bounce
SizedBox(height: 20),
ElevatedButton(
  onPressed: () {},
  child: Text("Shake Me"),
).shake(repeat: true, intensity: 5),  // Shaky Button
SizedBox(height: 20),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: List.generate(5, (index) => Icon(Icons.circle, size: 20).staggered(index)),  // Staggered effect
),
```

## Available Animations

Here’s a table summarizing the available animations and their parameters:

| **Animation Type**        | **Description**                                                          | **Key Parameters**                                                                                          |
|---------------------------|--------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| **Combined Animation**     | Fade, scale, and slide effects combined.                                 | `duration`, `delay`, `repeat`, `inverse`, `scaleBegin`, `scaleEnd`, `slideX`, `slideY`, `opacityBegin`, `opacityEnd` |
| **Fade In**                | A fade-in effect with optional delay, repeat, and inverse animation.     | `duration`, `delay`, `repeat`, `inverse`                                                                     |
| **Scale In**               | A scale effect with optional repeat, inverse, and delay.                | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                     |
| **Slide In From Left**     | A slide-in effect from the left with repeat and inverse options.        | `duration`, `delay`, `repeat`, `inverse`, `offset`                                                           |
| **Rotation**               | A rotation effect with repeat, inverse, and delay options.              | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                     |
| **Bounce**                 | A bounce effect with optional repeat, inverse, and delay.               | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                     |
| **Spring (Bounce Effect)** | A spring animation with bounce effects.                                  | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                     |
| **Staggered**              | Applies animation with a staggered delay effect.                        | `index`, `duration`                                                                                         |
| **Shake**                  | A randomized shake effect with optional repeat, inverse, and intensity. | `duration`, `delay`, `repeat`, `inverse`, `intensity`                                                        |


This table provides a concise overview of the animation types, their descriptions, and key parameters that can be adjusted for each animation effect.

## Widget Extension Usage

These extensions provide easy-to-use methods to enhance widgets by applying different effects like padding, margins, gestures, and more.

## 1. Center the Widget
### `center()` - Wraps a widget in a `Center` widget.
```dart
Text("Hello, world!").center();
```

---

## 2. Add Padding to Widget
### `withPadding()` - Adds padding to the widget.
```dart
Text("Hello").withPadding(EdgeInsets.all(16));
```

---

## 3. Add Margin to Widget
### `withMargin()` - Adds margin to the widget.
```dart
Text("Hello").withMargin(EdgeInsets.symmetric(horizontal: 16));
```

---

## 4. Apply onTap Gesture to Widget
### `onTap()` - Adds a `GestureDetector` with an `onTap` function.
```dart
Text("Tap me!").onTap(() => print("Tapped"));
```

---

## 5. Apply Border Radius to Widget
### `withBorderRadius()` - Clips the widget with a `BorderRadius`.
```dart
Text("Hello").withBorderRadius(BorderRadius.circular(8));
```

---

## 6. Apply Decoration to Widget
### `withDecoration()` - Adds a `BoxDecoration` to the widget.
```dart
Text("Hello").withDecoration(BoxDecoration(color: Colors.blue));
```

---

## 7. Set Visibility of Widget
### `visible()` - Conditionally makes a widget visible or hidden.
```dart
Text("This is visible").visible(true);
```

---

## 8. Wrap Widget with SizedBox
### `sizedBox()` - Wraps widget in a `SizedBox` with fixed size.
```dart
Text("Hello").sizedBox(width: 100, height: 50);
```

---

## 9. Add Tooltip to Widget
### `withTooltip()` - Adds a tooltip to the widget.
```dart
Icon(Icons.info).withTooltip("Info Icon");
```

---

## 10. Convert Widget to Column
### `asColumn()` - Converts widget into a `Column`.
```dart
Text("This is a single column").asColumn();
```

---

## 11. Apply AnimatedOpacity to Widget
### `withAnimatedOpacity()` - Wraps widget with `AnimatedOpacity`.
```dart
Text("Fade In").withAnimatedOpacity(opacity: 1.0, duration: Duration(seconds: 1), curve: Curves.easeIn);
```

---

## 12. Add Box Shadow to Widget
### `withBoxShadow()` - Adds a shadow effect to the widget.
```dart
Text("Hello").withBoxShadow(color: Colors.blue, blurRadius: 10);
```

---

## 13. Apply Custom Shape to Widget
### `withShape()` - Clips the widget with a custom shape.
```dart
Container(color: Colors.red).withShape(RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)));
```

---

## 14. Make Widget Scrollable
### `scrollable()` - Makes the widget scrollable.
```dart
Column(children: [Text("Hello"), Text("World")]).scrollable();
```

---

## 15. Add Separator Between Items in Iterable
### `separatedBy()` - Adds separator between items of the iterable.
```dart
final widgets = [Text('Item 1'), Text('Item 2'), Text('Item 3')];
final separator = Divider(color: Colors.black);
final separatedWidgets = widgets.separatedBy(separator);
```

---

## 16. Make Widget Circular
### `circular()` - Clips widget to a circular shape.
```dart
Image.network("https://example.com/image.jpg").circular(radius: 100);
```

---

## 17. Make Widget Rounded
### `rounded()` - Clips widget to a rounded shape.
```dart
Image.network("https://example.com/image.jpg").rounded(borderRadius: 20);
```

---

## 18. Apply Blur Effect to Widget
### `blur()` - Adds a blur effect with an optional border and background.
```dart
Text("Hello with blur effect").blur(
  blurRadius: 10,
  borderWidth: 4,
  borderColor: Colors.blue,
  backgroundColor: Colors.black,
  opacity: 0.4,
);
```


## 🪄 Avoid Using Print Statements

Instead of using `print` for debugging, leverage a dedicated logging system for clearer, more structured output. Below is an example using a custom `Debug` class to log messages with different severity levels:

```dart
Debug.bug("This is a bug message");   // Logs a bug message
Debug.info("This is an info message"); // Logs an informational message
Debug.warning("This is a warning message"); // Logs a warning message
Debug.error("This is an error message"); // Logs an error message
Debug.success("This is a success message"); // Logs a success message
```

Alternatively, for a more generic logging approach:

```dart
debug('This is a log message');
```

Using a structured logging system allows better control and visibility over your app’s runtime behavior, making it easier to debug and maintain.


## 📬 **Contributions & Support**
Contributions are welcome! If you have any feature requests, bug reports, or suggestions,  
feel free to submit an issue or a pull request on [GitHub](https://github.com/arrahmanbd/flutter_addons).  

## 👨‍💻 Author

**Flutter Addons** is actively maintained by [**AR Rahman**](mailto:arrahman.bd@outlook.com).
For questions, suggestions, or collaboration opportunities, feel free to [reach out](mailto:arrahman.bd@outlook.com).

If you find this package helpful, please consider giving it a ⭐️ on GitHub — your support is greatly appreciated! 🚀


