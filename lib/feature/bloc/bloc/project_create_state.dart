part of 'project_create_bloc.dart';

@immutable
sealed class ProjectCreateState {}

final class ProjectCreateInitial extends ProjectCreateState {}

class ProjectCreateloding extends ProjectCreateState {}

class ProjectCreatesuccess extends ProjectCreateState {}

// ignore: must_be_immutable
class ProjectCreatefailure extends ProjectCreateState {
  String message;
  ProjectCreatefailure({required this.message});
}
