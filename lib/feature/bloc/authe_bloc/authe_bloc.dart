import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:project_albaraka_statemangment/model/handling_model.dart';
import 'package:project_albaraka_statemangment/model/signup_user_model.dart';
import 'package:project_albaraka_statemangment/service/auth_service.dart';

import '../../../model/login_user_model.dart';

part 'authe_event.dart';
part 'authe_state.dart';

class AutheBloc extends Bloc<AutheEvent, AutheState> {
  AutheBloc() : super(AutheInitial()) {
    on<Register>((event, emit) async {
      print("ghjkl;");
      emit(Loading());
      ResultModel result = await AuthSeviceImp().signUp(event.user);
      if (result is DataSuccess) {
        emit(SuccessToRegister());
      } else {
        emit(Failed(message: result.runtimeType.toString()));
      }
    });
    on<LogIn>((event, emit) async {
      print("object");
      emit(Loading());
      ResultModel result = await AuthSeviceImp().logIn(event.user);
      if (result is DataSuccess) {
        emit(SuccessToRegister());
      } else {
        emit(Failed(message: result.runtimeType.toString()));
      }
    });
  }
}
