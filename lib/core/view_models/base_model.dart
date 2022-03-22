import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  refresh() {
    print('__REFRESH STATE__ ${this.runtimeType}');
    notifyListeners();}
}
