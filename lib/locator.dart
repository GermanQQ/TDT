import 'package:flutter_tdt/core/network/auth_api.dart';
import 'package:flutter_tdt/core/view_models/auth_model.dart';
import 'package:flutter_tdt/core/view_models/language_model.dart';
import 'package:flutter_tdt/core/view_models/login_model.dart';
import 'package:flutter_tdt/core/view_models/register_model.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/app_router.dart';
import 'core/navigation/router.dart';
import 'core/network/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthAPI());
  locator.registerLazySingleton(() => API());
  locator.registerLazySingleton(() => LanguageModel());
  locator.registerLazySingleton(() => AuthModel());
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => Routes());
  
  locator.registerFactory(() => LoginModel());
  locator.registerFactory(() => RegisterModel());
}
