part of 'package:flutter_addons/flutter_addons.dart';

/// Defines whether a flex item is visible or hidden in a responsive context.
enum FlexDisplayType {
  /// The element is hidden (`display: none`).
  none('none'),

  /// The element is shown as block.
  block('block');

  const FlexDisplayType(this.className);

  /// The CSS class name equivalent.
  final String className;

  /// Returns true if this display type is block.
  bool get isBlock => this == FlexDisplayType.block;

  /// Parses a string to a FlexDisplayType.
  static FlexDisplayType fromString(String text) {
    return text == FlexDisplayType.none.className
        ? FlexDisplayType.none
        : FlexDisplayType.block;
  }
}

/// Extension on List to add `mapIndexed` utility.
extension ListExtension<T> on List<T> {
  /// Maps each element with its index.
  Iterable<R> mapIndexed<R>(R Function(int index, T element) convert) sync* {
    for (var index = 0; index < length; index++) {
      yield convert(index, this[index]);
    }
  }
}

/// Enum that maps to the Breakpoints class for consistent screen sizing.
enum BreakpointMapper {
  xs(Breakpoints.xs, 'xs'), // Mobile
  sm(Breakpoints.sm, 'sm'), // Tablet
  md(Breakpoints.md, 'md'), // Laptop
  lg(Breakpoints.lg, 'lg'), // Desktop
  xl(Breakpoints.xl, 'xl'), // Large Desktop
  xxl(Breakpoints.xxl, 'xxl'); // Extra Large Desktop

  const BreakpointMapper(this.width, this.className);

  /// Max width for this breakpoint.
  final double width;

  /// Short class name (e.g., 'sm', 'md').
  final String className;

  /// Convenience checks.
  bool get isMobile => this == BreakpointMapper.xs;
  bool get isTablet => this == BreakpointMapper.sm;
  bool get isLaptop => this == BreakpointMapper.md;
  bool get isMiniDesktop => this == BreakpointMapper.lg;
  bool get isDesktop => this == BreakpointMapper.xl;

  /// Returns all breakpoints.
  static final List<BreakpointMapper> valuesList = values;
}

/// Core responsive flex system for calculating media data.
class DisplayFlexMedia {
  /// Total number of columns for your grid system.
  static int flexColumns = 12;

  /// Default spacing between columns.
  static double flexSpacing = 24.0;

  /// List of breakpoints (can be customized).
  static List<BreakpointMapper> customBreakpoints = BreakpointMapper.valuesList;

  /// Get breakpoint for a given width.
  static BreakpointMapper getTypeFromWidth(double width) {
    return customBreakpoints.firstWhere(
      (type) => width < type.width,
      orElse: () => BreakpointMapper.xxl,
    );
  }

  /// Fills any missing breakpoint values in the given map with defaults.
  static Map<BreakpointMapper, T> getFilledMedia<T>(
    Map<BreakpointMapper, T>? map,
    T defaultValue, [
    bool reversed = false,
  ]) {
    map ??= {};
    final types =
        reversed ? customBreakpoints.reversed.toList() : customBreakpoints;

    final Map<BreakpointMapper, T> result = {};
    for (var i = 0; i < types.length; i++) {
      result[types[i]] =
          map[types[i]] ?? (i > 0 ? result[types[i - 1]] : defaultValue)!;
    }
    return result;
  }

  /// Parses flex data string (e.g., "md-6 sm-12") into a map of breakpoints to column spans.
  static Map<BreakpointMapper, double> getFlexedDataFromString(String? input) {
    input ??= "";
    final Map<BreakpointMapper, double> flexData = {};

    for (final item in input.split(' ')) {
      for (final type in customBreakpoints) {
        if (item.startsWith('${type.className}-')) {
          final flex = double.tryParse(
            item.substring(type.className.length + 1),
          );
          if (flex != null) {
            flexData[type] = flex;
          }
        }
      }
    }

    return getFilledMedia(flexData, flexColumns.toDouble());
  }

  /// Parses display type string (e.g., "md-none sm-block") into a map of breakpoints to `FlexDisplayType`.
  static Map<BreakpointMapper, FlexDisplayType> getDisplayDataFromString(
    String? input,
  ) {
    input ??= "";
    final Map<BreakpointMapper, FlexDisplayType> displayData = {};

    for (final item in input.split(' ')) {
      for (final type in customBreakpoints) {
        if (item.startsWith('${type.className}-')) {
          final displayType = FlexDisplayType.fromString(
            item.substring(type.className.length + 1),
          );
          displayData[type] = displayType;
        }
      }
    }

    return getFilledMedia(displayData, FlexDisplayType.block);
  }

  /// Allows overriding the default breakpoints.
  // static void setCustomBreakpoints(List<BreakpointMapper> breakpoints) {
  //   customBreakpoints = breakpoints;
  // }
}

/// Global getters for your flex grid system.
double get flexSpacing => DisplayFlexMedia.flexSpacing;
int get flexColumns => DisplayFlexMedia.flexColumns;
