
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tdt/core/domain/constants/constans.dart';
import 'package:flutter_tdt/core/navigation/app_router.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/services/auth_service.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key) {
    locator<AuthService>().initial();
  }

  static Widget create() => ChangeNotifierProvider<Routes>(
        create: (_) => locator<Routes>(),
        child: MyApp(),
      );

  @override
  Widget build(BuildContext context) {
    final _theme = TDTTheme.light();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      title: 'Flutter TDT Starter',
      home: Router(
        routerDelegate: locator<AppRouter>(),
        backButtonDispatcher: RootBackButtonDispatcher(),
      ),
    );
  }
}
