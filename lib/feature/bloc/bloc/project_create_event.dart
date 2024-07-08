part of 'project_create_bloc.dart';

@immutable
sealed class ProjectCreateEvent {}

class project extends ProjectCreateEvent {
  final ProjectModel projectsevent;
  project({
    required this.projectsevent,
  });
}
