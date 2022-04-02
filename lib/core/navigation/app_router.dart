import 'package:flutter/material.dart';
import 'package:flutter_tdt/core/domain/enums/enums.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/language_view.dart';
import 'package:flutter_tdt/locator.dart';

import '../../view/screens/sreens.dart';

class AppRouter extends RouterDelegate
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  AppRouter() : navigatorKey = GlobalKey<NavigatorState>() {
    locator<LanguageView>().addListener(notifyListeners);
    locator<Routes>().addListener(notifyListeners);
  }

  @override
  void dispose() {
    locator<LanguageView>().removeListener(notifyListeners);
    locator<Routes>().removeListener(notifyListeners);
    super.dispose();
  }
  final _route = locator<Routes>();

  @override
  Widget build(BuildContext context) {
    final isAutheticaded = _route.status == AuthStatus.Authenticated;

    List<Page> pages = [
      if (_route.status == AuthStatus.Unauthenticated &&
          LanguageView.lang == null)
        LanguageInitialPage.page(),
      if (_route.status == AuthStatus.Authenticating ||
          _route.status == AuthStatus.Registering ||
          _route.status == AuthStatus.Uninitialized)
        SplashPage.page(),
      if (_route.status == AuthStatus.Unauthenticated &&
          LanguageView.lang != null)
        SliderPage.page(),
      if (!isAutheticaded && _route.navLogin ) LoginPage.page(),
      if (!isAutheticaded && _route.navRegister) RegisteringPage.page(),
      if (isAutheticaded) HomeScreen.page(),
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

    if (page.name == Routes.login) _route.tapOnLogin(false);
    if (page.name == Routes.reqister) _route.tapOnRegister(false);

    return true;
  }

  @override
  Future<void> setNewRoutePath(configuration) async {}
}
