import 'package:flutter/material.dart';

import '../../controller/signin_controller.dart';
import '../../widgets/already_haveaccount.dart';
import '../../widgets/simple_btn.dart';


class SigninForm extends StatefulWidget {
  final TextEditingController emailController;
  final GlobalKey<FormFieldState> emailGlobalKey;
  final TextEditingController passwordController;
  final GlobalKey<FormState> globalKey;
  final GlobalKey<FormFieldState> passwordGlobalKey;

  const SigninForm(
      {Key? key,
      required this.passwordController,
      required this.emailController,
      required this.emailGlobalKey,
      required this.passwordGlobalKey,
      required this.globalKey})
      : super(key: key);

  @override
  State<SigninForm> createState() => _SigninFormState();
}

class _SigninFormState extends State<SigninForm> {
  late bool _obscured;

  void _textObscured() {
    setState(() {
      _obscured = !_obscured;
    });
  }

  @override
  void initState() {
    _obscured = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width;
    double height = size.height - 85;

    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: widget.globalKey,
            child: Column(
              children: [
                SizedBox(height: height * .20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(
                      height: height * .08,
                      width: width,
                      child: const Center(
                        child: Text(
                          "Welcome To ChatGPT",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500),
                        ),
                      )),
                ),
               
               SizedBox(height: height*.05,),
               
                //Input Field Email
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    key: widget.emailGlobalKey,
                    validator: isValidEmail,
                    onChanged: (value) {
                      widget.emailGlobalKey.currentState!.validate();
                    },
                    controller: widget.emailController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email_outlined),
                      label: const Text('User Email'),
                      hintText: 'Email or username',
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 16),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
      
                SizedBox(
                  height: height * .02,
                ),
                //Input field Password
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: TextFormField(
                    obscuringCharacter: '*',
                    obscureText: _obscured,
                    key: widget.passwordGlobalKey,
                    validator: isValidPassword,
                    onChanged: (value) {
                      widget.passwordGlobalKey.currentState!.validate();
                    },
                    controller: widget.passwordController,
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.https_outlined),
                      suffixIcon: GestureDetector(
                        onTap: _textObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                        ),
                      ),
                      label: const Text('User Password'),
                      hintText: 'Password',
                      labelStyle:
                          const TextStyle(color: Colors.black, fontSize: 16),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 1,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: Colors.black,
                          width: 3,
                        ),
                      ),
                    ),
                  ),
                ),
               SizedBox(height: height*.10,),
      
                SigninButton(
                    signinBtnClick: btnSignin,
                    emailController: widget.emailController,
                    passwordController: widget.passwordController,
                    emailGlobalKey: widget.emailGlobalKey,
                    passwordGlobalKey: widget.passwordGlobalKey,
                    text: 'Login',
                    width: width,
                    height: height * .08,
                    globalKey: widget.globalKey),
                SizedBox(
                  height: height * .05,
                ),
      
                HaveAccount(
                  textClick: registerNowClick,
                  firstMsg: 'Don\'t have an account?',
                  secondMsg: 'Register Now',
                  height: height * .03,
                  width: width,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
