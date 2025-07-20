part of 'package:flutter_addons/flutter_addons.dart';

/// A lightweight widget and controller to detect keyboard visibility using MediaQuery.
/// No platform channel or external dependency required.
/// Controller for tracking keyboard visibility using [ChangeNotifier].
class KeyboardVisibilityController extends ChangeNotifier
    with WidgetsBindingObserver {
  bool _isVisible = false;

  KeyboardVisibilityController() {
    WidgetsBinding.instance.addObserver(this);
    _isVisible =
        WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .viewInsets
            .bottom >
        0;
  }

  bool get isVisible => _isVisible;

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset =
        WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .viewInsets
            .bottom;
    final newVisibility = bottomInset > 0;
    if (newVisibility != _isVisible) {
      _isVisible = newVisibility;
      notifyListeners();
    }
  }
}

/// Signature for the builder function which returns [isKeyboardVisible].
typedef KeyboardVisibilityWidgetBuilder =
    Widget Function(BuildContext context, bool isKeyboardVisible);

/// A widget that rebuilds when the keyboard visibility changes.
class KeyboardVisibilityBuilder extends StatefulWidget {
  final KeyboardVisibilityWidgetBuilder builder;

  const KeyboardVisibilityBuilder({super.key, required this.builder});

  @override
  State<KeyboardVisibilityBuilder> createState() =>
      _KeyboardVisibilityBuilderState();
}

class _KeyboardVisibilityBuilderState extends State<KeyboardVisibilityBuilder>
    with WidgetsBindingObserver {
  late bool _isKeyboardVisible;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _isKeyboardVisible = View.of(context).viewInsets.bottom > 0;
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final bottomInset = View.of(context).viewInsets.bottom;
    ;
    final newVisibility = bottomInset > 0;
    if (newVisibility != _isKeyboardVisible) {
      setState(() => _isKeyboardVisible = newVisibility);
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context, _isKeyboardVisible);
  }
}
