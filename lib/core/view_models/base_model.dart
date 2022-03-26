import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;
  ViewState get state => _state;

  void applyState(ViewState viewState) {
    log('CHANGE STATE ===> $runtimeType ===> $viewState');
    _state = viewState;
    notifyListeners();
  }

  refresh() {
    log('REFRESH STATE ===> $runtimeType');
    notifyListeners();
  }
}
