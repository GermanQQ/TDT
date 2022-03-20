import 'package:flutter_tdt/core/providers/login_provider.dart';
import 'package:flutter_tdt/core/providers/register_provider.dart';
import 'package:flutter_tdt/core/network/auth_api.dart';
import 'package:get_it/get_it.dart';

import 'core/navigation/app_router.dart';
import 'core/providers/language_provider.dart';
import 'core/providers/auth_provider.dart';
import 'core/navigation/router.dart';
import 'core/network/api.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthAPI());
  locator.registerLazySingleton(() => API());
  locator.registerLazySingleton(() => LanguageProvider());
  locator.registerLazySingleton(() => AuthProvider());
  locator.registerLazySingleton(() => AppRouter());
  locator.registerLazySingleton(() => Routes());
  
  locator.registerFactory(() => LoginProvider());
  locator.registerFactory(() => RegisterProvider());
}
