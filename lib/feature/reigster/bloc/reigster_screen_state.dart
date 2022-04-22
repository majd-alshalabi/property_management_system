part of 'reigster_screen_bloc.dart';

@immutable
abstract class ReigsterScreenState {}

class ReigsterScreenInitial extends ReigsterScreenState {}

class ReigsterScreenLoading extends ReigsterScreenState {}

class ReigsterScreenLoaded extends ReigsterScreenState {}

class ReigsterScreenRejectPermissionState extends ReigsterScreenState {}
