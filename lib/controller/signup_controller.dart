import 'package:chat_gpt/bloc/signUpbloc/signup_bloc.dart';
import 'package:chat_gpt/routs/routs.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


/*
   this is function is signin button
 */

void btnSignupClick(
    {required BuildContext context,
    required TextEditingController emailController,
  

    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
    required TextEditingController passwordController,
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> passwordValidationKey}) async{
  if (globalKey.currentState!.validate() &&
          emailValidationKey.currentState!.validate() &&
          passwordValidationKey.currentState!.validate() &&
          nameValidationKey.currentState!.validate()  
         ){
           
   SignupBloc bloc = Provider.of(context, listen: false);
   bloc.add(SignUpSuccessfulEvent(
      
             emailController.text.trim(),
            passwordController.text.trim(),
            nameController.text.trim(),
           
            ));

           
  }
}

void signinClick(BuildContext context) {
  Navigator.pushNamed(context, Pages.SIGNINPAGE);
}

void googleSigninuseemailandpasswordClick(BuildContext context) {
  Navigator.pushNamed(context, Pages.SIGNINPAGE);
}
