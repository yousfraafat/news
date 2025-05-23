import 'package:flutter/foundation.dart';
import 'package:news/common/ui_state.dart';

class BaseViewModel<T> extends ChangeNotifier {
  UiState<T> state;

  BaseViewModel(this.state);

  void emit(UiState<T> newState) {
    this.state = newState;
    notifyListeners();
  }
}
