import 'package:bloc_app_1/common/values/colors.dart';
import 'package:bloc_app_1/pages/welcome/bloc/welcome_events.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dots_indicator/dots_indicator.dart';

import 'bloc/welcome_bloc.dart';
import 'bloc/welcome_states.dart';

class Welcome extends StatelessWidget {
  PageController _pageController = PageController(initialPage: 0);
  Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<WelcomeBloc, WelconeStates>(
        builder: (context, state) {
          return SafeArea(
              child: Container(
            margin: EdgeInsets.only(top: 34.h),
            width: 375.w,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      state.pageCount = value;
                      context.read<WelcomeBloc>().add(WelcomeEvents());
                    },
                    children: [
                      _page(
                          1,
                          context,
                          "Next",
                          "First See Learning",
                          "Forgot about a for paper all knowledge in one learning",
                          "assets/images/reading.png"),
                      _page(
                          2,
                          context,
                          "Next",
                          "Connect With Everyone",
                          "Allways keep intouch with your tutor &f friend. Let's get connected ",
                          "assets/images/boy.png"),
                      _page(
                          3,
                          context,
                          "Get Started",
                          "Always Fascinated Leaarning",
                          "Anyware, anytime The time is at  our discrtion so study whenever you want",
                          "assets/images/man.png"),
                    ]),
                Positioned(
                  bottom: 15.h,
                  child: DotsIndicator(
                    position: state.pageCount,
                    dotsCount: 3,
                    decorator: DotsDecorator(
                        activeSize: const Size(20, 8),
                        size: const Size.square(8),
                        activeColor: AppColors.primaryElement,
                        activeShape: BeveledRectangleBorder(
                            borderRadius: BorderRadius.circular(2))),
                  ),
                )
              ],
            ),
          ));
        },
      ),
    );
  }

  Widget _page(int index, BuildContext context, String buttonName, String title,
      String subTitle, String imagePath) {
    return Column(
      children: [
        SizedBox(
          height: 375.h,
          width: 375.w,
          child: Center(child: Image.asset(imagePath)),
        ),
        Container(
          child: Text(title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.normal)),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: Text(
            subTitle,
            style: TextStyle(
                color: Colors.black.withOpacity(0.5),
                fontSize: 14.sp,
                fontWeight: FontWeight.normal),
          ),
        ),
        GestureDetector(
          onTap: () {
            if (index < 3) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn);
            } else {
              Navigator.of(context)
                  .pushNamedAndRemoveUntil("signIn", (route) => false);
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: 100.h, right: 25.w, left: 25.w),
            width: 325.w,
            height: 50.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.w),
                color: AppColors.primaryElement,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 10,
                      blurRadius: 20,
                      offset: const Offset(0, 10))
                ]),
            child: Center(
                child: Text(
              buttonName,
              style: const TextStyle(color: Colors.white),
            )),
          ),
        )
      ],
    );
  }
}
