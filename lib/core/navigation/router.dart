import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/core/providers/base_provider.dart';
import 'package:flutter_tdt/locator.dart';

class Routes extends BaseProvider {
  static String initialLang = '/initial_lang';
  static String login = '/login';
  static String initialLoading = '/initial_loading';
  static String sliderPage = '/slider';
  static String reqister = '/reqister';
  static String home = '/';

  static const int poolExpert = 0; 
  static const int courses = 1; 
  static const int profile = 2; 

  int _currentIndex = courses;
  bool _navigateLogin = false;
  bool _navigateRegister = false;

  AuthStatus get status => locator<AuthProvider>().statusAuth;

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
}
