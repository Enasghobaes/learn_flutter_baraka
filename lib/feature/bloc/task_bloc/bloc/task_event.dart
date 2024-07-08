part of 'task_bloc.dart';

abstract class TaskEvent {}

class createnewtextfield extends TaskEvent {}

class Deletetextfieldevent extends TaskEvent {
  add_task_model delTask;
  Deletetextfieldevent({required this.delTask});
}

class sendalltask extends TaskEvent {}
