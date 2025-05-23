# 1.3.0
### ✨ Preparing for 2.0.0

- Upgraded Flutter SDK to 3.32 and Dart SDK to 3.8

- Applied necessary fixes for breaking changes in Flutter/Dart APIs and ecosystem dependencies

- This marks the last minor release (1.3.0) before 2.0.0, which will introduce breaking changes and drop compatibility with older Flutter versions


### 1.2.5

#### ✨ Features:

* **Responsive Layouts**: Implemented responsive scaling to adjust UI elements dynamically for different screen sizes and orientations.
* **NavigatorManager**: Introduced a streamlined navigator manager to simplify navigation and improve app flow.

#### Improvements:

* Enhanced layout scaling for improved consistency and UI behavior across a variety of devices.

#### Bug Fixes:

* Addressed minor bugs related to layout rendering and app performance.


---

### 1.2.4

#### Fixed Conflict Class Names:

* Added Fake Data for testing purposes.
* Removed conflicting class names that caused issues in previous versions.

---

### 1.2.3

#### Theme Engine Enhancements:

* Introduced the `ThemeManager` for centralized theme control across the application.
* Improved theme structure to increase flexibility and maintainability.
* Added dynamic theme registry to simplify seamless theme switching.
* Optimized `ColorScheme` integration for better consistency.
* Added `ThemeToggleButton` widget for effortless theme switching.

#### Adaptive UI Improvements:

* `getFrame()` now intelligently selects the appropriate design size based on the screen type.
* Enhanced breakpoint detection (`context.isXs`, `context.isSm`, etc.) for more responsive layouts.

#### Custom Borders Widget:

* Made the `DottedBorder` widget reusable through an extension.
* Expanded support for additional border types, including `Triangle`, `Rectangle`, `Dotted`, and `Dashed`.
* Added functionality to show text as a border.

#### General Fixes & Optimizations:

* Improved error handling with fallback text themes.
* Optimized typography, color schemes, and asset management.
* Enhanced Flutter error reporting for better debugging.

---

### 1.2.2

#### Error Handling Improvements:

* Introduced `AppException` handler to automatically map specific errors.
* Added the `ErrorMapper` utility to allow custom error mappings.
* Enhanced error logging for easier debugging.
* Optimized Flutter error reporting for better clarity.
* Improved color, typography, and image handling for overall app optimization.

---

### 1.2.1

#### Platform Support:

* Enhanced platform support, including native web support.
* Improved pub.dev visibility by adding theme image and metadata.

---

### 1.2.0

#### Soul Theme Engine:

* Launched the **Soul Theme Engine**, an advanced theming solution.
* Included **10+ premade themes** for quick and easy customization.
* Introduced **async extension** to handle asynchronous operations more efficiently.

---

### 1.1.0

#### Theme Engine:

* Improved support for structured theming with color palettes for better design consistency.
* Added **Currency Format** utility for better number formatting.

---

### 1.0.0

#### Initial Release:

* Released the initial stable version of **Flutter Addons**.
* Implemented core functionalities and features.
* Added comprehensive documentation for setup and usage.

