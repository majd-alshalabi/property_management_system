import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';
part 'reigster_screen_event.dart';
part 'reigster_screen_state.dart';

class ReigsterScreenBloc
    extends Bloc<ReigsterScreenEvent, ReigsterScreenState> {
  ReigsterScreenBloc() : super(ReigsterScreenInitial()) {
    on<ReigsterScreenInitEvent>((event, emit) async {
      emit(ReigsterScreenLoading());
      await Future.delayed(Duration(seconds: 2));
      (await HttpHelper().register(RegisterParams(
              email: 'masjsdsdsd@gmail.com',
              name: 'asdasd',
              password: 'sadads0',
              image: null)))
          .either((left) {
        print(left.toJson());
        emit(ReigsterScreenLoaded());
      }, (right) {
        emit(ReigsterScreenError('error while loading'));
      });
      ;
    });
  }
}
