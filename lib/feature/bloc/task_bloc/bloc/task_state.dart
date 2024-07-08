part of 'task_bloc.dart';

abstract class TaskState {}

class IntialListTasks extends TaskState {}

class newtextfieldcreated extends TaskState {
  List<add_task_model> addtaskTotextfield;
  newtextfieldcreated({required this.addtaskTotextfield});
}

class DeleteTextfield extends TaskState {}

class sendAlltask extends TaskState {}
