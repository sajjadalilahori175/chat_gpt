import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:firebase_auth/firebase_auth.dart';

// ignore_for_file: depend_on_referenced_packages


part 'googlelogin_event.dart';
part 'googlelogin_state.dart';

class GoogleloginBloc extends Bloc<GoogleloginEvent, GoogleloginState> {
  GoogleloginBloc() : super(GoogleloginInitial()) {
    on<GoogleLoginSuccessfulEvent>((event, emit)async {
      // emit.call(GoogleLoginLoadingState());
      // try {
      //   User? user = await signInWithGoogle();
      //   if(user != null){
      //     emit.call(GoogleLoginLoadedState(user));
      //   } else{
      //     emit.call(GoogleLoginErrorState("message"));
      //   }
      // } on FirebaseAuthException catch (e) {
      //   emit.call(GoogleLoginErrorState(e.toString()));
      // }catch (e) {
      //   emit.call(GoogleLoginErrorState(e.toString())); 
      // }
   
    });
  }
}
