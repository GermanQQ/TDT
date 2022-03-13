import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tdt/core/navigation/app_router.dart';
import 'package:flutter_tdt/core/providers/language_provider.dart';
import 'package:flutter_tdt/core/providers/auth_provider.dart';
import 'package:flutter_tdt/locator.dart';
import 'package:provider/provider.dart';
import 'core/constants/constans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await EasyLocalization.ensureInitialized();
  setupLocator();
  runApp(await LanguageProvider.localize(MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp() {
    locator<AuthProvider>().appStarted();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = TDTTheme.light();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(create: (_) => locator<AuthProvider>()),
        ChangeNotifierProvider<LanguageProvider>(create: (_) => locator<LanguageProvider>()),
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