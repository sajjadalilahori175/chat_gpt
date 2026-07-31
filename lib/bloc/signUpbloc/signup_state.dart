part of 'signup_bloc.dart';

@immutable
abstract class SignupState {}

class SignupInitial extends SignupState {}

class SignUpLoadingState extends SignupState{}

class SignUpLoadedState extends SignupState{
  final User? user;
  SignUpLoadedState(this.user);
}

class SignUpErrorState extends SignupState{
  final String error;
  SignUpErrorState(this.error);
}
