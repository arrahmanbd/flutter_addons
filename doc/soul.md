## 🎨 Soul Theme Engine

Soul is a **theme engine** designed by me to streamline and enhance theming in apps.  
It follows the **Material Design Guidelines**, allowing for structured theming with **color palettes, typography, and component styles**.  
It enables **dynamic theming** (light/dark mode) and supports **custom theme extensions**.

### 🌟 **Key Features**

- **Material-based Theming**: Uses `ColorScheme` to align with Material 3.
- **Light & Dark Modes**: Supports switching between light and dark themes.
- **Customizable Palettes**: An extendable `BrandKolors` class that allows for custom themes, supporting primary color `Seed` values or Material `Swatch` colors for flexible theming.
- **Consistent UI Styling**: Defines colors, typography, and component themes globally.

---

## Extending `BrandKolors`

To create a custom color palette, extend `BrandKolors` and define your colors:

```dart
class CustomTheme extends BrandKolors {
  @override
  Color get primaryColor => const Color(0xFF6200EE);

  @override
  Color get forground => const Color(0xFFFFFFFF);

  @override
  Color get background => const Color(0xFF121212);
}
```

Now, use the custom theme:

```dart
final customTheme = ThemeMaker.makeTheme(CustomTheme());
```

## Extending `BrandTypo`

To create a custom typography, extend `BrandTypo` and define your different textStyles:

```dart
class MyTypography extends BrandTypo {
  @override
  String get fontFamily => 'Roboto';

  @override
  TextStyle get bodyText =>
      TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w500);
```

Now, use the typography in your theme:

## 🎨 Apply Theme

Initialize the theme using `ThemeMaker` with a predefined color palette and apply on your Material App.

```dart
final  lightTheme = ThemeMaker.makeTheme(LightSoul(),typography: MyTypo());
final  darkTheme = ThemeMaker.makeTheme(DarkSoul(),typography: MyTypo());

```

You can manage and apply theme dynamically by extending `ThemeManager`. See the example app.

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