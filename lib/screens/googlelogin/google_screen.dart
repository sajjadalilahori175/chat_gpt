import 'package:chat_gpt/bloc/googleLoginBloc/googlelogin_bloc.dart';
import 'package:chat_gpt/constans/constants.dart';
import 'package:chat_gpt/routs/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'google_btn_page.dart';

class GoogleSignInPage extends StatelessWidget {
  static const String pageName = "GoogleSignInPage";
  const GoogleSignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldBackgroundColor,
        body: Stack(
          children: [
            const SignInButtonPage(),
            BlocBuilder<GoogleloginBloc, GoogleloginState>(
              builder: (context, state) {
                if (state is GoogleloginInitial) {
                  return const SizedBox();
                } else if (state is GoogleLoginLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    ),
                  );
                } else if (state is GoogleLoginLoadedState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    Navigator.pushNamedAndRemoveUntil(context, Pages.HOMEPAGE, (route) => false);
                  });
                  return const SizedBox();
                } else if (state is GoogleLoginErrorState) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error.toString()),  
                      ),
                    );
                  });
                  return const SizedBox();
                }
                return const SizedBox();
              },
            )
          ],
        ),
      
    );
  }
}
