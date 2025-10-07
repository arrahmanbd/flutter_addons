part of 'package:flutter_addons/flutter_addons.dart';

abstract class YaruProgressIndicator extends StatefulWidget {
  const YaruProgressIndicator({
    super.key,
    this.value,
    this.color,
    this.valueColor,
    this.trackColor,
    this.trackValueColor,
    this.strokeWidth,
    this.trackStrokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
  }) : assert(strokeWidth == null || strokeWidth > 0),
       assert(trackStrokeWidth == null || trackStrokeWidth > 0);

  final double? value;

  final Color? color;

  final Animation<Color?>? valueColor;

  final Color? trackColor;

  final Animation<Color?>? trackValueColor;

  final double? strokeWidth;

  final double? trackStrokeWidth;

  final String? semanticsLabel;

  final String? semanticsValue;

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
      PercentProperty(
        'value',
        value,
        showName: false,
        ifNull: '<indeterminate>',
      ),
    );
  }

  Widget buildSemanticsWrapper({
    required BuildContext context,
    required Widget child,
  }) {
    var expandedSemanticsValue = semanticsValue;
    if (value != null) {
      expandedSemanticsValue ??= '${(value! * 100).round()}%';
    }
    return Semantics(
      label: semanticsLabel,
      value: expandedSemanticsValue,
      child: child,
    );
  }
}

abstract class YaruProgressIndicatorThemeData<
  T extends YaruProgressIndicatorThemeData<T>
>
    extends theme.ThemeExtension<T> {
  YaruProgressIndicatorThemeData(
    this.color,
    this.trackColor,
    this.strokeWidth,
    this.trackStrokeWidth,
  );

  final Color? color;

  final Color? trackColor;

  final double? strokeWidth;

  final double? trackStrokeWidth;
}

class YaruCircularProgressIndicatorThemeData
    extends
        YaruProgressIndicatorThemeData<YaruCircularProgressIndicatorThemeData> {
  YaruCircularProgressIndicatorThemeData(
    super.color,
    super.trackColor,
    super.strokeWidth,
    super.trackStrokeWidth,
  );

  @override
  theme.ThemeExtension<YaruCircularProgressIndicatorThemeData> copyWith({
    Color? color,
    Color? trackColor,
    double? strokeWidth,
    double? trackStrokeWidth,
  }) {
    return YaruCircularProgressIndicatorThemeData(
      color ?? this.color,
      trackColor ?? this.trackColor,
      strokeWidth ?? this.strokeWidth,
      trackStrokeWidth ?? this.trackStrokeWidth,
    );
  }

  @override
  theme.ThemeExtension<YaruCircularProgressIndicatorThemeData> lerp(
    covariant theme.ThemeExtension<YaruCircularProgressIndicatorThemeData>?
    other,
    double t,
  ) {
    final o = other as YaruCircularProgressIndicatorThemeData?;
    return YaruCircularProgressIndicatorThemeData(
      Color.lerp(color, o?.color, t),
      Color.lerp(trackColor, o?.trackColor, t),
      lerpDouble(strokeWidth, o?.strokeWidth, t),
      lerpDouble(trackStrokeWidth, o?.trackStrokeWidth, t),
    );
  }
}

class YaruCircularProgressIndicatorTheme extends InheritedWidget {
  const YaruCircularProgressIndicatorTheme({
    super.key,
    required this.data,
    required super.child,
  });

  final YaruCircularProgressIndicatorThemeData data;

  static YaruCircularProgressIndicatorThemeData? of(BuildContext context) {
    final t =
        context
            .dependOnInheritedWidgetOfExactType<
              YaruCircularProgressIndicatorTheme
            >();
    return t?.data ??
        Theme.of(context).extension<YaruCircularProgressIndicatorThemeData>();
  }

  @override
  bool updateShouldNotify(YaruCircularProgressIndicatorTheme oldWidget) {
    return data != oldWidget.data;
  }
}

const _turn = math.pi * 2;
const _kMinCircularProgressIndicatorSize = 36.0;
const _kIndeterminateInitialAnimationDuration = 1000;
const _kIndeterminateAnimationDuration = 8000;
const _kIndeterminateAnimationCurve = Curves.easeInOutSine;
const _kIndeterminateAnimationTurns = 6;
const _kDefaultStrokeWidth = 4.0;
const _kDefaultTrackColorOpacity = 0.25;
const _kStartAngle = -math.pi / 2;
const _kMinGap = 0.2;
const _kMaxGap = 0.5;

class YaruLoader extends YaruProgressIndicator {
  const YaruLoader({
    super.key,
    super.value,
    super.strokeWidth,
    super.trackStrokeWidth,
    super.color,
    super.valueColor,
    super.trackColor,
    super.trackValueColor,
    super.semanticsLabel,
    super.semanticsValue,
  });

  @override
  State<YaruLoader> createState() => _YaruCircularProgressIndicatorState();
}

class _YaruCircularProgressIndicatorState extends State<YaruLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _initialAnimation = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _updateControllerState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(YaruLoader oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value == null && !_controller.isAnimating) {
      _controller.repeat();
    } else if (widget.value != null && _controller.isAnimating) {
      _controller.stop();
    }
  }

  void _updateControllerState() async {
    if (widget.value == null) {
      _controller.duration = const Duration(
        milliseconds: _kIndeterminateInitialAnimationDuration,
      );
      await _controller.forward();
      setState(() {
        _initialAnimation = false;
      });

      _controller.duration = const Duration(
        milliseconds: _kIndeterminateAnimationDuration,
      );
      await _controller.repeat();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final progressTheme = YaruCircularProgressIndicatorTheme.of(context);

    final color =
        widget.valueColor?.value ??
        widget.color ??
        progressTheme?.color ??
        theme.colorScheme.primary;
    final trackColor =
        widget.trackValueColor?.value ??
        widget.trackColor ??
        progressTheme?.trackColor ??
        color.withValues(alpha: _kDefaultTrackColorOpacity);
    final strokeWidth =
        widget.strokeWidth ??
        progressTheme?.strokeWidth ??
        _kDefaultStrokeWidth;
    final trackStrokeWidth =
        widget.trackStrokeWidth ??
        progressTheme?.trackStrokeWidth ??
        strokeWidth;

    Widget buildContainer(BuildContext context, Widget child) {
      return widget.buildSemanticsWrapper(
        context: context,
        child: Container(
          constraints: const BoxConstraints(
            minWidth: _kMinCircularProgressIndicatorSize,
            minHeight: _kMinCircularProgressIndicatorSize,
          ),
          child: RepaintBoundary(child: child),
        ),
      );
    }

    if (widget.value != null) {
      return buildContainer(
        context,
        CustomPaint(
          painter: _DeterminateYaruCircularProgressIndicatorPainter(
            widget.value!,
            color,
            trackColor,
            strokeWidth,
            trackStrokeWidth,
            Directionality.of(context),
          ),
        ),
      );
    }
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final progress = _controller.value;
        late double barSizeProgress;
        late double spacingProgress;
        late double rotationProgress;

        if (_initialAnimation) {
          barSizeProgress = CurveTween(
            curve: Curves.easeInOut,
          ).transform(progress);
          spacingProgress = 0;
          rotationProgress = 0;
        } else {
          barSizeProgress = 1.0;
          spacingProgress =
              1 -
              Tween<double>(begin: -1.0, end: 1.0)
                  .chain(CurveTween(curve: _kIndeterminateAnimationCurve))
                  .transform(progress)
                  .abs();
          rotationProgress = Tween<double>(
                begin: 0.0,
                end: _turn * _kIndeterminateAnimationTurns,
              )
              .chain(CurveTween(curve: _kIndeterminateAnimationCurve))
              .transform(progress);
        }

        return buildContainer(
          context,
          CustomPaint(
            painter: _IndeterminateYaruCircularProgressIndicatorPainter(
              color,
              strokeWidth,
              barSizeProgress,
              spacingProgress,
              rotationProgress,
              Directionality.of(context),
            ),
          ),
        );
      },
    );
  }
}

class _IndeterminateYaruCircularProgressIndicatorPainter extends CustomPainter {
  const _IndeterminateYaruCircularProgressIndicatorPainter(
    this.color,
    this.strokeWidth,
    this.barSizeProgress,
    this.gapProgress,
    this.rotationProgress,
    this.textDirection,
  ) : super();

  final Color color;
  final double strokeWidth;
  final double barSizeProgress;
  final double gapProgress;
  final double rotationProgress;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.saveLayer(null, Paint());

    const circleThird = _turn / 3;

    final strokePaint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;

    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        math.min(size.width / 2, size.height / 2) - (strokeWidth / 2);
    final gap = _kMinGap + (_kMaxGap - _kMinGap) * gapProgress;
    const align = 0;
    final sweepAngle = circleThird - gap;
    final rect = Rect.fromCircle(center: center, radius: radius);

    for (var i = 0; i < 3; i++) {
      final realSweepAngle = sweepAngle * barSizeProgress;
      final startAngle =
          align +
          circleThird * i -
          (realSweepAngle / 2 * barSizeProgress) +
          rotationProgress;
      canvas.drawArc(rect, startAngle, realSweepAngle, false, strokePaint);
    }

    canvas.restore();
  }

  @override
  bool shouldRepaint(_IndeterminateYaruCircularProgressIndicatorPainter _) {
    return true;
  }
}

class _DeterminateYaruCircularProgressIndicatorPainter extends CustomPainter {
  const _DeterminateYaruCircularProgressIndicatorPainter(
    this.value,
    this.color,
    this.trackColor,
    this.strokeWidth,
    this.trackStrokeWidth,
    this.textDirection,
  );

  final double value;
  final Color color;
  final Color trackColor;
  final double strokeWidth;
  final double trackStrokeWidth;
  final TextDirection textDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final revisedValue =
        value >= 0 && value <= 1
            ? value
            : value < 0
            ? 0
            : 1;
    final center = Offset(size.width / 2, size.height / 2);
    final radius =
        math.min(size.width / 2, size.height / 2) - (strokeWidth / 2);
    final sweepAngle = _turn * revisedValue;
    final rect = Rect.fromCircle(center: center, radius: radius);

    final strokePaint =
        Paint()
          ..color = color
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke;
    final trackStrokePaint =
        Paint()
          ..color = trackColor
          ..strokeWidth = trackStrokeWidth
          ..style = PaintingStyle.stroke;

    if (textDirection == TextDirection.rtl) {
      canvas.scale(-1, 1);
      canvas.translate(-size.width, 0);
    }

    canvas.drawArc(rect, 0, _turn, false, trackStrokePaint);
    canvas.drawArc(rect, _kStartAngle, sweepAngle, false, strokePaint);
  }

  @override
  bool shouldRepaint(
    _DeterminateYaruCircularProgressIndicatorPainter oldDelegate,
  ) {
    return oldDelegate.value != value ||
        oldDelegate.color != color ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.trackStrokeWidth != trackStrokeWidth ||
        oldDelegate.textDirection != textDirection;
  }
}
