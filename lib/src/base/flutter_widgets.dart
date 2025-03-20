
part of 'package:flutter_addons/flutter_addons.dart';


final flutterWidgets = HashSet<String>.from({
  'AbsorbPointer',
  'Accumulator',
  'Action',
  'ActionDispatcher',
  'ActionListener',
  'Actions',
  'ActivateAction',
  'ActivateIntent',
  'Align',
  'Alignment',
  'AlignmentDirectional',
  'AlignmentGeometry',
  'AlignmentGeometryTween',
  'AlignmentTween',
  'AlignTransition',
  'AlwaysScrollableScrollPhysics',
  'AlwaysStoppedAnimation',
  'AndroidView',
  'AndroidViewSurface',
  'Animatable',
  'AnimatedAlign',
  'AnimatedBuilder',
  'AnimatedContainer',
  'AnimatedCrossFade',
  'AnimatedDefaultTextStyle',
  'AnimatedFractionallySizedBox',
  'AnimatedGrid',
  'AnimatedGridState',
  'AnimatedList',
  'AnimatedListState',
  'AnimatedModalBarrier',
  'AnimatedOpacity',
  'AnimatedPadding',
  'AnimatedPhysicalModel',
  'AnimatedPositioned',
  'AnimatedPositionedDirectional',
  'AnimatedRotation',
  'AnimatedScale',
  'AnimatedSize',
  'AnimatedSlide',
  'AnimatedSwitcher',
  'AnimatedWidget',
  'AnimatedWidgetBaseState',
  'Animation',
  'AnimationController',
  'AnimationMax',
  'AnimationMean',
  'AnimationMin',
  'AnnotatedRegion',
  'AspectRatio',
  'AssetBundle',
  'AssetBundleImageKey',
  'AssetBundleImageProvider',
  'AssetImage',
  'AsyncSnapshot',
  'AutocompleteHighlightedOption',
  'AutocompleteNextOptionIntent',
  'AutocompletePreviousOptionIntent',
  'AutofillGroup',
  'AutofillGroupState',
  'AutofillHints',
  'AutomaticKeepAlive',
  'AutomaticNotchedShape',
  'BackButtonDispatcher',
  'BackButtonListener',
  'BackdropFilter',
  'BallisticScrollActivity',
  'Banner',
  'BannerPainter',
  'Baseline',
  'BaseTapAndDragGestureRecognizer',
  'BeveledRectangleBorder',
  'BlockSemantics',
  'Border',
  'BorderDirectional',
  'BorderRadius',
  'BorderRadiusDirectional',
  'BorderRadiusGeometry',
  'BorderRadiusTween',
  'BorderSide',
  'BorderTween',
  'BottomNavigationBarItem',
  'BouncingScrollPhysics',
  'BouncingScrollSimulation',
  'BoxBorder',
  'BoxConstraints',
  'BoxConstraintsTween',
  'BoxDecoration',
  'BoxPainter',
  'BoxScrollView',
  'BoxShadow',
  'BuildContext',
  'Builder',
  'BuildOwner',
  'ButtonActivateIntent',
  'CallbackAction',
  'CallbackShortcuts',
  'Canvas',
  'CapturedThemes',
  'CatmullRomCurve',
  'CatmullRomSpline',
  'Center',
  'ChangeNotifier',
  'CharacterActivator',
  'CharacterRange',
  'Characters',
  'CheckedModeBanner',
  'ChildBackButtonDispatcher',
  'CircleBorder',
  'CircularNotchedRectangle',
  'ClampingScrollPhysics',
  'ClampingScrollSimulation',
  'ClipboardStatusNotifier',
  'ClipContext',
  'ClipOval',
  'ClipPath',
  'ClipRect',
  'ClipRRect',
  'Color',
  'ColoredBox',
  'ColorFilter',
  'ColorFiltered',
  'ColorProperty',
  'ColorSwatch',
  'ColorTween',
  'Column',
  'ComponentElement',
  'CompositedTransformFollower',
  'CompositedTransformTarget',
  'CompoundAnimation',
  'ConstantTween',
  'ConstrainedBox',
  'ConstrainedLayoutBuilder',
  'ConstraintsTransformBox',
  'Container',
  'ContentInsertionConfiguration',
  'ContextAction',
  'ContextMenuButtonItem',
  'ContextMenuController',
  'ContinuousRectangleBorder',
  'CopySelectionTextIntent',
  'Cubic',
  'Curve',
  'Curve2D',
  'Curve2DSample',
  'CurvedAnimation',
  'Curves',
  'CurveTween',
  'CustomClipper',
  'CustomMultiChildLayout',
  'CustomPaint',
  'CustomPainter',
  'CustomPainterSemantics',
  'CustomScrollView',
  'CustomSingleChildLayout',
  'DebugCreator',
  'DecoratedBox',
  'DecoratedBoxTransition',
  'Decoration',
  'DecorationImage',
  'DecorationImagePainter',
  'DecorationTween',
  'DefaultAssetBundle',
  'DefaultPlatformMenuDelegate',
  'DefaultSelectionStyle',
  'DefaultTextEditingShortcuts',
  'DefaultTextHeightBehavior',
  'DefaultTextStyle',
  'DefaultTextStyleTransition',
  'DefaultTransitionDelegate',
  'DefaultWidgetsLocalizations',
  'DeleteCharacterIntent',
  'DeleteToLineBreakIntent',
  'DeleteToNextWordBoundaryIntent',
  'DesktopTextSelectionToolbarLayoutDelegate',
  'DevToolsDeepLinkProperty',
  'DiagnosticsNode',
  'DirectionalCaretMovementIntent',
  'DirectionalFocusAction',
  'DirectionalFocusIntent',
  'Directionality',
  'DirectionalTextEditingIntent',
  'DismissAction',
  'Dismissible',
  'DismissIntent',
  'DismissUpdateDetails',
  'DisplayFeatureSubScreen',
  'DisposableBuildContext',
  'DoNothingAction',
  'DoNothingAndStopPropagationIntent',
  'DoNothingAndStopPropagationTextIntent',
  'DoNothingIntent',
  'DragDownDetails',
  'DragEndDetails',
  'Draggable',
  'DraggableDetails',
  'DraggableScrollableActuator',
  'DraggableScrollableController',
  'DraggableScrollableNotification',
  'DraggableScrollableSheet',
  'DragScrollActivity',
  'DragStartDetails',
  'DragTarget',
  'DragTargetDetails',
  'DragUpdateDetails',
  'DrivenScrollActivity',
  'DualTransitionBuilder',
  'EdgeDraggingAutoScroller',
  'EdgeInsets',
  'EdgeInsetsDirectional',
  'EdgeInsetsGeometry',
  'EdgeInsetsGeometryTween',
  'EdgeInsetsTween',
  'EditableText',
  'EditableTextState',
  'ElasticInCurve',
  'ElasticInOutCurve',
  'ElasticOutCurve',
  'Element',
  'EmptyTextSelectionControls',
  'ErrorDescription',
  'ErrorHint',
  'ErrorSummary',
  'ErrorWidget',
  'ExactAssetImage',
  'ExcludeFocus',
  'ExcludeFocusTraversal',
  'ExcludeSemantics',
  'Expanded',
  'ExpandSelectionToDocumentBoundaryIntent',
  'ExpandSelectionToLineBreakIntent',
  'ExtendSelectionByCharacterIntent',
  'ExtendSelectionByPageIntent',
  'ExtendSelectionToDocumentBoundaryIntent',
  'ExtendSelectionToLineBreakIntent',
  'ExtendSelectionToNextParagraphBoundaryIntent',
  'ExtendSelectionToNextParagraphBoundaryOrCaretLocationIntent',
  'ExtendSelectionToNextWordBoundaryIntent',
  'ExtendSelectionToNextWordBoundaryOrCaretLocationIntent',
  'ExtendSelectionVerticallyToAdjacentLineIntent',
  'ExtendSelectionVerticallyToAdjacentPageIntent',
  'FadeInImage',
  'FadeTransition',
  'FileImage',
  'FittedBox',
  'FittedSizes',
  'FixedColumnWidth',
  'FixedExtentMetrics',
  'FixedExtentScrollController',
  'FixedExtentScrollPhysics',
  'FixedScrollMetrics',
  'Flex',
  'FlexColumnWidth',
  'Flexible',
  'FlippedCurve',
  'FlippedTweenSequence',
  'Flow',
  'FlowDelegate',
  'FlowPaintingContext',
  'FlutterErrorDetails',
  'FlutterLogoDecoration',
  'Focus',
  'FocusableActionDetector',
  'FocusAttachment',
  'FocusManager',
  'FocusNode',
  'FocusOrder',
  'FocusScope',
  'FocusScopeNode',
  'FocusTraversalGroup',
  'FocusTraversalOrder',
  'FocusTraversalPolicy',
  'FontWeight',
  'ForcePressDetails',
  'Form',
  'FormField',
  'FormFieldState',
  'FormState',
  'FractionallySizedBox',
  'FractionalOffset',
  'FractionalOffsetTween',
  'FractionalTranslation',
  'FractionColumnWidth',
  'FutureBuilder',
  'GestureDetector',
  'GestureRecognizerFactory',
  'GestureRecognizerFactoryWithHandlers',
  'GlobalKey',
  'GlobalObjectKey',
  'GlowingOverscrollIndicator',
  'Gradient',
  'GradientRotation',
  'GradientTransform',
  'GridPaper',
  'GridView',
  'Hero',
  'HeroController',
  'HeroControllerScope',
  'HeroMode',
  'HoldScrollActivity',
  'HSLColor',
  'HSVColor',
  'HtmlElementView',
  'Icon',
  'IconData',
  'IconDataProperty',
  'IconTheme',
  'IconThemeData',
  'IdleScrollActivity',
  'IgnorePointer',
  'Image',
  'ImageCache',
  'ImageCacheStatus',
  'ImageChunkEvent',
  'ImageConfiguration',
  'ImageFiltered',
  'ImageIcon',
  'ImageInfo',
  'ImageProvider',
  'ImageShader',
  'ImageSizeInfo',
  'ImageStream',
  'ImageStreamCompleter',
  'ImageStreamCompleterHandle',
  'ImageStreamListener',
  'ImageTilingInfo',
  'ImplicitlyAnimatedWidget',
  'ImplicitlyAnimatedWidgetState',
  'IndexedSemantics',
  'IndexedSlot',
  'IndexedStack',
  'InheritedElement',
  'InheritedModel',
  'InheritedModelElement',
  'InheritedNotifier',
  'InheritedTheme',
  'InheritedWidget',
  'InlineSpan',
  'InlineSpanSemanticsInformation',
  'InspectorSelection',
  'InspectorSerializationDelegate',
  'Intent',
  'InteractiveViewer',
  'Interval',
  'IntrinsicColumnWidth',
  'IntrinsicHeight',
  'IntrinsicWidth',
  'IntTween',
  'KeepAlive',
  'KeepAliveHandle',
  'KeepAliveNotification',
  'Key',
  'KeyboardInsertedContent',
  'KeyboardListener',
  'KeyedSubtree',
  'KeyEvent',
  'KeySet',
  'LabeledGlobalKey',
  'LayerLink',
  'LayoutBuilder',
  'LayoutChangedNotification',
  'LayoutId',
  'LeafRenderObjectElement',
  'LeafRenderObjectWidget',
  'LexicalFocusOrder',
  'LimitedBox',
  'LinearBorder',
  'LinearBorderEdge',
  'LinearGradient',
  'ListBody',
  'Listenable',
  'ListenableBuilder',
  'Listener',
  'ListView',
  'ListWheelChildBuilderDelegate',
  'ListWheelChildDelegate',
  'ListWheelChildListDelegate',
  'ListWheelChildLoopingListDelegate',
  'ListWheelElement',
  'ListWheelScrollView',
  'ListWheelViewport',
  'Locale',
  'LocalHistoryEntry',
  'Localizations',
  'LocalizationsDelegate',
  'LocalKey',
  'LogicalKeySet',
  'LongPressDraggable',
  'LongPressEndDetails',
  'LongPressMoveUpdateDetails',
  'LongPressStartDetails',
  'LookupBoundary',
  'MagnifierController',
  'MagnifierDecoration',
  'MagnifierInfo',
  'MaskFilter',
  'Matrix4',
  'Matrix4Tween',
  'MatrixUtils',
  'MaxColumnWidth',
  'MediaQuery',
  'MediaQueryData',
  'MemoryImage',
  'MergeSemantics',
  'MetaData',
  'MinColumnWidth',
  'ModalBarrier',
  'ModalRoute',
  'MouseCursor',
  'MouseRegion',
  'MultiChildLayoutDelegate',
  'MultiChildRenderObjectElement',
  'MultiChildRenderObjectWidget',
  'MultiFrameImageStreamCompleter',
  'MultiSelectableSelectionContainerDelegate',
  'NavigationToolbar',
  'Navigator',
  'NavigatorObserver',
  'NavigatorState',
  'NestedScrollView',
  'NestedScrollViewState',
  'NestedScrollViewViewport',
  'NetworkImage',
  'NeverScrollableScrollPhysics',
  'NextFocusAction',
  'NextFocusIntent',
  'NotchedShape',
  'Notification',
  'NotificationListener',
  'NumericFocusOrder',
  'ObjectKey',
  'Offset',
  'Offstage',
  'OneFrameImageStreamCompleter',
  'Opacity',
  'OrderedTraversalPolicy',
  'OrientationBuilder',
  'OutlinedBorder',
  'OvalBorder',
  'OverflowBar',
  'OverflowBox',
  'Overlay',
  'OverlayEntry',
  'OverlayPortal',
  'OverlayPortalController',
  'OverlayRoute',
  'OverlayState',
  'OverscrollIndicatorNotification',
  'OverscrollNotification',
  'Padding',
  'Page',
  'PageController',
  'PageMetrics',
  'PageRoute',
  'PageRouteBuilder',
  'PageScrollPhysics',
  'PageStorage',
  'PageStorageBucket',
  'PageStorageKey',
  'PageView',
  'Paint',
  'PaintingContext',
  'ParametricCurve',
  'ParentDataElement',
  'ParentDataWidget',
  'PasteTextIntent',
  'Path',
  'PerformanceOverlay',
  'PhysicalModel',
  'PhysicalShape',
  'Placeholder',
  'PlaceholderDimensions',
  'PlaceholderSpan',
  'PlatformMenu',
  'PlatformMenuBar',
  'PlatformMenuDelegate',
  'PlatformMenuItem',
  'PlatformMenuItemGroup',
  'PlatformProvidedMenuItem',
  'PlatformRouteInformationProvider',
  'PlatformSelectableRegionContextMenu',
  'PlatformViewCreationParams',
  'PlatformViewLink',
  'PlatformViewSurface',
  'PointerCancelEvent',
  'PointerDownEvent',
  'PointerEvent',
  'PointerMoveEvent',
  'PointerUpEvent',
  'PopupRoute',
  'Positioned',
  'PositionedDirectional',
  'PositionedTransition',
  'PreferredSize',
  'PreferredSizeWidget',
  'PreviousFocusAction',
  'PreviousFocusIntent',
  'PrimaryScrollController',
  'PrioritizedAction',
  'PrioritizedIntents',
  'ProxyAnimation',
  'ProxyElement',
  'ProxyWidget',
  'RadialGradient',
  'Radius',
  'RangeMaintainingScrollPhysics',
  'RawAutocomplete',
  'RawDialogRoute',
  'RawGestureDetector',
  'RawGestureDetectorState',
  'RawImage',
  'RawKeyboardListener',
  'RawKeyEvent',
  'RawMagnifier',
  'RawScrollbar',
  'RawScrollbarState',
  'ReadingOrderTraversalPolicy',
  'Rect',
  'RectTween',
  'RedoTextIntent',
  'RelativePositionedTransition',
  'RelativeRect',
  'RelativeRectTween',
  'RenderBox',
  'RenderNestedScrollViewViewport',
  'RenderObject',
  'RenderObjectElement',
  'RenderObjectToWidgetAdapter',
  'RenderObjectToWidgetElement',
  'RenderObjectWidget',
  'RenderSemanticsGestureHandler',
  'RenderSliverOverlapAbsorber',
  'RenderSliverOverlapInjector',
  'RenderTapRegion',
  'RenderTapRegionSurface',
  'ReorderableDelayedDragStartListener',
  'ReorderableDragStartListener',
  'ReorderableList',
  'ReorderableListState',
  'RepaintBoundary',
  'ReplaceTextIntent',
  'RequestFocusAction',
  'RequestFocusIntent',
  'ResizeImage',
  'ResizeImageKey',
  'RestorableBool',
  'RestorableBoolN',
  'RestorableChangeNotifier',
  'RestorableDateTime',
  'RestorableDateTimeN',
  'RestorableDouble',
  'RestorableDoubleN',
  'RestorableEnum',
  'RestorableEnumN',
  'RestorableInt',
  'RestorableIntN',
  'RestorableListenable',
  'RestorableNum',
  'RestorableNumN',
  'RestorableProperty',
  'RestorableRouteFuture',
  'RestorableString',
  'RestorableStringN',
  'RestorableTextEditingController',
  'RestorableValue',
  'RestorationBucket',
  'RestorationScope',
  'ReverseAnimation',
  'ReverseTween',
  'RichText',
  'RootBackButtonDispatcher',
  'RootRenderObjectElement',
  'RootRestorationScope',
  'RotatedBox',
  'RotationTransition',
  'RoundedRectangleBorder',
  'Route',
  'RouteAware',
  'RouteInformation',
  'RouteInformationParser',
  'RouteInformationProvider',
  'RouteObserver',
  'Router',
  'RouterConfig',
  'RouterDelegate',
  'RouteSettings',
  'RouteTransitionRecord',
  'Row',
  'RRect',
  'RSTransform',
  'SafeArea',
  'SawTooth',
  'ScaleEndDetails',
  'ScaleStartDetails',
  'ScaleTransition',
  'ScaleUpdateDetails',
  'Scrollable',
  'ScrollableDetails',
  'ScrollableState',
  'ScrollAction',
  'ScrollActivity',
  'ScrollActivityDelegate',
  'ScrollAwareImageProvider',
  'ScrollbarPainter',
  'ScrollBehavior',
  'ScrollConfiguration',
  'ScrollContext',
  'ScrollController',
  'ScrollDragController',
  'ScrollEndNotification',
  'ScrollHoldController',
  'ScrollIncrementDetails',
  'ScrollIntent',
  'ScrollMetricsNotification',
  'ScrollNotification',
  'ScrollNotificationObserver',
  'ScrollNotificationObserverState',
  'ScrollPhysics',
  'ScrollPosition',
  'ScrollPositionWithSingleContext',
  'ScrollSpringSimulation',
  'ScrollStartNotification',
  'ScrollToDocumentBoundaryIntent',
  'ScrollUpdateNotification',
  'ScrollView',
  'SelectableRegion',
  'SelectableRegionState',
  'SelectAction',
  'SelectAllTextIntent',
  'SelectIntent',
  'SelectionContainer',
  'SelectionContainerDelegate',
  'SelectionOverlay',
  'SelectionRegistrarScope',
  'Semantics',
  'SemanticsDebugger',
  'SemanticsGestureDelegate',
  'Shader',
  'ShaderMask',
  'ShaderWarmUp',
  'Shadow',
  'ShapeBorder',
  'ShapeBorderClipper',
  'ShapeDecoration',
  'SharedAppData',
  'ShortcutActivator',
  'ShortcutManager',
  'ShortcutMapProperty',
  'ShortcutRegistrar',
  'ShortcutRegistry',
  'ShortcutRegistryEntry',
  'Shortcuts',
  'ShortcutSerialization',
  'ShrinkWrappingViewport',
  'Simulation',
  'SingleActivator',
  'SingleChildLayoutDelegate',
  'SingleChildRenderObjectElement',
  'SingleChildRenderObjectWidget',
  'SingleChildScrollView',
  'Size',
  'SizeChangedLayoutNotification',
  'SizeChangedLayoutNotifier',
  'SizedBox',
  'SizedOverflowBox',
  'SizeTransition',
  'SizeTween',
  'SlideTransition',
  'SliverAnimatedGrid',
  'SliverAnimatedGridState',
  'SliverAnimatedList',
  'SliverAnimatedListState',
  'SliverAnimatedOpacity',
  'SliverChildBuilderDelegate',
  'SliverChildDelegate',
  'SliverChildListDelegate',
  'SliverFadeTransition',
  'SliverFillRemaining',
  'SliverFillViewport',
  'SliverFixedExtentList',
  'SliverGrid',
  'SliverGridDelegate',
  'SliverGridDelegateWithFixedCrossAxisCount',
  'SliverGridDelegateWithMaxCrossAxisExtent',
  'SliverIgnorePointer',
  'SliverLayoutBuilder',
  'SliverList',
  'SliverMultiBoxAdaptorElement',
  'SliverMultiBoxAdaptorWidget',
  'SliverOffstage',
  'SliverOpacity',
  'SliverOverlapAbsorber',
  'SliverOverlapAbsorberHandle',
  'SliverOverlapInjector',
  'SliverPadding',
  'SliverPersistentHeader',
  'SliverPersistentHeaderDelegate',
  'SliverPrototypeExtentList',
  'SliverReorderableList',
  'SliverReorderableListState',
  'SliverSafeArea',
  'SliverToBoxAdapter',
  'SliverVisibility',
  'SliverWithKeepAliveWidget',
  'SlottedRenderObjectElement',
  'SnapshotController',
  'SnapshotPainter',
  'SnapshotWidget',
  'Spacer',
  'SpellCheckConfiguration',
  'SpringDescription',
  'Stack',
  'StadiumBorder',
  'StarBorder',
  'State',
  'StatefulBuilder',
  'StatefulElement',
  'StatefulWidget',
  'StatelessElement',
  'StatelessWidget',
  'StatusTransitionWidget',
  'StepTween',
  'StreamBuilder',
  'StreamBuilderBase',
  'StretchingOverscrollIndicator',
  'StrutStyle',
  'SweepGradient',
  'SystemMouseCursors',
  'Table',
  'TableBorder',
  'TableCell',
  'TableColumnWidth',
  'TableRow',
  'TapAndDragGestureRecognizer',
  'TapAndHorizontalDragGestureRecognizer',
  'TapAndPanGestureRecognizer',
  'TapDownDetails',
  'TapDragDownDetails',
  'TapDragEndDetails',
  'TapDragStartDetails',
  'TapDragUpdateDetails',
  'TapDragUpDetails',
  'TapRegion',
  'TapRegionRegistry',
  'TapRegionSurface',
  'TapUpDetails',
  'Text',
  'TextAlignVertical',
  'TextBox',
  'TextDecoration',
  'TextEditingController',
  'TextEditingValue',
  'TextFieldTapRegion',
  'TextHeightBehavior',
  'TextInputType',
  'TextMagnifierConfiguration',
  'TextPainter',
  'TextPosition',
  'TextRange',
  'TextSelection',
  'TextSelectionControls',
  'TextSelectionGestureDetector',
  'TextSelectionGestureDetectorBuilder',
  'TextSelectionGestureDetectorBuilderDelegate',
  'TextSelectionOverlay',
  'TextSelectionPoint',
  'TextSelectionToolbarAnchors',
  'TextSelectionToolbarLayoutDelegate',
  'TextSpan',
  'TextStyle',
  'TextStyleTween',
  'Texture',
  'ThreePointCubic',
  'Threshold',
  'TickerFuture',
  'TickerMode',
  'TickerProvider',
  'Title',
  'Tolerance',
  'ToolbarItemsParentData',
  'ToolbarOptions',
  'TrackingScrollController',
  'TrainHoppingAnimation',
  'Transform',
  'TransformationController',
  'TransformProperty',
  'TransitionDelegate',
  'TransitionRoute',
  'TransposeCharactersIntent',
  'Tween',
  'TweenAnimationBuilder',
  'TweenSequence',
  'TweenSequenceItem',
  'UiKitView',
  'UnconstrainedBox',
  'UndoHistory',
  'UndoHistoryController',
  'UndoHistoryState',
  'UndoHistoryValue',
  'UndoTextIntent',
  'UniqueKey',
  'UniqueWidget',
  'UnmanagedRestorationScope',
  'UpdateSelectionIntent',
  'UserScrollNotification',
  'ValueKey',
  'ValueListenableBuilder',
  'ValueNotifier',
  'Velocity',
  'View',
  'Viewport',
  'Visibility',
  'VoidCallbackAction',
  'VoidCallbackIntent',
  'Widget',
  'WidgetInspector',
  'WidgetOrderTraversalPolicy',
  'WidgetsApp',
  'WidgetsBindingObserver',
  'WidgetsFlutterBinding',
  'WidgetsLocalizations',
  'WidgetSpan',
  'WidgetToRenderBoxAdapter',
  'WillPopScope',
  'WordBoundary',
  'Wrap'
});
