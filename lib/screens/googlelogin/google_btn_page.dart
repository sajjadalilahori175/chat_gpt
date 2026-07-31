import 'package:flutter/material.dart';
import '../../controller/signup_controller.dart';
import 'package:chat_gpt/widgets/google__btns.dart';
import 'package:chat_gpt/controller/signin_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// ignore_for_file: prefer_final_fields

class SignInButtonPage extends StatelessWidget {
  static const String pageName = 'SignInButtonPage';
  const SignInButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - kTextTabBarHeight;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        SizedBox(
          height: height * .30,
          width: width,
        ),
        SizedBox(
          height: height * .05,
          width: width,
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 35),
            child: Text("Welcome To ChatGPT",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30)),
          ),
        ),
        SizedBox(
          height: height * .10,
        ),
        GoogleBtn(
            height: height * .07,
            width: width,
            btnClick: googleSigninuseemailandpasswordClick,
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 126, 189, 8)),
            child: const Row(
              children: [
                Spacer(
                  flex: 10,
                ),
                Expanded(
                    flex: 10,
                    child: FaIcon(
                      FontAwesomeIcons.envelope,
                      size: 25,
                      color: Colors.green,
                    )),
                Expanded(
                  flex: 70,
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Use  email or username',
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 21,
                              fontWeight: FontWeight.w400)),
                    ),
                  ),
                ),
                Spacer(
                  flex: 10,
                ),
              ],
            )),
        SizedBox(
          height: height * .05,
          width: width,
        ),
        GoogleBtn(
            height: height * .07,
            width: width,
            btnClick: googleSigninClick,
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 1, 6, 15)),
            child: const Row(
              children: [
                Spacer(
                  flex: 10,
                ),
                Expanded(
                    flex: 10,
                    child: FaIcon(
                      FontAwesomeIcons.google,
                      size: 35,
                    )),
                Expanded(
                  flex: 70,
                  child: Center(
                    child: Text('Sign in with Google',
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.w400)),
                  ),
                ),
                Spacer(
                  flex: 10,
                ),
              ],
            )),
        SizedBox(
          height: height * .05,
          width: width,
        ),
        GoogleBtn(
            height: height * .07,
            width: width,
            btnClick: googleSigninClick,
            color: Colors.white,
            border: Border.all(color: const Color.fromARGB(255, 6, 73, 197)),
            child: const Row(
              children: [
                Spacer(
                  flex: 10,
                ),
                Expanded(
                    flex: 10,
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 40,
                    )),
                Expanded(
                  flex: 70,
                  child: Center(
                    child: Text('Sign in with Facebook',
                        style: TextStyle(
                            color: Color.fromARGB(255, 32, 112, 250),
                            fontSize: 20,
                            fontWeight: FontWeight.w400)),
                  ),
                ),
                Spacer(
                  flex: 10,
                ),
              ],
            )),
        SizedBox(
          height: height * .02,
          width: width,
        ),
      ],
    );
  }
}
