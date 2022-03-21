import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tdt/core/navigation/app_router.dart';
import 'package:flutter_tdt/core/navigation/router.dart';
import 'package:flutter_tdt/core/view_models/auth_model.dart';
import 'package:flutter_tdt/core/view_models/language_model.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:provider/provider.dart';
import 'core/constants/constans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  runApp(await LanguageModel.localize(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp() {
    locator<AuthModel>().appStarted();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = TDTTheme.light();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Routes>(create: (_) => locator<Routes>()),
        ChangeNotifierProvider<AuthModel>(create: (_) => locator<AuthModel>()),
        ChangeNotifierProvider<LanguageModel>(create: (_) => locator<LanguageModel>()),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}