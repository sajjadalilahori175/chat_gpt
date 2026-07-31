part of 'signup_bloc.dart';

@immutable
abstract class SignupEvent {}


class SignUpSuccessfulEvent extends SignupEvent{
  final String name;
  final String email;
  final String password;
  SignUpSuccessfulEvent(this.email,this.name,this.password);
}
