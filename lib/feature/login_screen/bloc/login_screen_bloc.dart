import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/helper/database_model/identity_model.dart';
import 'package:property_management_system/core/helper/http_helper.dart';
import 'package:property_management_system/core/model/login_model/login_params.dart';
import 'package:property_management_system/core/model/register_model/register_params.dart';

part 'login_screen_event.dart';
part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenInitial()) {
    DatabaseHelper db = DatabaseHelper();
    on<LoginInScreenLoginEvent>((event, emit) async {
      emit(LoginScreenLoading());
      (await HttpHelper.login(LoginParams(
        email: event.email,
        password: event.password,
      )))
          .either((left) {
        if (left.data != null) {
          db.insertMyIdentity(MyIdentity(
              email: left.data!.email,
              imageUrl: left.data!.userImageUri,
              name: left.data!.name,
              phoneNumber: left.data!.phoneNo,
              token: left.token,
              user_role: left.data!.user_role));
          emit(LoginScreenLoaded());
        }
      }, (right) {
        emit(LoginScreenError('error while loading'));
      });
      emit(LoginScreenLoaded());
    });
  }
}
