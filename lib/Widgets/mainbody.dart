import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rewardz/Screens/logInScreen.dart';
import 'package:rewardz/Screens/new.dart';
import 'package:rewardz/Screens/notifications.dart';
import 'package:rewardz/Screens/rejected.dart';
import 'package:rewardz/Screens/support.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';

import '../Utilities/colors.dart';
import '../Utilities/constants.dart';
import '../Utilities/global.dart';

class mainbody extends StatefulWidget {
  @override
  _mainbody createState() => _mainbody();
}

class _mainbody extends State<mainbody> {
  @override
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(children: [
      setAppbarContainer(
        Padding(
          padding: EdgeInsets.only(bottom: 11.0.h, left: 20.w, right: 20.w),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      context: context,
                      transitionDuration: Duration.zero,
                      pageBuilder: (BuildContext buildContext,
                          Animation animation, Animation secondaryAnimation) {
                        return const MyAlertDialog();
                      },
                    );
                  },
                  child: Image.asset("assets/images/menuclose.png",
                      height: 27.h, width: 43.w),
                ),
                setFuturaHF(rewardz, white, 26),
                Container(
                  width: 43.w,
                )
              ]),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.asset("assets/images/applogo.png",
            width: 102.w, height: 95.h),
      ),
    ]);
  }
}

class MyAlertDialog extends StatefulWidget {
  const MyAlertDialog({Key? key}) : super(key: key);

  @override
  State<MyAlertDialog> createState() => _MyAlertDialogState();
}

class _MyAlertDialogState extends State<MyAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: setContainer(
              Column(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        setAppbarContainer(
                          Padding(
                            padding: EdgeInsets.only(
                                bottom: 11.0.h, left: 20.w, right: 20.w),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Image.asset(
                                        "assets/images/menuopen.png",
                                        height: 37.h,
                                        width: 43.w),
                                  ),
                                  setFuturaHF(rewardz, white, 26),
                                  Container(
                                    width: 43.w,
                                  )
                                ]),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Image.asset("assets/images/applogo.png",
                                width: 102.w, height: 95.h)),
                        SizedBox(
                          height: 45.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            index = 0;

                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          newOrder(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                          },
                          child: setFuturaHF(ho, white, 30),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        setDivider(3.h, 70.w, white),
                        const SizedBox(
                          height: 19,
                        ),
                        GestureDetector(
                          onTap: () {
                            index = 0;
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          notificationOrder(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                          },
                          child: setFuturaHF(noti, white, 30),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        setDivider(3.h, 70.w, white),
                        const SizedBox(
                          height: 19,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          rejectedOrder(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                          },
                          child: setFuturaHF("${ro}S", white, 30),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        setDivider(3.h, 70.w, white),
                        const SizedBox(
                          height: 19,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                  pageBuilder:
                                      (context, animation1, animation2) =>
                                          support(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ));
                          },
                          child: setFuturaHF(sup, white, 30),
                        ),
                        const SizedBox(
                          height: 13,
                        ),
                        setDivider(3.h, 70.w, white),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          setDivider(3.h, 70.w, white),
                          const SizedBox(
                            height: 19,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    pageBuilder:
                                        (context, animation1, animation2) =>
                                            logInScreen(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero,
                                  ));
                            },
                            child: setFuturaHF(logo, white, 30),
                          ),
                          const SizedBox(
                            height: 13,
                          ),
                        ]),
                  )
                ],
              ),
              double.infinity,
              0)),
    );
  }
}
