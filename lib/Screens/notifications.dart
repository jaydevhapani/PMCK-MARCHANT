import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rewardz/Controller/ordersController.dart';
import 'package:rewardz/Utilities/colors.dart';
import 'package:rewardz/Utilities/constants.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/Screens/newbill.dart';
import 'package:rewardz/Widgets/mainbody.dart';

class notificationOrder extends StatelessWidget {
  const notificationOrder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<OrdersController>(
        builder: ((x) => Scaffold(
              body: SafeArea(
                child: Column(
                  children: [
                    mainbody(),
                    setFuturaHF(noti, orange, 17),
                    SizedBox(height: 20.h),
                    Expanded(
                        child: SingleChildScrollView(
                            child: Padding(
                                padding:
                                    EdgeInsets.only(left: 20.w, right: 20.w),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      child: ListView.separated(
                                          itemCount: x.newOrders.orders.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                      context,
                                                      PageRouteBuilder(
                                                        pageBuilder: (context,
                                                                animation1,
                                                                animation2) =>
                                                            newbill(x.newOrders
                                                                .orders[index]),
                                                        transitionDuration:
                                                            Duration.zero,
                                                        reverseTransitionDuration:
                                                            Duration.zero,
                                                      ));
                                                },
                                                child:
                                                    setListViewContainerwithHeight(
                                                        Column(
                                                          children: [
                                                            setNotiContainer(
                                                                setFuturaHF(
                                                                    "NEW ORDER",
                                                                    white,
                                                                    15),
                                                                23.h,
                                                                6.r),
                                                            Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 14
                                                                            .w,
                                                                        right: 14
                                                                            .w,
                                                                        top: 6
                                                                            .h),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                              border: Border(bottom: BorderSide(color: orange2, width: 1.h)),
                                                                              color: white),
                                                                          child:
                                                                              Row(children: [
                                                                            setFuturaHF(
                                                                                name,
                                                                                greyColor,
                                                                                13),
                                                                            SizedBox(width: 5.w),
                                                                            setFuturaHF(
                                                                                "-",
                                                                                greyColor,
                                                                                13),
                                                                          ]),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5.w),
                                                                        setFuturaHF(
                                                                            x.newOrders.orders[index].name,
                                                                            black,
                                                                            13)
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          11.5.h,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Container(
                                                                          decoration: BoxDecoration(
                                                                              border: Border(bottom: BorderSide(color: orange2, width: 1.h)),
                                                                              color: white),
                                                                          child:
                                                                              Row(children: [
                                                                            setFuturaHF(
                                                                                to,
                                                                                greyColor,
                                                                                13),
                                                                            SizedBox(width: 5.w),
                                                                            setFuturaHF(
                                                                                "-",
                                                                                greyColor,
                                                                                13),
                                                                          ]),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5.w),
                                                                        setFuturaHF(
                                                                            x.newOrders.orders[index].total,
                                                                            black,
                                                                            13)
                                                                      ],
                                                                    ),
                                                                  ],
                                                                )),
                                                          ],
                                                        ),
                                                        89.h,
                                                        8.r));
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                      int index) =>
                                                  SizedBox(height: 9.h)),
                                    )
                                  ],
                                )))),
                  ],
                ),
              ),
            )));
  }
}
