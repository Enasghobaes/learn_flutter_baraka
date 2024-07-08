import 'package:bloc/bloc.dart';
import 'package:project_albaraka_statemangment/model/add_task_model.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(IntialListTasks()) {
    List<add_task_model> tasks = [];
    on<createnewtextfield>((event, emit) {
      tasks.add(
          add_task_model(projectId: 1, taskDescription: '', taskStatus: ''));
      emit(newtextfieldcreated(addtaskTotextfield: tasks));
    });
    on<Deletetextfieldevent>((event, emit) {
      tasks.last = event.delTask;
      emit(DeleteTextfield());
      emit(newtextfieldcreated(addtaskTotextfield: tasks));
      // tasks.removeAt(event.delTask);
    });
  }
}
