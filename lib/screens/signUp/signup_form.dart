import 'package:flutter/material.dart';
import 'package:chat_gpt/widgets/simple_btn.dart';
import 'package:chat_gpt/widgets/already_haveaccount.dart';
import 'package:chat_gpt/controller/signin_controller.dart';
import 'package:chat_gpt/controller/signup_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignupForm extends StatefulWidget {
  const SignupForm({Key? key}) : super(key: key);

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController nameController = TextEditingController();
 
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  final GlobalKey<FormFieldState> emailGlobalKey = GlobalKey<FormFieldState>();
 


  final GlobalKey<FormFieldState> passwordGlobalKey =
      GlobalKey<FormFieldState>();

  final GlobalKey<FormFieldState> nameGlobalKey = GlobalKey<FormFieldState>();

 

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
            key: globalKey,
            child: Column(
              children: [
                SizedBox(
                  height: height * .20,
                ),
                SizedBox(
                  height: height * .06,
                  child: const Align(
                    alignment: Alignment(-.1, -1),
                    child: Text(
                      "Register For ChatGPT",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
             SizedBox(height: height*.02,),
                //Input field user name
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    key: nameGlobalKey,
                    validator: isValidName,
                    onChanged: (value) {
                      nameGlobalKey.currentState!.validate();
                    },
                    controller: nameController,
                    style: const TextStyle(color: Colors.black),
                    decoration:  InputDecoration(
                      prefixIcon: const FaIcon(FontAwesomeIcons.userTie),
                      label: const Text('First Name'),
                      hintText: 'please enter name',
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
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                 
                SizedBox(
                  height: height * .01,
                ),
                //Input Field Email
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: TextFormField(
                    keyboardType: TextInputType.name,
                    key: emailGlobalKey,
                    validator: isValidEmail,
                    controller: emailController,
                    onChanged: (val) {
                      emailGlobalKey.currentState!.validate();
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      prefixIcon: const FaIcon(FontAwesomeIcons.envelope),
                      label: const Text('Email Address'),
                      hintText: 'please enter email',
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
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),
                //Input field Password
                SizedBox(
                  height: height * .10,
                  width: width,
                  child: TextFormField(
                    obscuringCharacter: '*',
                    obscureText: _obscured,
                    keyboardType: TextInputType.visiblePassword,
                    key: passwordGlobalKey,
                    validator: isValidPassword,
                    controller: passwordController,
                    onChanged: (value) {
                      passwordGlobalKey.currentState!.validate();
                    },
                    style: const TextStyle(color: Colors.black),
                    decoration:  InputDecoration(
                      prefixIcon: const FaIcon(FontAwesomeIcons.lock),
                      suffixIcon: GestureDetector(
                        onTap: _textObscured,
                        child: Icon(
                          _obscured
                              ? Icons.visibility_off_rounded
                              : Icons.visibility_rounded,
                        ),
                      ),
                      label: const Text('User Password'),
                      hintText: 'please enter password',
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
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: height*.05,),
                SignupButton(
                  signupBtnClick: btnSignupClick,
                  nameController: nameController,
                  passwordController: passwordController,
                  emailController: emailController,
                  nameValidationKey: nameGlobalKey,
                  emailValidationKey: emailGlobalKey,
                  passwordValidationKey: passwordGlobalKey,
                
                  width: width,
                  height: height * .07,
                  globalKey: globalKey,
                ),
                SizedBox(
                  height: height * .03,
                ),
                //Google Sign up Buitton

                HaveAccount(
                  firstMsg: 'Already have acount ?',
                  secondMsg: 'Login',
                  textClick: signinClick,
                  width: width,
                  height: height * .05,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
