import 'package:bloc_app_1/app_blocs.dart';
import 'package:bloc_app_1/app_events.dart';
import 'package:bloc_app_1/app_states.dart';
import 'package:bloc_app_1/pages/sign_in/sign_in.dart';
import 'package:bloc_app_1/pages/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_app_1/pages/welcome/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => AppBlocs(),
        ),
      ],
      child: ScreenUtilInit(
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  elevation: 0.5, shadowColor: Colors.grey.withOpacity(.5))),
          routes: {"signIn": (context) => const SignIn()},
          home: Scaffold(body: Welcome()),
        ),
      ),
    );
  }
}
