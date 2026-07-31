part of 'login_bloc.dart';

@immutable
abstract class LoginState {}

class LoginInitial extends LoginState {}
class LoginLoadingState extends LoginState {}

class LoginLoadedState extends LoginState {
final User? user;
  LoginLoadedState(this.user);
}

class LoginErrorState extends LoginState {
  final String error;
   LoginErrorState(this.error);
}