// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewardz/Controller/loginController.dart';

import 'package:rewardz/Screens/new.dart';
import 'package:rewardz/Utilities/colors.dart';
import 'package:rewardz/Utilities/constants.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/global.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/network/api.dart';

class logInScreen extends StatelessWidget {
  logInScreen({Key? key}) : super(key: key);
  final contr = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ScreenUtilInit(builder: (BuildContext context, child) {
        return GetBuilder<LoginController>(
          init: contr,
          builder: ((x) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  setAppbarContainer(
                    Padding(
                      padding: EdgeInsets.only(bottom: 11.0.h),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: setFuturaHF(rewardz, white, 26)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Image.asset("assets/images/applogo.png",
                        width: 168.w, height: 155.h),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0.h),
                    child: setFuturaHF(login, orange, 17),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0.w, right: 15.w),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 8.0),
                          child: setContainer(
                              Center(child: setFuturaHF(email, white, 17)),
                              23.h,
                              8.r),
                        ),
                        setContainerTextField(x.email.value),
                        setDivider(2.h, double.infinity, orange2),
                        Padding(
                          padding: EdgeInsets.only(top: 17.h),
                          child: setContainer(
                              Center(child: setFuturaHF(pswd, white, 17)),
                              23.h,
                              8.r),
                        ),
                        setContainerTextField(x.password.value),
                        setDivider(2.h, double.infinity, orange2),
                        GestureDetector(
                          onTap: () async {
                            if (x.email.value == "") {
                              Get.snackbar("Missing", "Email needs to enter.");
                            }

                            if (x.password.value == "") {
                              Get.snackbar(
                                  "Missing", "Password needs to enter.");
                            }

                            var login = await x.login(
                                x.email.value.text, x.password.value.text);

                            if (login) {
                              Get.to(() => newOrder());
                            } else {
                              Get.snackbar("Login", "Failed to login");
                            }
                          },
                          child: Padding(
                              padding: EdgeInsets.only(top: 17.0.h),
                              child: setContainer(
                                  x.isLoading.value
                                      ? loader()
                                      : Center(
                                          child: setFuturaHF(login, white, 23)),
                                  76.h,
                                  8.r)),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            );
          }),
        );
      }),
    );
  }
}
