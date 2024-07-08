import 'package:dio/dio.dart';
import 'package:project_albaraka_statemangment/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/config/header_config.dart';
import '../model/handling_model.dart';
import '../model/login_user_model.dart';
import '../model/signup_user_model.dart';
import 'core_service.dart';

abstract class AuthService extends CoreService {
  Future<ResultModel> signUp(SignupUserModel user);
  Future<ResultModel> logIn(loginUserModel user);
  Future<ResultModel> logOut();
  Future<ResultModel> resestPassword();
}

class AuthSeviceImp extends AuthService {
  @override
  Future<ResultModel> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> resestPassword() {
    // TODO: implement resestPassword
    throw UnimplementedError();
  }

  @override
  Future<ResultModel> signUp(SignupUserModel user) async {
    try {
      print('fghjkjjjjjjjjjjjjjjjjjjl');
      response = await dio.post(baseurl + "/auth/register", data: user.toMap());
      if (response.statusCode == 200) {
        String token = response.data['access_token'];
        core.get<SharedPreferences>().setString('token', token);
        return DataSuccess();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }

  @override
  Future<ResultModel> logIn(loginUserModel user) async {
    try {
      response = await dio.post(baseurl + "/auth/login",
          data: user.toMap(), options: HeaderConfig.getHeader());
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
