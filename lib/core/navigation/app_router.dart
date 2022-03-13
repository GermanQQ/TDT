import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/constants/routes.dart';
import 'package:flutter_tdt/core/enums/enums.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/locator.dart';

import '../../view/screens/sreens.dart';
import '../providers/language_provider.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter() : navigatorKey = GlobalKey<NavigatorState>() {
    locator<AuthProvider>().addListener(notifyListeners);
    locator<LanguageProvider>().addListener(notifyListeners);
  }

  @override
  void dispose() {
    locator<AuthProvider>().removeListener(notifyListeners);
    locator<LanguageProvider>().removeListener(notifyListeners);
    super.dispose();
  }
  final _auth = locator<AuthProvider>();


  @override
  Widget build(BuildContext context) {
    final isAutheticaded = _auth.statusAuth == AuthStatus.Authenticated;

    List<Page> pages = [
      if (_auth.statusAuth == AuthStatus.Unauthenticated &&
          LanguageProvider.lang == null)
        LanguageInitialPage.page(),
      if (_auth.statusAuth == AuthStatus.Authenticating ||
          _auth.statusAuth == AuthStatus.Registering ||
          _auth.statusAuth == AuthStatus.Uninitialized)
        InitialPage.page(),
      if (_auth.statusAuth == AuthStatus.Unauthenticated &&
          LanguageProvider.lang != null)
        SliderPage.page(),
      if (!isAutheticaded && _auth.navLogin ) LoginPage.page(),
      if (!isAutheticaded && _auth.navRegister) RegisteringPage.page(),
      if (isAutheticaded) CoursesPage.page(),
    ];

    return Navigator(
      key: navigatorKey,
      onPopPage: _handlePopPage,
      pages: pages,
    );
  }

  bool _handlePopPage(Route<dynamic> route, result) {
    if (!route.didPop(result)) return false;

    final page = route.settings as MaterialPage;

    if (page.name == Routes.login) _auth.tapOnLogin(false);
    if (page.name == Routes.reqister) _auth.tapOnRegister(false);

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async => null;
}
