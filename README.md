![Logo Image](https://raw.githubusercontent.com/arrahmanbd/flutter_addons/master/images/new_logo.png)

![Flutter](https://img.shields.io/badge/Flutter-3.32.0-blue?logo=flutter&logoColor=white)![Dart](https://img.shields.io/badge/Dart-3.8.0-blue?logo=dart&logoColor=white)
![License](https://img.shields.io/badge/License-Apache2.0-green)
![Version](https://img.shields.io/badge/Version-2.0.0-yellow)
![Build](https://img.shields.io/badge/Build-Passing-brightgreen)
![Issues](https://img.shields.io/github/issues/arrahmanbd/flutter_addons)
![Forks](https://img.shields.io/github/forks/arrahmanbd/flutter_addons)
![Stars](https://img.shields.io/github/stars/arrahmanbd/flutter_addons)
![Contributors](https://img.shields.io/github/contributors/arrahmanbd/flutter_addons)
[![Stand With Palestine](https://github.com/arrahmanbd/bangla_pdf_fixer/raw/master/images/StandWithPalestine.svg)](https://pub.dev/packages/bangla_pdf_fixer)


**Flutter Addons** is a powerful toolkit designed to streamline responsive Flutter development. It includes theming engines, layout utilities, scaling extensions, and animation helpers—everything you need to build polished, adaptive apps faster. Whether you're working with Figma designs or coding pixel-perfect UIs, Flutter Addons keeps your code clean, consistent, and scalable.

> ⚡ Supercharge your Flutter workflow and become **10x more productive** with the [Flutter Addons VS Code Extension](https://marketplace.visualstudio.com/items?itemName=arrahmanbd.flutter-addons).


---

## 🚀 **Key Features**
* **⚡ Easy Integration:** Just wrap with `ResponsiveScope` and enjoy.
* **Soul Theme Engine:** Structured colors & typography for cohesive UI.
* **Dart Extensions:** Helpers for `String`, `Map`, `bool`, `int`, etc.
* **Context Helpers:** Easy access to theme, media, and text styles.
* **Prebuilt Widgets:** Rows, columns, grids, stacks—flexible layouts.
* **Routing &  Animations:** Smooth navigation with rich effects.
* **Utilities:** Network, debug, error handling, and UI tools.
* **Math & Time:** Formatting, delays, calculations simplified.
* **Image & Color:** Extract colors, filters, image processing.
* **Responsive Scaling:** Based on design frames with device/orientation detection.
* **Error Screens & DPI:** Stylish fallbacks and density-aware layouts.


---

## ⚙️ **Initialization**

```dart
ResponsiveScope(
  enableDebugLogging: true,
  layoutBuilder: (context, orientation, screenType) => const MyApp(),
  designFrame: Frame(width: 340, height: 812),
  scaleMode: ScaleMode.design,
  errorScreenStyle: ErrorScreenStyle.dessert,
);
```



---



### 📐 Unified Responsive UX
Smooth scaling across devices. Use one mode globally for consistency.

| Extension | Purpose        | Example | Description                              |
| --------- | -------------- | ------- | ---------------------------------------- |
| `.h`      | Height         | `24.h`  | Auto-scaled height                       |
| `.r`      | Radius / Scale | `12.r`  | Based on shortest side (width vs height) |
| `.sp`     | Font size      | `14.sp` | Auto-scaled font size (like `sp`)        |
| `.w`      | Width          | `16.w`  | Auto-scaled width                        |


### 💎 Effortless Theming with Soul —  Quickstart Guide

1. **Create Custom Colors**  
   Extend `ThemeKolors` and override colors:
   ```dart
   class CustomColors extends ThemeKolors {
     @override
     Color get primaryColor => Color(0xFF4A90E2);
     // override other colors...
   }```

2. **Create Custom Typography**
   Extend `Typography` and define text styles:

   ```dart
   class CustomTypography extends Typography {
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
   final ThemeData lightTheme = ThemeMaker.makeTheme(
     CustomColors(),
     typography: CustomTypography(),
   );
   ```

## 🎨 Apply the Theme

Use your custom theme in `MaterialApp`. By Extending `ThemeManager` create your own controller that handles theme state and switching logic more easily. See the example app.



---

#### 1. Applying Text Styles

You can use the extension on `num` to apply various text styles directly.

```dart
Text(
  "Hello, World!",
  style: 16.t.bold.italic.k(Colors.blue),
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



| Method/Property                | Description                                             | Example Usage                 |
| ------------------------------ | ------------------------------------------------------- | ----------------------------- |
| `_navigator`                   | Gets the NavigatorState for the current context         | `context._navigator`          |
| `navigator`                    | Provides NavigatorHelperAddons with animations          | `context.navigator`           |
| `go(Widget page)`              | Pushes a widget page with animation                     | `context.go(MyPage())`        |
| `goName(String name)`          | Pushes a named route with animation                     | `context.goName('/home')`     |
| `goReplace(Widget page)`       | Replaces current route with widget page with animation  | `context.goReplace(MyPage())` |
| `pop()`                        | Pops current route if possible                          | `context.pop()`               |
| `popToRoot()`                  | Pops all routes until the root                          | `context.popToRoot()`         |
| `launch(BuildContext context)` | Pushes this widget onto navigation stack with animation | `MyWidget().launch(context)`  |

---



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

- [🎨 Soul Theme Engine](doc/soul.md) – Custom theming, typography, and dynamic themes.
- [📐 Responsive System](doc/responsive.md) – Scale UI across devices based on design frame.
- [🎞️ Animation Utils](doc/animation.md) – Physics, curves, transitions, and more.
- [🧩 Widget Extensions](doc/widget.md) – Margin, padding, size, and layout extensions.


## 📬 **Contributions & Support**

Contributions are welcome! If you have any feature requests, bug reports, or suggestions,  
feel free to submit an issue or a pull request on [GitHub](https://github.com/arrahmanbd/flutter_addons).

## 👨‍💻 Author

**Flutter Addons** is actively maintained by [**AR Rahman**](https://arrahmanbd.github.io).
For questions, suggestions, or collaboration opportunities, feel free to [reach out](mailto:arrahman.bd@outlook.com).

If you find this package helpful, please consider giving it a ⭐️ on GitHub — your support is greatly appreciated! 🚀
