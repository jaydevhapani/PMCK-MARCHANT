import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewardz/Controller/ordersController.dart';
import 'package:rewardz/Screens/accepted.dart';
import 'package:rewardz/Screens/new.dart';
import 'package:rewardz/Screens/rejected.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/Widgets/tabbar.dart';
import 'package:rewardz/models/OrderStatus.dart';
import 'package:rewardz/models/orders.dart';

import '../Utilities/colors.dart';
import '../Utilities/constants.dart';
import '../Utilities/global.dart';

class newbill extends StatefulWidget {
  Order order = Order();
  newbill(this.order, {Key? key});

  @override
  _newbill createState() => _newbill();
}

class _newbill extends State<newbill> {
  @override
  void initState() {
    super.initState();
  }

  bool isloadingAccept = false;
  bool isloadingReject = false;

  @override
  Widget build(BuildContext context) {
    final contr = Get.put(OrdersController(context));

    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      tabbar(),
      Expanded(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  children: [
                    setListViewContainer(
                        Padding(
                            padding: EdgeInsets.only(
                              left: 14.w,
                              right: 14.w,
                              top: 10.75.h,
                              bottom: 10.25.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    border: Border(
                                                        bottom: BorderSide(
                                                            color: orange2,
                                                            width: 1.h)),
                                                    color: white),
                                                child: Row(children: [
                                                  setFuturaHF(
                                                      name, greyColor, 13),
                                                  SizedBox(width: 5.w),
                                                  setFuturaHF(
                                                      "-", greyColor, 13),
                                                ]),
                                              ),
                                              SizedBox(width: 5.w),
                                              setFuturaHF(
                                                  widget.order.name, black, 13)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 11.5.h,
                                          ),
                                          Row(
                                            children: [
                                              Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    setFuturaHF(
                                                        to, greyColor, 13),
                                                    setDivider(
                                                        1.h, 94.w, orange2)
                                                  ]),
                                              SizedBox(width: 5.w),
                                              setFuturaHF("-", greyColor, 13),
                                              SizedBox(width: 5.w),
                                              setFuturaHF(widget.order.newTime,
                                                  black, 13)
                                            ],
                                          ),
                                        ],
                                      ),
                                      setTabbarContainer(
                                          setFuturaHF(ne, white, 15), 8.r)
                                    ]),
                                SizedBox(
                                  height: 5.5.h,
                                ),
                                Row(
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          setFuturaHF(daddr, greyColor, 13),
                                          setDivider(1.h, 94.w, orange2)
                                        ]),
                                    SizedBox(width: 5.w),
                                    setFuturaHF("-", greyColor, 13),
                                    SizedBox(width: 5.w),
                                    Flexible(
                                        child: setFuturaHF(
                                            widget.order.deliveryAddress
                                                    .contains("Collected")
                                                ? "Collecting"
                                                : widget.order.deliveryAddress,
                                            black,
                                            13))
                                  ],
                                ),
                                widget.order.deliveryAddress
                                        .contains("Collected")
                                    ? Container()
                                    : const SizedBox(height: 6.5),
                                // widget.order.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : setFuturaHF(
                                //         widget.order.apart, black, 13),
                                // widget.order.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : const SizedBox(height: 6.5),
                                // widget.order.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : setFuturaHF(widget.order.area, black, 13),
                                SizedBox(height: 10.5.h),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          setFuturaHF(
                                              "$order No - ${widget.order.orderId} ",
                                              greyColor,
                                              13),
                                          setDivider(1.h, 94.w, orange2),
                                        ]),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        setFuturaHF(price, greyColor, 13),
                                        setDivider(1.h, 94.w, orange2),
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                widget.order.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    setFuturaHF(
                                                        "${widget.order.Items[index].quantity}x ${widget.order.Items[index].itemName}. ",
                                                        black,
                                                        13),
                                                    const SizedBox(height: 15),
                                                  ],
                                                ))),
                                      ),
                                    ),
                                    Expanded(
                                      child: SizedBox(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount:
                                                widget.order.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    setFuturaHF(
                                                        widget.order
                                                            .Items[index].price,
                                                        black,
                                                        13),
                                                    const SizedBox(height: 15),
                                                  ],
                                                ))),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        setFuturaHF("Sub total", greyColor, 13),
                                        setDivider(1.h, 94.w, orange2),
                                        SizedBox(height: 3.5.h),
                                        setFuturaHF(
                                            widget.order.total, greyColor, 13),
                                        SizedBox(
                                          height: 10.5.h,
                                        ),
                                        setFuturaHF("Total", greyColor, 13),
                                        setDivider(1.h, 94.w, orange2),
                                        SizedBox(
                                          height: 3.5.h,
                                        ),
                                        setFuturaHF(
                                            widget.order.paid, black, 13)
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )),
                        8.r)
                  ],
                ),
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isloadingAccept = true;
                  });
                  await contr
                      .updateStatus(widget.order.orderId, OrderStatus.ACCEPTED)
                      .then((value) async {
                    if (value) {
                      await contr.getOrders(context);
                      setState(() {
                        index = 1;
                      });
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                acceptedOrder(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                      setState(() {
                        isloadingAccept = false;
                      });
                    } else {
                      Get.snackbar("Failed", "Updated Order Status");
                      setState(() {
                        isloadingAccept = false;
                      });
                    }
                  });
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                    child: isloadingAccept
                        ? loader()
                        : setContainer(
                            Center(child: setFuturaHF(ao, white, 23)),
                            39.h,
                            8.r)),
              ),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isloadingReject = true;
                  });
                  await contr
                      .updateStatus(widget.order.orderId, OrderStatus.CANCELLED)
                      .then((value) async {
                    if (value) {
                      await contr.getOrders(context);
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                rejectedOrder(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                      setState(() {
                        isloadingReject = false;
                      });
                    } else {
                      Get.snackbar("Failed", "Updated Order Status");
                      setState(() {
                        isloadingReject = false;
                      });
                    }
                  });
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                    child: isloadingReject
                        ? loader()
                        : setContainer(
                            Center(child: setFuturaHF(ro, white, 23)),
                            39.h,
                            8.r)),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            newOrder(),
                        transitionDuration: Duration.zero,
                        reverseTransitionDuration: Duration.zero,
                      ));
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 15.h),
                    child: setListViewContainerwithHeight(
                        Center(child: setFuturaHF(back, orange3, 23)),
                        39.h,
                        8.r)),
              )
            ],
          ),
        ),
      ),
    ])));
  }
}
