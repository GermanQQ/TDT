import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/services/auth_service.dart';
import 'package:flutter_tdt/core/view_models/base_view.dart';
import 'package:flutter_tdt/locator.dart';

class Routes extends BaseView {
  static String initialLang = '/initial_lang';
  static String login = '/login';
  static String splash = '/splash';
  static String sliderPage = '/slider';
  static String reqister = '/reqister';
  static String home = '/';

  static const int poolExpert = 0;
  static const int courses = 1;
  static const int profile = 2;

  int _currentIndex = courses;
  bool _navigateLogin = false;
  bool _navigateRegister = false;

  AuthStatus get status => locator<AuthService>().authStatus;

  bool get navLogin => _navigateLogin;
  bool get navRegister => _navigateRegister;
  int get currentIndex => _currentIndex;

  set currentIndex(int index) {
    _currentIndex = index;
    refresh();
  }

  void tapOnLogin(bool selected) {
    _navigateLogin = selected;
    _navigateRegister = false;
    refresh();
  }

  void tapOnRegister(bool selected) {
    _navigateRegister = selected;
    _navigateLogin = false;
    refresh();
  }

  void logOut() {
    tapOnLogin(true);
    currentIndex = 1;
    refresh();
  }
}
