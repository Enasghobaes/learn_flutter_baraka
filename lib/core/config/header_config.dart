import 'package:dio/dio.dart';
import 'package:project_albaraka_statemangment/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(
        headers: {
          "accept": "*/*",
          "Authorization": "Bearer ${(
            core.get<SharedPreferences>().getString(
                  'token',
                ),
          )}"
        },
      );
    } else {
      return Options(
        headers: {
          "Content-Type": "application/json",
        },
      );
    }
  }
}