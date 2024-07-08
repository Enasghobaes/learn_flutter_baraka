import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:project_albaraka_statemangment/model/createproject_model.dart';

import '../../../model/handling_model.dart';
import '../../../service/project_service.dart';
part 'project_create_event.dart';
part 'project_create_state.dart';

class ProjectCreateBloc extends Bloc<ProjectCreateEvent, ProjectCreateState> {
  ProjectCreateBloc() : super(ProjectCreateInitial()) {
    on<project>((event, emit) async {
      emit(ProjectCreateloding());
      ResultModel result =
          await createproject_serviceImp().postproject(event.projectsevent);
      if (result is DataSuccess) {
        emit(ProjectCreatesuccess());
      } else {
        emit(ProjectCreatefailure(message: result.runtimeType.toString()));
      }
    });
  }
}
