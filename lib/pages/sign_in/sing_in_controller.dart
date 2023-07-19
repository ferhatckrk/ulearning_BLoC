// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc_app_1/pages/sign_in/bloc/sign_in_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInController {
  final BuildContext context;
  SignInController({
    required this.context,
  });

  Future<void> handleSingIn(String type) async {
    try {
      if (type == "email") {
        final state = context.read<SignInBloc>().state;
        final emailAdress = state.email;
        final password = state.password;
        if (emailAdress.isEmpty) {}
        if (password.isEmpty) {}

        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAdress, password: password);
          if (credential.user == null) {
//
          }
          if (!credential.user!.emailVerified) {
//
          }
          final user = credential.user;
          if (user != null) {}
        } catch (e) {
          print(e);
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
