
// ignore_for_file: constant_identifier_names

import 'package:chat_gpt/screens/homePage/homepage.dart';
import 'package:chat_gpt/screens/login/login_page.dart';
import 'package:chat_gpt/screens/signUp/signup_screen.dart';
import 'package:flutter/material.dart';

import '../screens/googlelogin/google_screen.dart';

class AppNavigation{

// ignore: body_might_complete_normally_nullable
static Route? buildPage(RouteSettings settings){
  switch(settings.name){
     case Pages.SIGNINPAGE:
        {
          return MaterialPageRoute(
              builder: (context) => const SigninPage(), settings: settings);
        }

      case Pages.SIGNUPPAGE:
        {
          return MaterialPageRoute(
              builder: (context) => const SignupPage(), settings: settings);
        }
        case Pages.HOMEPAGE:
        {
          return MaterialPageRoute(
              builder: (context) => const HomePage(), settings: settings);
        }
         case Pages.GOOGLESIGNINPAGE:
        {
          return MaterialPageRoute(
              builder: (context) => const GoogleSignInPage(), settings: settings);
        }
  }
}
}
class Pages{
  static const String GOOGLESIGNINPAGE = 'GOOGLESIGNINPAGE';
  static const String SIGNINPAGE = 'SIGNINPAGE';
  static const String SIGNUPPAGE = 'SIGNUPPAGE';
   static const String HOMEPAGE = 'HOMEPAGE';
}