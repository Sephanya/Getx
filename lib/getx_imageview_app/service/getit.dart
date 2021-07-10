

import 'package:get_it/get_it.dart';

import 'apicall.dart';

GetIt locator = GetIt.instance;

void serviceLocators(){
  locator.registerLazySingleton<DioServices>(() => DioServices());
}
