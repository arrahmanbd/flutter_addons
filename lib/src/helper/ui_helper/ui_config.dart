part of 'package:flutter_addons/flutter_addons.dart';

/*
 * This part is a fork of the original `flutter_screenutil` package,
 * Original Author: 李卓原 (Zhuoyuan Li)
 * This fork retains the core functionality while making necessary improvements 
 * and adaptations to better suit specific use cases. 
 * All credit for the original implementation goes to the author, and I deeply 
 * appreciate their contributions to the Flutter community.
 * 
 * Open-source contributions like this make development more accessible and 
 * efficient for everyone. Thank you, 李卓原, for your incredible work!
 */

/// A helper widget that initializes [UIUtils] to configure and manage
/// responsive UI scaling, text adaptation, and screen-related settings.
///
/// This widget ensures that the UI scales correctly across different screen sizes
/// by setting a reference `frame` and handling various display configurations.
///
/// ### Features:
/// - Defines a base `frame` for UI scaling.
/// - Adapts text size based on screen width or height.
/// - Supports split-screen mode and media query inheritance.
/// - Allows excluding specific widgets from scaling.
/// - Provides a customizable font size resolution method.
///
class UIConfig extends StatefulWidget {
  /// Creates an instance of [UIConfig] with customizable UI scaling options.
  ///
  /// Provides various options for screen scaling, text adaptation,
  /// and widget responsiveness.
  const UIConfig({
    /// ### Example Usage:
    /// ```dart
    /// UIConfig(
    ///   frame: const Size(360, 890), // Define the base design frame
    ///   minTextAdapt: true, // Enable minimum text adaptation
    ///   splitScreenMode: true, // Allow scaling in split-screen mode
    ///   builder: (_, child) {
    ///     return MaterialApp(
    ///       home: HomeScreen(),
    ///     );
    ///   },
    /// );
    /// ```
    super.key,
    this.builder,
    this.child,
    this.rebuildFactor = RebuildFactors.size,
    this.frame = UIUtils.defaultSize,
    this.splitScreenMode = false,
    this.minTextAdapt = false,
    this.useInheritedMediaQuery = false,
    this.ensureScreenSize = false,
    this.enableScaleWH,
    this.enableScaleText,
    this.responsiveWidgets,
    this.excludeWidgets,
    this.fontSizeResolver = FontSizeResolvers.width,
  });

  /// A function that wraps the app's UI with necessary configurations.
  final ScreenUtilInitBuilder? builder;

  /// The child widget wrapped inside [UIConfig].
  final Widget? child;

  /// Determines when the widget should rebuild.
  final RebuildFactor rebuildFactor;

  /// The reference frame size for UI scaling.
  ///
  /// Defines the base size from which [figma,xd] scaling calculations will be made.
  /// Defaults to `UIUtils.defaultSize`.
  final Size frame;

  /// Enables split-screen mode support.
  ///
  /// If `true`, UI scaling will work properly when the app is running in split-screen mode.
  final bool splitScreenMode;

  /// Ensures text adapts to the screen size.
  ///
  /// If `true`, text will be resized to prevent excessive scaling.
  final bool minTextAdapt;

  /// Uses inherited media query values.
  ///
  /// If `true`, the widget will inherit `MediaQuery` settings from its parent.
  final bool useInheritedMediaQuery;

  /// Ensures the screen size is correctly initialized.
  ///
  /// If `true`, the widget will attempt to fix incorrect screen size values.
  final bool ensureScreenSize;

  /// Enables width/height-based scaling.
  ///
  /// If provided, it returns `true` or `false` based on the scaling condition.
  final bool Function()? enableScaleWH;

  /// Enables text scaling.
  ///
  /// If provided, it returns `true` or `false` based on the scaling condition.
  final bool Function()? enableScaleText;

  /// Defines the method used for font size resolution.
  ///
  /// Determines whether font scaling is based on width, height, or both.
  final FontSizeResolver fontSizeResolver;

  /// Specifies a list of widget names that should be responsive.
  ///
  /// If defined, only these widgets will be affected by scaling.
  final Iterable<String>? responsiveWidgets;

  /// Specifies a list of widget names that should be excluded from scaling.
  ///
  /// If defined, these widgets will not be affected by scaling adjustments.
  final Iterable<String>? excludeWidgets;

  @override
  State<UIConfig> createState() => _UIConfigState();
}

class _UIConfigState extends State<UIConfig> with WidgetsBindingObserver {
  final _canMarkedToBuild = HashSet<String>();
  final _excludedWidgets = HashSet<String>();
  MediaQueryData? _mediaQueryData;
  final _binding = WidgetsBinding.instance;
  final _screenSizeCompleter = Completer<void>();

  @override
  void initState() {
    // Initialize error handling here
    CatchException().initialize(); // Only here, no need in `main()`
    if (widget.responsiveWidgets != null) {
      _canMarkedToBuild.addAll(widget.responsiveWidgets!);
    }

    UIUtils.enableScale(
      enableWH: widget.enableScaleWH,
      enableText: widget.enableScaleText,
    );

    _validateSize().then(_screenSizeCompleter.complete);

    super.initState();
    _binding.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    _revalidate();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _revalidate();
  }

  MediaQueryData? _newData() {
    final view = View.maybeOf(context);
    if (view != null) return MediaQueryData.fromView(view);
    return null;
  }

  Future<void> _validateSize() async {
    if (widget.ensureScreenSize) return UIUtils.ensureScreenSize();
  }

  void _markNeedsBuildIfAllowed(Element el) {
    final widgetName = el.widget.runtimeType.toString();
    if (_excludedWidgets.contains(widgetName)) return;
    final allowed =
        widget is SU ||
        _canMarkedToBuild.contains(widgetName) ||
        !(widgetName.startsWith('_') || flutterWidgets.contains(widgetName));

    if (allowed) el.markNeedsBuild();
  }

  void _updateTree(Element el) {
    _markNeedsBuildIfAllowed(el);
    el.visitChildren(_updateTree);
  }

  void _revalidate([void Function()? callback]) {
    final oldData = _mediaQueryData;
    final newData = _newData();

    if (newData == null) return;

    if (oldData == null || widget.rebuildFactor(oldData, newData)) {
      setState(() {
        _mediaQueryData = newData;
        _updateTree(context as Element);
        callback?.call();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mq = _mediaQueryData;

    if (mq == null) return const SizedBox.shrink();

    if (!widget.ensureScreenSize) {
      UIUtils.configure(
        data: mq,
        designSize: widget.frame,
        splitScreenMode: widget.splitScreenMode,
        minTextAdapt: widget.minTextAdapt,
        fontSizeResolver: widget.fontSizeResolver,
      );

      return widget.builder?.call(context, widget.child) ?? widget.child!;
    }

    return FutureBuilder<void>(
      future: _screenSizeCompleter.future,
      builder: (c, snapshot) {
        UIUtils.configure(
          data: mq,
          designSize: widget.frame,
          splitScreenMode: widget.splitScreenMode,
          minTextAdapt: widget.minTextAdapt,
          fontSizeResolver: widget.fontSizeResolver,
        );

        if (snapshot.connectionState == ConnectionState.done) {
          return widget.builder?.call(context, widget.child) ?? widget.child!;
        }

        return const SizedBox.shrink();
      },
    );
  }

  @override
  void dispose() {
    _binding.removeObserver(this);
    super.dispose();
  }
}

mixin SU on Widget {}

typedef RebuildFactor = bool Function(MediaQueryData old, MediaQueryData data);

typedef ScreenUtilInitBuilder =
    Widget Function(BuildContext context, Widget? child);
