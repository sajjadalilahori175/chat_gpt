import 'firebase_options.dart';
import 'constans/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_gpt/routs/routs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_gpt/providers/chat_provider.dart';
import 'package:chat_gpt/bloc/LoginBloc/login_bloc.dart';
import 'package:chat_gpt/providers/model_providers.dart';
import 'package:chat_gpt/screens/homePage/homepage.dart';
import 'package:chat_gpt/bloc/signUpbloc/signup_bloc.dart';
import 'package:chat_gpt/screens/googlelogin/google_screen.dart';
import 'package:chat_gpt/bloc/googleLoginBloc/googlelogin_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyApp({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        ChangeNotifierProvider<ChatProvider>(
          create: (context) => ChatProvider(),
        ),
        ChangeNotifierProvider<ModelsProviders>(
          create: (context) => ModelsProviders(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<SignupBloc>(
          create: (context) => SignupBloc(),
        ),
        BlocProvider<GoogleloginBloc>(create: (context) => GoogleloginBloc()),
      ],
      child: MaterialApp(
          title: 'Chat GPT',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppNavigation.buildPage,
          
          theme: ThemeData(
              scaffoldBackgroundColor: scaffoldBackgroundColor,
              appBarTheme: const AppBarTheme()),
          home: auth.currentUser != null
              ? const HomePage()
              : const GoogleSignInPage()),
    );
  }
}
