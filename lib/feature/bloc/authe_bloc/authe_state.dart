part of 'authe_bloc.dart';

@immutable
sealed class AutheState {}

final class AutheInitial extends AutheState {}

class SuccessToRegister extends AutheState {}

// ignore: must_be_immutable
class Failed extends AutheState {
  String message;
  Failed({
    required this.message,
  });
}

class Loading extends AutheState {}
