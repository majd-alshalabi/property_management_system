part of 'reigster_screen_bloc.dart';

abstract class ReigsterScreenEvent {}

class ReigsterScreenInitEvent extends ReigsterScreenEvent {
  final String email;
  final String name;
  final String password;
  final File? image;

  ReigsterScreenInitEvent(
      {required this.email,
      required this.name,
      required this.password,
      required this.image});
}
