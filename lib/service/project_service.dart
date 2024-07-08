import 'package:dio/dio.dart';
import 'package:project_albaraka_statemangment/service/core_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/get_it_config.dart';
import '../core/config/header_config.dart';
import '../model/handling_model.dart';

abstract class createproject_service extends CoreService {
  Future<ResultModel> postproject(project);
}

class createproject_serviceImp extends createproject_service {
  @override
  Future<ResultModel> postproject(project) async {
    try {
      print(baseurl + "/projects");
      print(project.toMap());
      print(
        core.get<SharedPreferences>().getString(
              'token',
            ),
      );
      response = await dio.post(baseurl + "/projects",
          data: project.toMap(),
          options: Options(
            headers: {
              "Authorization":
                  "Bearer ${(core.get<SharedPreferences>().getString('token'))}"
            },
          ));
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
}
