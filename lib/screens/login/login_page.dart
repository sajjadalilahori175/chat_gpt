import 'package:chat_gpt/bloc/LoginBloc/login_bloc.dart';
import 'package:chat_gpt/constans/constants.dart';
import 'package:chat_gpt/routs/routs.dart';
import 'package:chat_gpt/screens/login/login_form.dart';
import 'package:chat_gpt/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




class SigninPage extends StatelessWidget {
  static const String pageName = 'signinpage';

  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: ScaffoldPage());
  }
}

class ScaffoldPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> emailGlobalKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> passwordGlobalKey =
      GlobalKey<FormFieldState>();
  ScaffoldPage({Key? key}) : super(key: key);
////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cardColor,
        body: Stack(
          children: [
            SigninForm(
              emailController: emailController,
              passwordController: passwordController,
              emailGlobalKey: emailGlobalKey,
              passwordGlobalKey: passwordGlobalKey,
              globalKey: globalKey,
            ),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                if (state is LoginInitial) {
                  return const SizedBox();
                } else if (state is LoginLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is LoginLoadedState) {
                  SchedulerBinding.instance
                      .addPostFrameCallback((Duration dur) {
                  Navigator.pushNamedAndRemoveUntil(context, Pages.HOMEPAGE, (route) => false);
                  });
                  return const SizedBox();
                } else if (state is LoginErrorState) {
                  SchedulerBinding.instance
                      .addPostFrameCallback((Duration dur) {
                    showDialog(
                        context: context,
                        builder: (context) => CustomDialog(masg: state.error.toString()));
                  });
                  return const SizedBox();
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      
    );
  }
}
