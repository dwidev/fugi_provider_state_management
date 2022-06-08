import 'package:flutter/material.dart';

abstract class BaseProvider<State> extends ChangeNotifier {
  State _state;

  BaseProvider(this._state);

  State get state => _state;

  @protected
  set state(State newState) {
    _state = newState;
    notifyListeners();
  }
}
