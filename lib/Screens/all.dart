import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:rewardz/Controller/ordersController.dart';
import 'package:rewardz/Utilities/colors.dart';
import 'package:rewardz/Utilities/constants.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/models/OrderStatus.dart';

import '../Widgets/tabbar.dart';

class allOrder extends StatelessWidget {
  final orderStatus = {
    OrderStatus.NEW: ne,
    OrderStatus.ACCEPTED: mark,
    OrderStatus.COMPLETED: com,
    OrderStatus.DELIVERED: de,
    OrderStatus.CANCELLED: ro
  };
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GetBuilder<OrdersController>(
        builder: ((cont) => Scaffold(
                body: SafeArea(
                    child: Column(children: [
              tabbar(),
              setFuturaHF(alli, orange, 17),
              SizedBox(height: 20.h),
              SingleChildScrollView(
                  child: Padding(
                      padding: EdgeInsets.only(left: 20.w, right: 20.w),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).size.height * 0.48,
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: cont.orders?.orders.length ?? 0,
                              itemBuilder: ((context, index) => Column(
                                    children: [
                                      setListViewContainerwithHeight(
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
                                                    CrossAxisAlignment.center,
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
                                                                color: white),
                                                            child:
                                                                Row(children: [
                                                              setFuturaHF(
                                                                  name,
                                                                  greyColor,
                                                                  13),
                                                              SizedBox(
                                                                  width: 5.w),
                                                              setFuturaHF(
                                                                  "-",
                                                                  greyColor,
                                                                  13),
                                                            ]),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          setFuturaHF(
                                                              cont
                                                                  .orders!
                                                                  .orders[index]
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
                                                                color: white),
                                                            child:
                                                                Row(children: [
                                                              setFuturaHF(
                                                                  to,
                                                                  greyColor,
                                                                  13),
                                                              SizedBox(
                                                                  width: 5.w),
                                                              setFuturaHF(
                                                                  "-",
                                                                  greyColor,
                                                                  13),
                                                            ]),
                                                          ),
                                                          SizedBox(width: 5.w),
                                                          setFuturaHF(
                                                              cont
                                                                  .orders!
                                                                  .orders[index]
                                                                  .total,
                                                              black,
                                                              13)
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  setTabbarContainer(
                                                      setFuturaHF(
                                                          orderStatus[cont
                                                              .orders!
                                                              .orders[index]
                                                              .orderStatus]!,
                                                          white,
                                                          15),
                                                      8.r),
                                                  SizedBox(height: 9.h),
                                                ],
                                              )),
                                          66.h,
                                          8.r),
                                      SizedBox(
                                        height: 20.h,
                                      )
                                    ],
                                  )),
                            ),
                          )
                        ],
                      )))
            ])))));
  }
}
