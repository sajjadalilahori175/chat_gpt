part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginSuccessfulEvent extends LoginEvent{
  final String email;
  final String password;
  LoginSuccessfulEvent({required this.email,required this.password});
}
