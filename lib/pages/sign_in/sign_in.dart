import 'package:bloc_app_1/pages/sign_in/widgets/sing_in_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: buildAppbar(),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              buildThirdPartyLogin(context),
              Center(child: reusableText("Or use your email account to login")),
              Container(
                margin: EdgeInsets.only(top: 66.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    reusableText("Email"),
                    buildTextField("Enter your email adress", "email", "user"),
                    reusableText("Password"),
                    buildTextField("Enter your password", "password", "lock"),
                    forgotPassword(),
                    buildLogInAdnRegButton("Log In", "login"),
                    buildLogInAdnRegButton("Register", "register"),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
