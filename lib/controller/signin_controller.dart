import 'package:chat_gpt/bloc/googleLoginBloc/googlelogin_bloc.dart';
import 'package:chat_gpt/routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../bloc/LoginBloc/login_bloc.dart';



String? isValidEmail(String? email) {
  /*
     This fucntion validate email
   */
  if (email!.isEmpty) {
    return 'This is required';
  } else if (RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email)) {
    return null;
  } else {
    return 'Email is not valid';
  }
}

String? isValidPassword(String? password) {
  /*
     This fucntion validate password
   */
  if (password!.isEmpty) {
    return 'Please fill this field';
  } else if (password.length < 7) {
    return 'Password length should>=7';
  } else {
    return null;
  }
}





String? isValidName(String? lastname) {
  if (lastname!.isEmpty) {
    return 'Please fill this field';
  } else {
    return null;
  }
}



void btnSignin(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailGlobalKey,
    required TextEditingController passwordController,
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> passwordGlobalKey}) {
  LoginBloc loginBloc = Provider.of<LoginBloc>(context, listen: false);
  if (globalKey.currentState!.validate() &&
      emailGlobalKey.currentState!.validate() &&
      passwordGlobalKey.currentState!.validate()) {
    loginBloc.add(LoginSuccessfulEvent(email: emailController.text.trim(),password: passwordController.text.trim()));
          
  }
}







void googleSigninClick(BuildContext context) {
  GoogleloginBloc googleSignInBloc =
      Provider.of<GoogleloginBloc>(context, listen: false);
  googleSignInBloc.add(GoogleLoginSuccessfulEvent());
}



void registerNowClick(BuildContext context) {
  Navigator.pushReplacementNamed(context, Pages.SIGNUPPAGE);
}