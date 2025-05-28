# 2.0.0-beta
### Added
- `Frame.reversed` getter to automatically swap width and height for landscape orientation.
- Dynamic design frame handling based on `MediaQuery.orientation` to ensure consistent scaling.
- Improved SmartUnitUtils scaling calculations with orientation-aware design frame handling.
- Refactored ResponsiveApp for cleaner separation of error handling and screen type resolution logic.
- Enhanced debug logging for better insights on orientation and screen type changes.
- General code cleanup to improve maintainability and professionalism.

### Changed
- Scaling logic now adapts to screen orientation, reversing the design frame in landscape mode.
- Fallback mechanism added to handle null or invalid `designFrame` values gracefully.


### 2.0.0-alpha.2

### ✨ Features

* **Unified Scaling Extensions**: Introduced `.w`, `.h`, `.sp`, and `.rs` for simplified and auto-detected scaling across Smart, Design, and Percent modes.
* **Unified Font Sizing**: Added `.usp()` for smart-aware and unified scalable text sizing.
* **Safe Mode Execution**: Prevents crashes when required utilities are uninitialized (`_safe()` wrapper).
* **Radius Shortcut**: Added `.rs` as a unified responsive radius shortcut based on mode.

### 🧠 Modes Supported

* `Smart`: Context-aware scaling using screen ratios and pixel density.
* `Design`: Fixed mockup scaling via logical pixel-to-dp mapping.
* `Percent`: Percentage-based scaling relative to screen dimensions.


### 🛠️ Refactors

* Improved extension method naming consistency and formatting.
* Updated internal logic to enhance readability and maintainability.

### ⚠️ BREAKING CHANGES

* Replaced scattered utility access with `UnifiedScale().mode` for centralized control.
* Some older `.scale` usages may need migration to `.sx`, `.sy`, `.su`, or `.w` / `.h`.

---
### 1.3.1

### 🛠 Fixes & Improvements

- Fixed `SizeBox` shorthand to support **design reference-based sizing** instead of percentage, avoiding conflicts with older versions.
----

### 1.3.0
### ✨ Preparing for 2.0.0

- Upgraded Flutter SDK to 3.32 and Dart SDK to 3.8

- Applied necessary fixes for breaking changes in Flutter/Dart APIs and ecosystem dependencies

- This marks the last minor release (1.3.0) before 2.0.0, which will introduce breaking changes and drop compatibility with older Flutter versions
 
---

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

