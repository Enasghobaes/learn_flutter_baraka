import 'package:dio/dio.dart';
import 'package:project_albaraka_statemangment/core/config/header_config.dart';
import 'package:project_albaraka_statemangment/model/get_task_model.dart';
import 'package:project_albaraka_statemangment/model/handling_model.dart';
import 'package:project_albaraka_statemangment/service/core_service.dart';

abstract class createproject_service extends CoreService {
  Future<ResultModel> posttasks(tasks);

  Future<ResultModel> GetTasks(id_project);
}

class createproject_serviceImp extends createproject_service {
  @override
  Future<ResultModel> posttasks(tasks) async {
    try {
      response = await dio.post(baseurl + "/tasks",
          data: tasks.toMap(), options: HeaderConfig.getHeader());
      print(response.statusCode);
      if (response.statusCode == 200) {
        return DataSuccess();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }

  @override
  Future<ResultModel> GetTasks(id_project) async {
    try {
      response = await dio.get(
          baseurl + "/tasks/tasks-by-project/" + id_project.toString(),
          options: HeaderConfig.getHeader());

      if (response.statusCode == 200) {
        List<get_task_mddel> tasks = List.generate(
          response.data.length,
          (index) => get_task_mddel.fromJson(
            response.data[index],
          ),
        );
        return ListOf(listOfData: tasks);
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}
