part of 'package:flutter_addons/flutter_addons.dart';

/// Extension for [ScrollController] providing additional scroll functionality.
extension ScrollControllerExtensions on ScrollController {
  /// Scrolls the [ScrollController] to the given position with smooth animation.
  ///
  /// [offset] is the target scroll position (in pixels).
  /// [duration] specifies the duration of the scroll animation.
  /// [curve] defines the curve for the animation (defaults to `Curves.easeInOut`).
  Future<void> animateToPosition(
    double offset, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return animateTo(offset, duration: duration, curve: curve);
  }

  /// Scrolls the [ScrollController] to the top (offset 0) with smooth animation.
  ///
  /// [duration] specifies the duration of the scroll animation.
  /// [curve] defines the curve for the animation (defaults to `Curves.easeInOut`).
  Future<void> scrollToTop({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return animateToPosition(0.0, duration: duration, curve: curve);
  }

  /// Scrolls the [ScrollController] to the bottom (maximum scroll extent) with smooth animation.
  ///
  /// [duration] specifies the duration of the scroll animation.
  /// [curve] defines the curve for the animation (defaults to `Curves.easeInOut`).
  Future<void> scrollToBottom({
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return animateToPosition(
      position.maxScrollExtent,
      duration: duration,
      curve: curve,
    );
  }

  /// Scrolls the [ScrollController] to the given index with smooth animation.
  ///
  /// [index] is the target index of the item (used with lists).
  /// [itemHeight] is the height of a single item.
  /// [duration] specifies the duration of the scroll animation.
  /// [curve] defines the curve for the animation (defaults to `Curves.easeInOut`).
  Future<void> scrollToIndex(
    int index,
    double itemHeight, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    double offset = index * itemHeight;
    return animateToPosition(offset, duration: duration, curve: curve);
  }

  /// Checks if the current scroll position is at the top of the scroll view.
  bool get isAtTop {
    return position.pixels <= position.minScrollExtent;
  }

  /// Checks if the current scroll position is at the bottom of the scroll view.
  bool get isAtBottom {
    return position.pixels >= position.maxScrollExtent;
  }

  /// Scrolls to the given position only if the position is not at the top already.
  Future<void> scrollToPositionIfNotAtTop(
    double offset, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    if (!isAtTop) {
      return animateToPosition(offset, duration: duration, curve: curve);
    }
    return Future.value();
  }

  /// Scrolls to the given position only if the position is not at the bottom already.
  Future<void> scrollToPositionIfNotAtBottom(
    double offset, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    if (!isAtBottom) {
      return animateToPosition(offset, duration: duration, curve: curve);
    }
    return Future.value();
  }

  /// Scrolls the [ScrollController] by the given offset (smooth scroll).
  ///
  /// [offset] is the value to add to the current scroll position (can be positive or negative).
  /// [duration] specifies the duration of the scroll animation.
  /// [curve] defines the curve for the animation (defaults to `Curves.easeInOut`).
  Future<void> scrollByOffset(
    double offset, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    return animateTo(
      position.pixels + offset,
      duration: duration,
      curve: curve,
    );
  }

  /// Checks if the item at the given index is currently visible within the scroll view.
  ///
  /// [index] is the target index of the item.
  /// [itemHeight] is the height of a single item.
  bool isItemVisible(int index, double itemHeight) {
    double itemOffset = index * itemHeight;
    double itemEndOffset = itemOffset + itemHeight;
    double currentPosition = position.pixels;
    return currentPosition >= itemOffset && currentPosition <= itemEndOffset;
  }

  /// Scrolls to the given index only if the item is not visible already.
  ///
  /// [index] is the target index of the item.
  /// [itemHeight] is the height of a single item.
  Future<void> scrollToIndexIfNotVisible(
    int index,
    double itemHeight, {
    Duration duration = const Duration(milliseconds: 300),
    Curve curve = Curves.easeInOut,
  }) {
    if (!isItemVisible(index, itemHeight)) {
      return scrollToIndex(index, itemHeight, duration: duration, curve: curve);
    }
    return Future.value();
  }
}
