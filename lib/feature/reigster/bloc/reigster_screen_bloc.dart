import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'reigster_screen_event.dart';
part 'reigster_screen_state.dart';

class ReigsterScreenBloc
    extends Bloc<ReigsterScreenEvent, ReigsterScreenState> {
  ReigsterScreenBloc() : super(ReigsterScreenInitial()) {
    on<ReigsterScreenInitEvent>((event, emit) async {
      emit(ReigsterScreenLoading());
    });
  }
}
