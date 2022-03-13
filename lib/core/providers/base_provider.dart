import 'package:flutter/material.dart';

class BaseProvider with ChangeNotifier {
  refresh() => notifyListeners();
}
