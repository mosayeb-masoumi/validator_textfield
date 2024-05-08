
import 'package:get_it/get_it.dart';
import 'package:untitled/app_validator.dart';
import 'package:untitled/home/home_validator.dart';

final di = GetIt.instance;

void setUpDi(){

  di.registerLazySingleton<AppValidator>(() => AppValidator());
  di.registerLazySingleton<HomeFormValidator>(() => HomeFormValidator());
}