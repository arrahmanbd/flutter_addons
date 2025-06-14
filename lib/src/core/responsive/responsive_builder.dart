part of 'package:flutter_addons/flutter_addons.dart';

class Responsive extends StatefulWidget {
  const Responsive({
    super.key,
    required this.builder,
    this.transition = ResponsiveTransition.fade,
    this.duration = const Duration(milliseconds: 300),
  });

  final ResponsiveTransition transition;
  final Duration duration;

  /// Builder provides a [MediaInfo] object with full responsive info.
  final Widget Function(MediaInfo ui) builder;

  @override
  State<Responsive> createState() => _ResponsiveState();
}

class _ResponsiveState extends State<Responsive> {
  late MediaInfo _layoutData;
  String _generateKey(MediaInfo data) {
    return '${data.isMobile
            ? "mobile"
            : data.isTablet
            ? "tablet"
            : "desktop"}'
        '_${data.isLandscape ? "landscape" : "portrait"}';
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _layoutData = MediaInfo.fromThis(context);
  }

  @override
  Widget build(BuildContext context) {
    _layoutData = MediaInfo.fromThis(context);

    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: ResponsiveTransitionBuilder.resolve(widget.transition),
      layoutBuilder:
          (currentChild, previousChildren) => Stack(
            alignment: Alignment.center,
            children: [
              ...previousChildren,
              if (currentChild != null) currentChild,
            ],
          ),
      child: KeyedSubtree(
        key: ValueKey(_generateKey(_layoutData)),
        child: widget.builder(_layoutData),
      ),
    );
  }
}

class SliverResponsive extends StatelessWidget {
  final Widget Function(MediaInfo media) builder;
  final Duration duration;
  final ResponsiveTransition transition;

  const SliverResponsive({
    super.key,
    required this.builder,
    this.duration = const Duration(milliseconds: 300),
    this.transition = ResponsiveTransition.slide,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaInfo.fromThis(context);
    return SliverToBoxAdapter(
      child: AnimatedSwitcher(
        duration: duration,
        switchInCurve: Curves.easeInOut,
        switchOutCurve: Curves.easeInOut,
        transitionBuilder: ResponsiveTransitionBuilder.resolve(transition),
        layoutBuilder:
            (currentChild, previousChildren) => Stack(
              alignment: Alignment.center,
              children: [
                ...previousChildren,
                if (currentChild != null) currentChild,
              ],
            ),
        child: KeyedSubtree(
          key: ValueKey(
            '${media.isMobile
                ? "mobile"
                : media.isTablet
                ? "tablet"
                : "desktop"}_${media.isLandscape ? "landscape" : "portrait"}',
          ),
          child: builder(media),
        ),
      ),
    );
  }
}
