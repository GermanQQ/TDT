import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  refresh() {
    print('__REFRESH STATE__ ${this.runtimeType}');
    notifyListeners();}
}
