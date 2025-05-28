### 📐 Other Responsive Units

| Extension | Unit Type | Description                                        | Example      |
| --------- | --------- | -------------------------------------------------- | ------------ |
| `.pw`     | Percent   | Width as % of screen width (`0.5.pw = 50%`)        | `0.5.pw`     |
| `.ph`     | Percent   | Height as % of screen height (`0.4.ph = 40%`)      | `0.4.ph`     |
| `.pt`     | Percent   | Font size scaling based on pixel/ratio blend       | `12.pt`      |
| `.pr`     | Percent   | Radius scaling based on screen width               | `10.pr`      |
| `.dw`     | Design    | Width based on design reference dimensions         | `20.dw`      |
| `.dh`     | Design    | Height based on design reference dimensions        | `20.dh`      |
| `.dt`     | Design    | Text size from design scale                        | `16.dt`      |
| `.dr`     | Design    | Radius from design scale                           | `10.dr`      |
| `.sx`     | Smart     | Smart X-axis scaling based on shortest screen edge | `16.sx`      |
| `.sy`     | Smart     | Smart Y-axis scaling based on shortest screen edge | `16.sy`      |
| `.su`     | Smart     | Smart unit scaling using shortest screen side      | `16.su`      |
| `.st()`   | Smart     | Smart scalable text with optional scale factor     | `14.st(1.1)` |

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

| Getter | Description                          | Width Range      |
| ------ | ------------------------------------ | ---------------- |
| `isXs` | Extra small screens (phones)         | `< 576px`        |
| `isSm` | Small screens (phones)               | `576px - 767px`  |
| `isMd` | Medium screens (tablets)             | `768px - 991px`  |
| `isLg` | Large screens (desktops)             | `992px - 1199px` |
| `isXl` | Extra large screens (large desktops) | `>= 1200px`      |

## Notes

- This extension helps in making responsive UI decisions.
- Use these breakpoints to adjust widget layouts dynamically.
