import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewardz/Controller/ordersController.dart';
import 'package:rewardz/Screens/completedbill.dart';
import 'package:rewardz/Utilities/colors.dart';
import 'package:rewardz/Utilities/constants.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';

import '../Widgets/tabbar.dart';

class completedOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final contr = Get.put(OrdersController(context));

    return GetBuilder<OrdersController>(
      builder: ((x) => Scaffold(
              body: SafeArea(
                  child: Column(children: [
            tabbar(),
            setFuturaHF(com.toUpperCase(), orange, 17),
            SizedBox(height: 20.h),
            Expanded(
                child: SingleChildScrollView(
                    child: Padding(
                        padding: EdgeInsets.only(left: 20.w, right: 20.w),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height -
                                  MediaQuery.of(context).size.height * 0.5,
                              child: ListView.separated(
                                  itemCount: x.completed.orders.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                pageBuilder: (context,
                                                        animation1,
                                                        animation2) =>
                                                    completedbill(x.completed
                                                        .orders[index]),
                                                transitionDuration:
                                                    Duration.zero,
                                                reverseTransitionDuration:
                                                    Duration.zero,
                                              ));
                                        },
                                        child: setListViewContainerwithHeight(
                                            Padding(
                                                padding: EdgeInsets.only(
                                                  left: 14.w,
                                                  right: 14.w,
                                                ),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border(
                                                                        bottom: BorderSide(
                                                                            color:
                                                                                orange2,
                                                                            width: 1
                                                                                .h)),
                                                                    color:
                                                                        white),
                                                                child: Row(
                                                                    children: [
                                                                      setFuturaHF(
                                                                          name,
                                                                          greyColor,
                                                                          13),
                                                                      SizedBox(
                                                                          width:
                                                                              5.w),
                                                                      setFuturaHF(
                                                                          "-",
                                                                          greyColor,
                                                                          13),
                                                                    ]),
                                                              ),
                                                              SizedBox(
                                                                  width: 5.w),
                                                              setFuturaHF(
                                                                  x
                                                                      .completed
                                                                      .orders[
                                                                          index]
                                                                      .name,
                                                                  black,
                                                                  13)
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 11.5.h,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border(
                                                                        bottom: BorderSide(
                                                                            color:
                                                                                orange2,
                                                                            width: 1
                                                                                .h)),
                                                                    color:
                                                                        white),
                                                                child: Row(
                                                                    children: [
                                                                      setFuturaHF(
                                                                          to,
                                                                          greyColor,
                                                                          13),
                                                                      SizedBox(
                                                                          width:
                                                                              5.w),
                                                                      setFuturaHF(
                                                                          "-",
                                                                          greyColor,
                                                                          13),
                                                                    ]),
                                                              ),
                                                              SizedBox(
                                                                  width: 5.w),
                                                              setFuturaHF(
                                                                  x
                                                                      .completed
                                                                      .orders[
                                                                          index]
                                                                      .acceptTime,
                                                                  black,
                                                                  13)
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      setTabbarContainer(
                                                          setFuturaHF(
                                                              com, white, 15),
                                                          8.r)
                                                    ])),
                                            66.h,
                                            8.r));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, int index) =>
                                          SizedBox(height: 9.h)),
                            )
                          ],
                        ))))
          ])))),
    );
  }
}
