import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/map_permision_helper.dart';
import 'package:property_management_system/injection_container.dart';

part 'splash_screen_event.dart';
part 'splash_screen_state.dart';

class SplashScreenBloc extends Bloc<SplashScreenEvent, SplashScreenState> {
  SplashScreenBloc() : super(SplashScreenInitial()) {
    on<SplashScreenInitEvent>((event, emit) async {
      emit(SplashScreenLoading());
      if (await sl<MapHelper>().handlePermission()) {
        sl<MapHelper>().isPermissionAccepted = true;
        emit(SplashScreenLoaded());
      } else {
        emit(SplashScreenRejectPermissionState());
      }
    });
  }
}
