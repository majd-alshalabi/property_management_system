import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_screen_event.dart';
part 'favorite_screen_state.dart';

class FavoriteScreenBloc extends Bloc<FavoriteScreenEvent, FavoriteScreenState> {
  FavoriteScreenBloc() : super(FavoriteScreenInitial()) {
    on<FavoriteScreenEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
