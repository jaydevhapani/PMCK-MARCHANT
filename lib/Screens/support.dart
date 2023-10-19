// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:rewardz/Utilities/colors.dart';
import 'package:rewardz/Utilities/constants.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/Widgets/mainbody.dart';

class support extends StatefulWidget {
  @override
  _support createState() => _support();
}

class _support extends State<support> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bnController = TextEditingController();
  TextEditingController cnController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(children: [
          mainbody(),
          Padding(
            padding: EdgeInsets.only(top: 8.0.h),
            child: setFuturaHF(sup, orange, 17),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 15.0.w,
              right: 15.w,
            ),
            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(top: 17.0.h),
                    child: setContainerwithoutwidth(
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10.25.w,
                                right: 10.25.w,
                                top: 4.5.h,
                                bottom: 4.5.h),
                            child: setFuturaHF(name, white, 17)),
                        8.r)),
                setContainerTextField(nameController),
                setDivider(2.h, double.infinity, orange2),
                Padding(
                    padding: EdgeInsets.only(top: 17.0.h),
                    child: setContainerwithoutwidth(
                        Padding(
                            padding: EdgeInsets.only(
                                left: 10.25.w,
                                right: 10.25.w,
                                top: 4.5.h,
                                bottom: 4.5.h),
                            child: setFuturaHF(bn, white, 17)),
                        8.r)),
                setContainerTextField(bnController),
                setDivider(2.h, double.infinity, orange2),
                Padding(
                    padding: EdgeInsets.only(top: 17.0.h),
                    child: setContainerwithoutwidth(
                        Padding(
                            padding: EdgeInsets.only(
                                left: 14.25.w,
                                right: 14.25.w,
                                top: 4.5.h,
                                bottom: 4.5.h),
                            child: setFuturaHF(cn, white, 17)),
                        8.r)),
                setContainerTextField(nameController),
                setDivider(2.h, double.infinity, orange2),
                Padding(
                    padding: EdgeInsets.only(top: 17.0.h),
                    child: setContainerwithoutwidth(
                        Padding(
                            padding: EdgeInsets.only(
                                left: 42.w,
                                right: 42.w,
                                top: 4.5.h,
                                bottom: 4.5.h),
                            child: setFuturaHF(msg, white, 17)),
                        8.r)),
                SizedBox(height: 12.75.h),
                setContainerTextField2(),
                GestureDetector(
                  child: Padding(
                      padding: EdgeInsets.only(top: 17.0.h),
                      child: setContainer(
                          Center(child: setFuturaHF(send, white, 23)),
                          39.h,
                          8.r)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.only(top: 17.0.h),
                      child: setListViewContainerwithHeight(
                          Center(child: setFuturaHF(back, orange3, 23)),
                          39.h,
                          8.r)),
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
