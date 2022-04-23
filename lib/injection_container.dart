import 'package:get_it/get_it.dart';
import 'package:property_management_system/core/helper/map_permision_helper.dart';
import 'package:property_management_system/feature/reigster/bloc/reigster_screen_bloc.dart';
import 'package:property_management_system/feature/splash_screen/bloc/splash_screen_bloc.dart';

final sl = GetIt.instance;

void init() {
  // class singleton
  sl.registerLazySingleton(
    () => MapHelper(),
  );

  //Bloc
  sl.registerLazySingleton(
    () => SplashScreenBloc(),
  );
  sl.registerLazySingleton(
    () => ReigsterScreenBloc(),
  );
}
