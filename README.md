![Logo Image](https://raw.githubusercontent.com/arrahmanbd/flutter_addons/master/images/new_logo.png)

![Flutter](https://img.shields.io/badge/Flutter-3.35.0-blue?logo=flutter&logoColor=white)![Dart](https://img.shields.io/badge/Dart-3.8.0-blue?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-Apache2.0-green)
![Version](https://img.shields.io/badge/Version-3.0.0-red)
![Build](https://img.shields.io/badge/Build-Passing-brightgreen)
![Issues](https://img.shields.io/github/issues/arrahmanbd/flutter_addons)
![Forks](https://img.shields.io/github/forks/arrahmanbd/flutter_addons)
![Stars](https://img.shields.io/github/stars/arrahmanbd/flutter_addons)
![Contributors](https://img.shields.io/github/contributors/arrahmanbd/flutter_addons)
[![Stand With Palestine](https://github.com/arrahmanbd/bangla_pdf_fixer/raw/master/images/StandWithPalestine.svg)](https://pub.dev/packages/flutter_addons)


**Flutter Addons** is a powerful micro-extension framework built to accelerate Flutter app development. Designed with responsiveness, theming, and developer productivity in mind, it lets you build scalable, pixel-perfect, and theme-aware applications with minimal boilerplate.

By providing intuitive extensions, responsive layout tools, and advanced theming capabilities, Flutter Addons helps you reduce development time by up to **10×**, so you can focus on delivering beautiful user experiences faster.

> ⚡ Boost your Flutter workflow and unlock greater productivity with the [Flutter Addons VS Code Extension](https://marketplace.visualstudio.com/items?itemName=arrahmanbd.flutter-addons).

---

## Key Features

* **Seamless Responsiveness:** Effortlessly adapt your UI across devices with `ResponsiveScope` and smart scaling utilities.
* **Powerful Theming:** Define consistent colors, typography, and style systems with the Soul Theme Engine.
* **Dart Extensions:** Clean and readable syntax helpers for common types like `String`, `Map`, `bool`, and more.
* **Context Helpers:** Easy access to media queries, theme data, text styles, and more from the BuildContext.
* **Flexible Layout Widgets:** Ready-to-use rows, columns, grids, and stacks that simplify complex UI arrangements.
* **Smooth Navigation & Animations:** Built-in routing helpers paired with elegant transition effects.
* **Utility Toolkit:** Debugging aids, network helpers, error handling, math & time utilities all in one place.
* **Image & Color Processing:** Extract dominant colors, apply filters, and manipulate images effortlessly.
* **Error & DPI Awareness:** Customizable error screens and density-aware layouts for flawless rendering.


## ⚙️ **Initialization**

```dart

ResponsiveScope( // 👈  ResponsiveScope — VERY Important: Manages layout scaling, orientation lock, and global error handling
  enableDebugLogging: true, // Enable debug logs for responsive layout changes
  orientation: AppOrientationLock.none, // No orientation restriction
  errorScreen: ErrorScreen.sifi,, // Custom error screen for uncaught Flutter errors
  designFrame: const DesignFrame(width: 390, height: 844), // Base design frame for scaling (e.g., iPhone 13)
  pixelDebug: true, // for pixel perfect debugging
  scaleMode: ScaleMode.design, // Use design-based scaling for consistent UI
  appBuilder: (layout)=>  MobileApp(),
);

```



---



### 📐 Responsive Units
Smooth scaling across devices. Use one mode globally for consistency.

| Extension | Purpose        | Example | Description                              |
| --------- | -------------- | ------- | ---------------------------------------- |
| `.ph`   | Percent  Height      | `24.ph`  | Percent Based Height 
| `.pw`   | Percent Width        | `24.pw`  | Percent Based  Width                     |
| `.h`      | Height         | `24.h`  | Auto-scaled height                       |
| `.r`      | Radius / Scale | `12.r`  | Based on shortest side (width vs height) |
| `.sp`     | Font size      | `14.sp` | Auto-scaled font size (like `sp`)        |
| `.w`      | Width          | `16.w`  | Auto-scaled width                        |

> ⚡ Check out the example app for a quick understanding: [View Example App](/example/lib/main.dart).



### 💎 Effortless Theming with Soul —  Quickstart Guide

1. **Use Own Brand Colors**  
   Extend `BrandKolors` and override colors:
   ```dart
   class CustomColors extends BrandKolors {
     @override
     Color get primaryColor => Color(0xFF4A90E2);
     // override other colors...
   }```

2. **Create Brand Typography**
   Extend `BrandTypo` and define text styles:

   ```dart
   class CustomTypography extends BrandTypo {
     @override
     String get fontFamily => 'Montserrat';
     @override
     TextStyle get bodyText => TextStyle(fontSize: 16.sp);
     // define more styles...
   }
   ```

3. **Generate Theme**
   Use `ThemeMaker.makeTheme` with your custom classes:

   ```dart
   ThemeData get lightTheme =>
      ThemeMaker.makeTheme(BrandLightColors(), typography: MyBrandFonts());

   ```

## 🎨 Apply the Theme

Use your custom theme in `MaterialApp`. By Extending `ThemeManager` create your own controller that handles theme state and switching logic more easily. See the example app.


 ```dart
 class Themer extends ThemeManager {
  static const _themeKey = 'selected_theme';

  Themer() {
    _loadThemeFromPrefs(); // Load theme on initialization
  }

  @override
  ThemeData get lightTheme =>
      ThemeMaker.makeTheme(BrandLightColors(), typography: MyBrandFonts());

  @override
  ThemeData get darkTheme =>
      ThemeMaker.makeTheme(BrandDarkColors(), typography: MyBrandFonts());
 }
```
---

#### 1. Applying Text Styles

You can use the extension on `num` to apply various text styles directly.

```dart
Text(
  "Hello, World!",
  style: 16.t.bold.italic.withColor(Colors.blue),
);
```



---

#### 2. Using Predefined `TextTheme` Styles from `BuildContext`

Easily access text styles from the app's `ThemeData`.

```dart
Text(
  "Title Text",
  style: context.titleLarge,
);
```

### 📏 Spacing Extension Reference

The `Spacing` extension provides quick, expressive syntax for margins, paddings, and spacing widgets based on integer values. 

| Syntax | Margin Description               | Margin Example | Padding Description               | Padding Example |
| ------ | -------------------------------- | -------------- | --------------------------------- | --------------- |
| `.m`   | Margin on all sides              | `10.m`         | Padding on all sides              | `10.p`          |
| `.mt`  | Margin on top                    | `10.mt`        | Padding on top                    | `10.pt`         |
| `.mb`  | Margin on bottom                 | `10.mb`        | Padding on bottom                 | `10.pb`         |
| `.ml`  | Margin on left                   | `10.ml`        | Padding on left                   | `10.pl`         |
| `.mr`  | Margin on right                  | `10.mr`        | Padding on right                  | `10.pr`         |
| `.mx`  | Horizontal margin (left & right) | `10.mx`        | Horizontal padding (left & right) | `10.px`         |
| `.my`  | Vertical margin (top & bottom)   | `10.my`        | Vertical padding (top & bottom)   | `10.py`         |

## 🔁 Async utility extension:

| Method                                                  | Description                                                |
| ------------------------------------------------------- | ---------------------------------------------------------- |
| `safe(fallback: T)`                                     | Safely executes a future with a fallback value on error    |
| `retry(retries: int, delay: Duration)`                  | Retries an async call on failure with delay intervals      |
| `withTimeout(Duration, fallback: T)`                    | Sets a timeout on a future with a fallback result          |
| `collect()`                                             | Collects all data emitted by a stream into a list          |
| `asyncMap(Future<T> Function)`                          | Maps a stream asynchronously with a function               |
| `delayEach(Duration)`                                   | Delays each emission in a stream by a specified duration   |
| `batch(int)`                                            | Processes stream data in batches of specified size         |
| `FutureUtils.waitAll(List<Future>, ignoreErrors: bool)` | Awaits multiple futures safely, optionally ignoring errors |

### 📅 DateTime Extension Overview



| Method                       | Description                                 | Method                 | Description                             |
| ---------------------------- | ------------------------------------------- | ---------------------- | --------------------------------------- |
| `.tomorrow`                  | Gets tomorrow’s date                        | `.nextDay`             | Moves to the next day                   |
| `.yesterday`                 | Gets yesterday’s date                       | `.previousDay`         | Moves to the previous day               |
| `.today`                     | Gets today’s date without time              | `.addDays(int)`        | Adds or subtracts days                  |
| `.time24h`                   | Returns time in 24h format                  | `.isToday`             | Checks if the date is today             |
| `.time12h`                   | Returns time in 12h format                  | `.isYesterday`         | Checks if the date is yesterday         |
| `.dateOnly`                  | Returns date in yyyy-MM-dd format           | `.isTomorrow`          | Checks if the date is tomorrow          |
| `.formattedDate`             | Full formatted date string                  | `.isSameDay(DateTime)` | Checks if two dates are the same day    |
| `.timeAgo`                   | Returns human-readable "time ago" string    | `.greeting`            | Returns a greeting enum based on time   |
| `.daysInMonth`               | Returns list of all days in current month   | `.firstDayOfWeek`      | First day of the current week           |
| `.lastDayOfWeek`             | Last day of the current week                | `.previousMonth`       | Gets the previous month’s date          |
| `.nextMonth`                 | Gets the next month’s date                  | `.previousWeek`        | Gets date of the previous week          |
| `.nextWeek`                  | Gets date of the next week                  | `.leapYear(int year)`  | Checks if the given year is a leap year |
| `.daysInAMonth(month, year)` | Number of days in a specific month and year | `.fullDayName`         | Returns full name of the day            |
| `.sortDayName`               | Returns abbreviated day name                |                        |                                         |


---

### 💱 Currency Conversion Extensions

| Method                 | Symbol | Description                         | Example Output |
| ---------------------- | ------ | ----------------------------------- | -------------- |
| `.toDollar()`          | `$`    | Converts to USD format              | `$1234.57`     |
| `.toEuro()`            | `€`    | Converts to Euro format             | `€1234.57`     |
| `.toRupee()`           | `₹`    | Converts to Indian Rupee format     | `₹1234.57`     |
| `.toBangladeshiTaka()` | `৳`    | Converts to Bangladeshi Taka format | `৳1234.57`     |

---


## Navigation Extension Usage

### Available animations

```dart
enum AnimationType { fade, slideFromRight, slideFromLeft, scale, rotate,rotatescale }
```

# Navigation Extensions

| Function | Description |
|----------|-------------|
| `push(Widget page)` | Pushes a new page with animation. |
| `pushName(String name)` | Pushes a named route with animation. |
| `pushReplaced(Widget page)` | Replaces current route with a new page with animation. |
| `pop()` | Pops the current route if possible. |
| `popToRoot()` | Pops all routes until the first route. |
| `pushReplacementNamed(String routeName, {Object? arguments})` | Replaces current route with a named route. |
| `canLaunch(BuildContext context)` | Checks if the context is mounted. |
| `launch(BuildContext context)` | Pushes the widget with animation if context is mounted. |
| `goAndRemoveUntil(Widget page, [RoutePredicate? predicate])` | Pushes a page and removes previous routes until predicate is true. |
| `goNamedAndRemoveUntil(String routeName, [RoutePredicate? predicate])` | Pushes a named route and removes previous routes until predicate is true. |



## 🪄 Avoid Using Print Statements

Instead of using `print` for debugging, leverage a dedicated logging system for clearer, more structured output. Below is an example using a custom `Debug` class to log messages with different severity levels:


| Method            | Description                   |
| ----------------- | ----------------------------- |
| `Debug.bug()`     | Logs a bug message            |
| `Debug.info()`    | Logs an informational message |
| `Debug.warning()` | Logs a warning message        |
| `Debug.error()`   | Logs an error message         |
| `Debug.success()` | Logs a success message        |
| `debug()`         | Logs a generic message        |

Using a structured logging system allows better control and visibility over your app’s runtime behavior, making it easier to debug and maintain.

## 📚 Learn More

- [🎨 Soul Theme Engine](https://github.com/arrahmanbd/flutter_addons/blob/master/doc/soul.md) – Custom theming, typography, and dynamic themes.
- [📐 Responsive System](https://github.com/arrahmanbd/flutter_addons/blob/master/doc/responsive.md) – Scale UI across devices based on design frame.
- [🎞️ Animation Utils](https://github.com/arrahmanbd/flutter_addons/blob/master/doc/animation.md) – Physics, curves, transitions, and more.
- [🧩 Widget Extensions](https://github.com/arrahmanbd/flutter_addons/blob/master/doc/widget.md) – Margin, padding, size, and layout extensions.


## 📬 **Contributions & Support**

Contributions are welcome! If you have any feature requests, bug reports, or suggestions,  
feel free to submit an issue or a pull request on [GitHub](https://github.com/arrahmanbd/flutter_addons).

## 👨‍💻 Author

**Flutter Addons** is actively maintained by [**AR Rahman**](https://arrahmanbd.github.io).
For questions, suggestions, or collaboration opportunities, feel free to [reach out](mailto:arrahman.bd@outlook.com).

If you find this package helpful, please consider giving it a ⭐️ on GitHub — your support is greatly appreciated! 🚀
