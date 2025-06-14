// Request focus to given FocusNode

part of 'package:flutter_addons/flutter_addons.dart';

extension Focus on BuildContext {
  void requestFocus(FocusNode focus) {
    FocusScope.of(this).requestFocus(focus);
  }

  /// Request focus to given FocusNode
  void unFocus(FocusNode focus) {
    focus.unfocus();
  }
}
