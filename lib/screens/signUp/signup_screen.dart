import 'package:chat_gpt/bloc/signUpbloc/signup_bloc.dart';

import 'package:chat_gpt/routs/routs.dart';
import 'package:chat_gpt/screens/signUp/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/dialog.dart';


class SignupPage extends StatelessWidget {
  static const String pageName = 'signuppage';

  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
       
            child: Scaffold(
              backgroundColor: const Color.fromARGB(255, 7, 74, 189),
      body: Stack(
        children: [
          const SignupForm(),
          BlocBuilder<SignupBloc, SignupState>(
            builder: (context, state) {
              if (state is SignupInitial) {
                return const SizedBox();
              } else if (state is SignUpLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 3,
                  ),
                );
              } else if (state is SignUpLoadedState) {
                SchedulerBinding.instance.addPostFrameCallback((Duration dur) {
                 Navigator.pushNamedAndRemoveUntil(context, Pages.HOMEPAGE, (route) => false);
                });
                return const SizedBox();
              } else if (state is SignUpErrorState) {
                SchedulerBinding.instance.addPostFrameCallback((Duration dur) {
                  showDialog(
                      context: context,
                      builder: (context) => CustomDialog(masg: state.error));
                });
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          )
        ],
      ),
    ));
  }
}
