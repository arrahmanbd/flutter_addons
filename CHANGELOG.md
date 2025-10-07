# 3.0.0

The **3.0.0 Final Release** marks a major evolution in design consistency, theming flexibility, and framework stability. This version transforms the UI experience with a **complete brand-based color and typography system**, smarter localization, and robust production-ready optimizations.

---

### New: Brand-Based Theming

* **BrandColor System** – Introduced a **12-color scalable palette** built around your brand identity for consistent, modern UI design.
* **BrandTypo** – Unified typography system for readable, elegant, and scalable text styles across all components.
* **Adaptive Color Harmony** – Automatic light/dark tone adjustments with smooth transitions.
* **Input & Surface Refinement** – Updated visual hierarchy using the new palette for backgrounds, surfaces, and interactive states.

---

### Localization & Internationalization

* **Intelligent RTL Detection**
  Automatic layout mirroring for Arabic, Hebrew, Urdu, and other right-to-left languages.

* **Localized Naming Format**
  Improved locale naming such as “English (EN)” for cleaner presentation.

* **Country Info Fallbacks**
  Fallback logic for missing locale data ensures consistent global coverage.

* **Centralized Locale Registry**
  Unified management system for adding or maintaining language packs.

* **`supportedLocales()` Helper**
  Simplified setup for `MaterialApp` localization integration.

---

### Theming & System Behavior

* **Enhanced Theme Toggle**
  `enableSystemMode` now cycles between **Light ↔ Dark ↔ System**, fully synchronized with system preferences.

* **Reactive Theme Animation**
  Built-in reactivity via `AnimatedBuilder` and `AnimatedSwitcher` for smooth transitions.

* **Improved `blurEffect` Extension**
  More natural depth and blur performance across devices.

---

### Developer Experience

* **Extensible Architecture**
  Modular design makes it easier to add new locales, themes, or color sets.
* **Debug Session Clarity**
  During development, disable `enableDebugLog` when testing alerts — it’s **safe and stable in production**.
* **Production Wrapper Optimization**
  The production build now returns only the core wrapper, eliminating location and binding errors entirely.

---

### Fixes

* Theme and icon synchronization issues resolved.
* Extension name conflict (`animate` → `animated`) fixed.
* RTL layout and theme transition glitches patched.
* Overall performance and reactivity improvements.




# 3.0.0-preview

-  RTL detection (important for Arabic, Hebrew, Urdu)
-  Formatted names like English (EN)
- Country info (fallback if not provided)
- Central registry for easier scalability
- Easily extensible for more languages
- supportedLocales() helper for MaterialApp
- enableSystemMode → toggle icon cycles Light ↔ Dark ↔ System or just Light ↔ Dark.
- Full system mode support for icon toggle.

Improved:

- Reactive updates with AnimatedBuilder.
- Icon and switch stay in sync.
- Smooth transitions with AnimatedSwitcher.
- Improved  `blurEffect` extension.


Fixed:

- Icon & switch not updating correctly.
- Theme cycling inconsistencies.
- Extension confilct for `animate` resolved with `animated` 

# 3.0.0-dev

## Added

- `UiListTile` widget: fully customizable list tile with `.standard` and `.compact` variants.
- `PixelPerfectGridOverlay`: visual grid overlay for design debugging.
- `_ScopeWrapper` enhancements: optional debug grid and improved debug banner.

## Changed

- Refactored widgets and extensions for improved performance, readability, and maintainability.
- Core widgets now support optional debug tools for faster UI testing.

## Fixed

- Grid overlay painting issues in debug mode.
- Proper initialization of screen and layout info in `ResponsiveScope`.


## 2.5.0

### Added

- `UiAvatar` widget for circular avatars with optional status indicators.
- `UiAccordion` widget for expandable/collapsible panels.
- `UiDrawer` widget for modern navigation drawer.
- Updated documentation for navigation extensions.

### Changed
- Renamed `Frame` class to `DesignFrame` for clarity.
- Optimized code across widgets and extensions for performance and readability.

### Fixed
 - Minor layout and ui issues in entrypoint and other ui components.

## 2.4.5

- Add `UI` Components.
- Added `UIFlatButton` components.
- Added `UIOTPScreen` for otp field.
- Added `UITextFiled` and more ui pack.
- Replace `.s` with `.gap` for sizebox.

## 2.4.3

- Added `LifecycleManager` for managing app lifecycle.
- Added `Keyboard visbility` Controller.

## 2.4.2

- Added `UiListview` ui component
- Added `toStackedAvatars` for goup of circle avaters
- Grouping UIComponets as `Ui` prefix
- Fixed Responsive Spacing units
- Fix some validation logic.
- Supports max number for phone validation
- Introduced ThemeHelper singleton to initialize ThemeData, TextTheme, ColorScheme, and MediaQuery at app root
- Added Ui class as a global design system access point for theme, text styles, and colors without passing BuildContext
- Ensures consistent and convenient styling throughout the app
- Added documentation and usage examples for clarity

## 2.4.1

- Removed conflicted component
- Updated documentation

## 2.4.0

- Reorganized project folder structure for better scalability and upcoming phase.
- Clean separation of widgets, helpers, and theme constants.
- Ensure CoreScale re-initializes properly on every screen size/orientation change.
- Add check to only initialize or update design-based scaling when ScaleMode is `design` and a valid design frame is provided.
- Prevents redundant design scaling in other modes, improving performance and clarity.
- Enhances ResponsiveScope to rely on ScreenUtils for consistent screen type resolution.
- Adds safer asserts and logging for better debugging when resizing windows or using dynamic layouts.
- Optimizing core features for breaking changes
- Ensure SectionItem widgets have bounded heights to avoid overflow when used with Wrap layouts.
- Rewrote Section grouping logic for robust flex calculation per breakpoint.
- Replaced unsafe maxHeight usage with calculated viewport-based heights.
- Also documented safe usage patterns for flexible sidebar layouts.

## 2.3.1

-  Fix: Resolved `LateInitializationError` during initialization.

## 2.3.0

**What’s New:**

- Introduced `State` addons.
- Introduced `Functional Programming` addons.
- Refactor Frame(w,h).
- Fixed breaking change issue.
- Fixed responsive DFlex and Wraping.
- Preaping `UI` componnets on V3.0

## 2.2.1

**What’s New:**
- Introduced `ResponsivePage` class.
- Fixed extension conflict issue.
- Fixed breaking change issue.
## 2.2.0 

**What’s New:**

### Added
- Introduced a `Result<T, E>` type for functional-style success and error handling.
- Added `AppState<T>` for representing loading, success, and failure states in UI.
- Implemented `ExceptionHandler` to standardize exception-to-error conversion across layers.
- Created extension methods for retrying failed futures and guarding async operations.
- New SizedBox Spacing `sy` `sx`
- New Frames added on designFrame, etc.
### Fixed
- Fix font scaling on large screens by basing scale on reference width and clamping values
- Prevent fonts from shrinking below original size on desktop resolutions


### Improved
- Enhanced error handling consistency across layers.
- Refactored data flow to follow clean architecture and functional principles.
- Simplified async logic through reusable extensions and state modeling.
- Improved terminal readability with minimal formatting
# 2.1.2 

**What’s New:**

* Introduced a redesigned, customizable **AppBar** for improved UI consistency.
* Enhanced the **CircleButton** widget with improved styling and responsiveness.
* Added a reusable **AvatarCircle** widget for displaying user avatars and icons.
* Included a clean and minimal **PageIndicator** widget for onboarding and carousel screens.
* Implemented a set of **Common Validators** for consistent and efficient form validation.
* Introduced a flexible **CustomTextField** with built-in validation and optional visibility toggle.


### 2.1.1
### Hotfix
1. Resolved lag issues and fixed crashes caused by complex widget trees.
3. Improved overall performance and stability.


### 2.1.0

### Fixes & Improvements

1. Fixed the non-removable `debugShowCheckedModeBanner` flag.
2. Fixed hot-rebuild issues triggered by orientation changes.
3. Improved responsive logic to reduce unnecessary widget rebuilds in `ResponsiveScope`.
4. Optimized fallback behavior for `MediaQuery` and scaling mechanisms.
5. Updated and enhanced smart scaling logic for more accurate rendering.
6. Improved overall performance and performed a full code cleanup.
7. Introduced `FlatButton` again in Flutter.
8. Added support for orientation lock via internal API.
9. Introduced new `SoulThemes` with improved visual design.
10. Added `Responsive` widget and several utility extensions to simplify responsive and UI development.
11. Centeralized Default Colors in `PureSoul` class

---

## 2.0.0

### Major Features

* Introduced `ResponsiveScope` as a new root-level widget for adaptive layouts.
* Added `Frame.reversed` to support orientation-aware frame swapping.
* Enhanced `SmartUnitUtils` with orientation-aware scaling capabilities.
* Refined design frame handling using `MediaQuery.orientation`.
* Implemented transition animations on responsive widget rebuilds.
* Improved debug logging for orientation and screen type changes.

### Refactor & Maintenance

* Renamed `NavigationExtension` to `NavigationContextExtensions`.
* Refactored `ResponsiveApp` to improve error handling and screen-type detection.
* Performed general code cleanup and restructuring.

### Bug Fixes

* Fixed improper fallback when using invalid `designFrame` values.

---

## 2.0.0-alpha.2

### Features

* Added unified scaling extensions: `.w`, `.h`, `.sp`, and `.rs` for automatic context-aware scaling across Smart, Design, and Percent modes.
* Introduced `.usp()` for unified font scaling with smart awareness.
* Implemented `_safe()` execution wrapper to prevent runtime crashes during uninitialized scaling scenarios.
* Added `.rs` as a shorthand for responsive radius computation.

### Supported Modes

* **Smart**: Context-aware scaling based on screen ratios and device density.
* **Design**: Logical pixel-to-dp mapping based on fixed mockup dimensions.
* **Percent**: Percentage-based scaling relative to current screen size.

### Refactors

* Renamed and formatted internal extensions for naming consistency.
* Enhanced readability and simplified logic for better maintenance.

### Breaking Changes

* Replaced scattered scaling access with centralized control via `UnifiedScale().mode`.
* Deprecated some older `.scale` usages; migrate to `.sx`, `.sy`, `.su`, `.w`, or `.h`.

---

## 1.3.1

### Fixes

* Corrected `SizeBox` shorthand behavior to ensure scaling aligns with design reference instead of percentage.

---

## 1.3.0

### Preparations for 2.0.0

* Upgraded Flutter SDK to 3.32 and Dart SDK to 3.8.
* Addressed breaking changes in Flutter/Dart APIs and updated all dependencies accordingly.
* Marked as the final pre-2.0.0 release, maintaining compatibility with older versions.

---

## 1.2.5

### Features

* Introduced responsive layout support to dynamically adjust UI components across screen sizes and orientations.
* Added `NavigatorManager` for improved navigation flow and control.

### Improvements

* Enhanced layout scaling for consistency across devices.

### Bug Fixes

* Resolved minor layout rendering issues and optimized overall performance.

---

## 1.2.4

### Fixes

* Removed conflicting class names to prevent runtime clashes.
* Added fake data for improved testing scenarios.

---

## 1.2.3

### Theme Engine Enhancements

* Added centralized `ThemeManager` for consistent theming.
* Refined the theme structure for greater flexibility.
* Introduced dynamic theme registry to support seamless theme switching.
* Improved `ColorScheme` integration for better UI consistency.
* Added `ThemeToggleButton` widget for theme interaction.

### Adaptive UI

* Enhanced `getFrame()` to better select design dimensions based on screen type.
* Improved breakpoint detection with `context.isXs`, `context.isSm`, etc.

### Custom Borders

* Added reusable extension for `DottedBorder` and introduced support for new border types: `Triangle`, `Rectangle`, `Dotted`, `Dashed`.
* Enabled displaying text within borders.

### General Improvements

* Improved fallback text handling for failed typography initialization.
* Enhanced Flutter error reporting and asset optimization.

---

## 1.2.2

### Error Handling

* Introduced `AppException` and `ErrorMapper` for structured error control.
* Improved error logging clarity.
* Optimized image, typography, and color handling.

---

## 1.2.1

### Platform Support

* Extended native web support.
* Improved pub.dev metadata and visual representation.

---

## 1.2.0

### Soul Theme Engine

* Released the first version of the `SoulThemeEngine`.
* Included over 10 pre-built themes for easy customization.
* Added asynchronous extensions to enhance workflow.

---

## 1.1.0

### Improvements

* Structured theming with color palettes for consistent UI.
* Introduced `CurrencyFormat` utility for number formatting.

---

## 1.0.0

### Initial Release

* Launched the first stable version of **Flutter Addons**.
* Included core functionality and responsive features.
* Provided comprehensive documentation for usage and setup.

