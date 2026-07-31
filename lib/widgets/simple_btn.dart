import 'package:flutter/material.dart';



// ignore: prefer_generic_function_type_aliases
typedef void SigninBtnClick(
    {required BuildContext context,
    required TextEditingController emailController,
    required GlobalKey<FormFieldState> emailGlobalKey,
    required TextEditingController passwordController,
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> passwordGlobalKey});

// ignore: prefer_generic_function_type_aliases
typedef void SignupBtnClick(
    {required BuildContext context,
    required TextEditingController emailController,
  
    required GlobalKey<FormState> globalKey,
    required GlobalKey<FormFieldState> emailValidationKey,
    required TextEditingController nameController,
    required GlobalKey<FormFieldState> nameValidationKey,
  
  
    required TextEditingController passwordController,
    required GlobalKey<FormFieldState> passwordValidationKey});

class SignupButton extends StatelessWidget {
  final double height;
  final double width;
  final GlobalKey<FormState> globalKey;
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;



  final GlobalKey<FormFieldState> nameValidationKey;
  final GlobalKey<FormFieldState> emailValidationKey;
  final GlobalKey<FormFieldState> passwordValidationKey;

  final SignupBtnClick signupBtnClick;
  const SignupButton(
      {Key? key,
      required this.signupBtnClick,
      required this.nameController,
      required this.globalKey,
      required this.passwordController,
      required this.emailController,
      required this.nameValidationKey,
      required this.emailValidationKey,
      required this.passwordValidationKey,
      required this.width,
      required this.height,
     })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          signupBtnClick(
              context: context,
              nameController: nameController,
              emailController: emailController,
              passwordController: passwordController,
            
              globalKey: globalKey,
              nameValidationKey: nameValidationKey,
              emailValidationKey: emailValidationKey,
              passwordValidationKey: passwordValidationKey,
            );
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              border: Border.all(color: const Color.fromARGB(255, 1, 6, 15)),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-3, -3),
                    blurRadius: 5),
                BoxShadow(
                    color: Colors.white54, offset: Offset(3, 3), blurRadius: 5)
              ]),
          child: const Center(
            child: Text('Sign Up',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}

class SigninButton extends StatelessWidget {
  final double height;
  final double width;
  final String text;

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormFieldState> emailGlobalKey;
  final GlobalKey<FormFieldState> passwordGlobalKey;
  final GlobalKey<FormState> globalKey;
  final SigninBtnClick signinBtnClick;

  const SigninButton(
      {required this.signinBtnClick,
      required this.emailController,
      required this.passwordController,
      required this.emailGlobalKey,
      required this.passwordGlobalKey,
      required this.text,
      required this.width,
      required this.height,
      Key? key,
      required this.globalKey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: GestureDetector(
        onTap: () {
          signinBtnClick(
              context: context,
              globalKey: globalKey,
              emailController: emailController,
              passwordController: passwordController,
              passwordGlobalKey: passwordGlobalKey,
              emailGlobalKey: emailGlobalKey);
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              border: Border.all(color: const Color.fromARGB(255, 1, 6, 15)),
              borderRadius: BorderRadius.circular(5),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black12,
                    offset: Offset(-3, -3),
                    blurRadius: 5),
                BoxShadow(
                    color: Colors.white54, offset: Offset(3, 3), blurRadius: 5)
              ]),
          child: Center(
            child: Text(text,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ),
    );
  }
}
