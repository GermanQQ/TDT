import 'package:flutter_tdt/core/network/auth_service.dart';
import 'package:flutter_tdt/core/view_models/auth_model.dart';
import 'package:flutter_tdt/core/view_models/language_model.dart';
import 'package:flutter_tdt/core/view_models/register_model.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/app_router.dart';
import 'core/navigation/router.dart';

GetIt locator = GetIt.instance;

void setupLocator({bool testing = false}) {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => LanguageModel());
  locator.registerLazySingleton(() => AuthModel());
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => Routes());

  locator.registerFactory(() => RegisterModel());
}
