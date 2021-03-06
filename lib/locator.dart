import 'package:flutter_tdt/core/services/auth_service.dart';
import 'package:flutter_tdt/core/services/language_service.dart';
import 'package:flutter_tdt/view/view_models/login_view.dart';
import 'package:flutter_tdt/view/view_models/register_view.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/app_router.dart';
import 'core/navigation/router.dart';
import 'core/network/firebase_api.dart';

GetIt locator = GetIt.instance;

void setupLocator({bool testing = false}) {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LanguageService());
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => Routes());
  locator.registerLazySingleton(() => FirebaseAPI());

  locator.registerFactory(() => RegisterView());
  locator.registerFactory(() => LoginView());
}
