part of 'googlelogin_bloc.dart';

@immutable
abstract class GoogleloginState {}

class GoogleloginInitial extends GoogleloginState {}

class GoogleLoginLoadingState extends GoogleloginState{}

class GoogleLoginLoadedState extends GoogleloginState{
  final User? user;
  GoogleLoginLoadedState(this.user);
}

class GoogleLoginErrorState extends GoogleloginState{
  final String error;
  GoogleLoginErrorState(this.error);
}