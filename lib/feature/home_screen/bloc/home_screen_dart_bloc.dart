import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_screen_dart_event.dart';
part 'home_screen_dart_state.dart';

class HomeScreenDartBloc extends Bloc<HomeScreenDartEvent, HomeScreenDartState> {
  HomeScreenDartBloc() : super(HomeScreenDartInitial()) {
    on<HomeScreenDartEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
