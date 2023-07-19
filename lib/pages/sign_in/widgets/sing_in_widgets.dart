import 'package:bloc_app_1/common/values/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar() {
  return AppBar(
    centerTitle: true,
    elevation: 0.5,
    shadowColor: Colors.grey.withOpacity(.5),
    backgroundColor: Colors.white,
    bottom: PreferredSize(
      child: Container(
        color: AppColors.primarySecondaryBackground,
      ),
      preferredSize: Size.fromHeight(1.0),
    ),
    title: Text(
      "Log In",
      style: TextStyle(
          color: Colors.black, fontSize: 16.sp, fontWeight: FontWeight.normal),
    ),
  );
}

Widget buildThirdPartyLogin(BuildContext context) {
  return Container(
    margin: EdgeInsets.only(top: 40.h, bottom: 20.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _reusableIcons("google"),
        _reusableIcons("facebook"),
        _reusableIcons("apple"),
      ],
    ),
  );
}

Widget _reusableIcons(String iconName) {
  return GestureDetector(
      onTap: () {},
      child: SizedBox(
        height: 40.w,
        width: 40.w,
        child: Image.asset("assets/icons/${iconName}.png"),
      ));
}

Widget reusableText(String text) {
  return Container(
    margin: EdgeInsets.only(bottom: 5.h),
    child: Text(
      text,
      style: TextStyle(color: Colors.grey.withOpacity(0.7), fontSize: 14.sp),
    ),
  );
}

Widget buildTextField(String hintText, String textType, String iconName) {
  return Container(
    width: 325.w,
    height: 50.h,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        border: Border.all()),
    child: Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 17.sp),
          width: 16.w,
          height: 16.h,
          child: Image.asset("assets/icons/$iconName.png"),
        ),
        SizedBox(
          height: 50.h,
          width: 270.w,
          child: TextField(
            keyboardType: TextInputType.multiline,
            decoration: InputDecoration(
                hintText: hintText,
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent)),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                hintStyle: TextStyle(color: Colors.grey.withOpacity(0.5))),
            style: TextStyle(
              color: Colors.black,
              fontFamily: "Avenir",
              fontWeight: FontWeight.normal,
              fontSize: 12.sp,
            ),
            autocorrect: false,
            obscureText: textType == "password" ? true : false,
          ),
        )
      ],
    ),
  );
}

Widget forgotPassword() {
  return Container(
    margin: EdgeInsets.only(top: 10.h),
    width: 268.w,
    height: 44.h,
    child: GestureDetector(
      onTap: () {},
      child: Text(
        "Forgot Password",
        style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.underline,
            decorationColor: Colors.blue,
            fontSize: 12.sp),
      ),
    ),
  );
}

Widget buildLogInAdnRegButton(String buttonName, String buttonType) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.only(top: buttonType == "login" ? 50.h : 20.h),
      width: 325.w,
      height: 50.h,
      decoration: BoxDecoration(
          color: buttonType == "login"
              ? AppColors.primaryElement
              : AppColors.primaryBackground,
          borderRadius: BorderRadius.circular(10.w),
          border: Border.all(
              color: buttonType == "login"
                  ? Colors.transparent
                  : AppColors.primaryFourElementText)),
      child: Center(
        child: Text(
          buttonName,
          style: TextStyle(
              color: buttonType == "login"
                  ? AppColors.primaryBackground
                  : AppColors.primaryText,
              fontSize: 16.sp),
        ),
      ),
    ),
  );
}
