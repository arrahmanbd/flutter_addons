part of 'package:flutter_addons/flutter_addons.dart';

class Label extends StatelessWidget {
  final String text;
  final String? style;

  const Label(this.text, {this.style, super.key});

  @override
  Widget build(BuildContext context) {
    List<String> paramsSplitted = style != null ? style!.split(' ') : [];
    List<String> params = paramsSplitted.map((e) => e.trim()).toList();

    return Text(
      text,
      style: textStyle(params),
      textAlign: textAlignTW(params),
      overflow: textOverflowTW(params),
    );
  }
}

TextStyle textStyle(List<String> props) {
  late List<String> params;
  params = props.map((e) => e.trim()).toList();

  return TextStyle(
    fontWeight: fontWeightTW(params) ?? FontWeight.w400,
    fontSize: fontSizeTW(params) ?? 16,
    color: colorTW(params) ?? Kolors.neutral900,
  );
}

TextAlign? textAlignTW(List<String> params) {
  Map<String, TextAlign> textAlignmentsTW = {
    'text-left': TextAlign.left,
    'text-center': TextAlign.center,
    'text-right': TextAlign.right,
    'text-justify': TextAlign.justify,
    'text-start': TextAlign.start,
    'text-end': TextAlign.end,
  };

  if (params.toSet().intersection(textAlignmentsTW.keys.toSet()).isEmpty) {
    return null;
  }

  return textAlignmentsTW[params
      .toSet()
      .intersection(textAlignmentsTW.keys.toSet())
      .first];
}

Color? colorTW(List<String> params) {
  for (var element in params.reversed) {
    // Color name has to start with 'text-'
    if (!element.startsWith('text-')) {
      continue;
    }

    // The input color string
    String input = element.replaceFirst('text-', '');

    // If the color name is not in the tailwindColors map, continue
    String colorName = input.split('-').first;
    if (!tailwindSafeColors.containsKey(colorName)) {
      continue;
    }

    // Return if the color is not a shade
    if (!input.contains('-')) {
      return ColorExtensions.fromHex(tailwindSafeColors[colorName]);
    }

    // Return color with shade
    int colorShade = int.parse(input.split('-').last);
    return ColorExtensions.fromHex(tailwindSafeColors[colorName][colorShade]);
  }

  return null;
}

double? fontSizeTW(List<String> params) {
  Map<String, double> fontSizesTW = {
    'text-2xs': 10,
    'text-xs': 12,
    'text-sm': 14,
    'text-base': 16,
    'text-lg': 18,
    'text-xl': 20,
    'text-2xl': 24,
    'text-3xl': 30,
    'text-4xl': 36,
    'text-5xl': 48,
    'text-6xl': 60,
    'text-7xl': 72,
    'text-8xl': 96,
    'text-9xl': 128,
  };

  if (params.toSet().intersection(fontSizesTW.keys.toSet()).isEmpty) {
    return null;
  }

  return fontSizesTW[params
      .toSet()
      .intersection(fontSizesTW.keys.toSet())
      .first];
}

FontWeight? fontWeightTW(List<String> params) {
  Map<String, FontWeight> fontWeightsTW = {
    'font-thin': FontWeight.w100,
    'font-extralight': FontWeight.w200,
    'font-light': FontWeight.w300,
    'font-normal': FontWeight.w400,
    'font-medium': FontWeight.w500,
    'font-semibold': FontWeight.w600,
    'font-bold': FontWeight.w700,
    'font-extrabold': FontWeight.w800,
    'font-black': FontWeight.w900,
  };

  if (params.toSet().intersection(fontWeightsTW.keys.toSet()).isEmpty) {
    return null;
  }

  return fontWeightsTW[params
      .toSet()
      .intersection(fontWeightsTW.keys.toSet())
      .first];
}

TextOverflow? textOverflowTW(List<String> params) {
  Map<String, TextOverflow> textOverflows = {
    'text-fade': TextOverflow.fade,
    'text-ellipsis': TextOverflow.ellipsis,
    'text-clip': TextOverflow.clip,
    'text-visible': TextOverflow.visible,
  };

  if (params.toSet().intersection(textOverflows.keys.toSet()).isEmpty) {
    return null;
  }

  return textOverflows[params
      .toSet()
      .intersection(textOverflows.keys.toSet())
      .first];
}
