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

| **Animation Type**         | **Description**                                                         | **Key Parameters**                                                                                                   |
| -------------------------- | ----------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------- |
| **Combined Animation**     | Fade, scale, and slide effects combined.                                | `duration`, `delay`, `repeat`, `inverse`, `scaleBegin`, `scaleEnd`, `slideX`, `slideY`, `opacityBegin`, `opacityEnd` |
| **Fade In**                | A fade-in effect with optional delay, repeat, and inverse animation.    | `duration`, `delay`, `repeat`, `inverse`                                                                             |
| **Scale In**               | A scale effect with optional repeat, inverse, and delay.                | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                             |
| **Slide In From Left**     | A slide-in effect from the left with repeat and inverse options.        | `duration`, `delay`, `repeat`, `inverse`, `offset`                                                                   |
| **Rotation**               | A rotation effect with repeat, inverse, and delay options.              | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                             |
| **Bounce**                 | A bounce effect with optional repeat, inverse, and delay.               | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                             |
| **Spring (Bounce Effect)** | A spring animation with bounce effects.                                 | `duration`, `delay`, `repeat`, `inverse`, `begin`, `end`                                                             |
| **Staggered**              | Applies animation with a staggered delay effect.                        | `index`, `duration`                                                                                                  |
| **Shake**                  | A randomized shake effect with optional repeat, inverse, and intensity. | `duration`, `delay`, `repeat`, `inverse`, `intensity`                                                                |

This table provides a concise overview of the animation types, their descriptions, and key parameters that can be adjusted for each animation effect.