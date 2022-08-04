import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:property_management_system/core/helper/database_helper.dart';
import 'package:property_management_system/core/helper/database_model/identity_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  MyIdentity? identity;
  DatabaseHelper db = DatabaseHelper();

  void initState() async {
    List<MyIdentity>? temp = await db.getMyIdentity();
    if (temp != null && temp.isNotEmpty) {
      identity = temp.first;
      print(identity!.imageUrl);
    }
  }
}
