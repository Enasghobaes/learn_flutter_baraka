part of 'authe_bloc.dart';

@immutable
sealed class AutheEvent {}

class Register extends AutheEvent {
  final SignupUserModel user;
  Register({
    required this.user,
  });
}

class LogIn extends AutheEvent {
  final loginUserModel user;
  LogIn({
    required this.user,
  });
}

class LogOut extends AutheEvent {}
