import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_albaraka_statemangment/core/config/bloc_observe_config.dart';
import 'package:project_albaraka_statemangment/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/view/add_task_page.dart';
import 'feature/view/create&join_page.dart';
import 'feature/view/createproject_page.dart';
import 'feature/view/singup_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  Bloc.observer = MyBlocObserver();
  print(core.get<SharedPreferences>().getString('token'));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(
      core.get<SharedPreferences>().getString(
            'token',
          ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: add_task_page(
      //   id: 1,
      // ),
      home: (core.get<SharedPreferences>().getString('token') == null)
          ? singup_page()
          : create_join_page(),
    );
  }
}
