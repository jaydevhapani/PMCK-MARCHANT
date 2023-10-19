import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:rewardz/Controller/ordersController.dart';
import 'package:rewardz/Screens/completed.dart';
import 'package:rewardz/Screens/delivery.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/global.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/Widgets/tabbar.dart';
import 'package:rewardz/models/OrderStatus.dart';
import 'package:rewardz/models/orders.dart';

import '../Utilities/colors.dart';
import '../Utilities/constants.dart';

class deliverybill extends StatefulWidget {
  Order del = Order();
  deliverybill(this.del, {Key? key}) : super(key: key);

  @override
  _deliverybill createState() => _deliverybill();
}

class _deliverybill extends State<deliverybill> {
  bool isloading = false;

  @override
  Widget build(BuildContext context) {
    final Controller = Get.put(OrdersController(context));

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
                              top: 12.75.h,
                              bottom: 81.25.h,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: orange2, width: 1.h)),
                                          color: white),
                                      child: Row(children: [
                                        setFuturaHF(markedout, greyColor, 13),
                                        SizedBox(width: 5.w),
                                        setFuturaHF("-", greyColor, 13),
                                      ]),
                                    ),
                                    SizedBox(width: 5.w),
                                    setFuturaHF(widget.del.delivTime, black, 13)
                                  ],
                                ),
                                SizedBox(height: 20.h),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: orange2, width: 1.h)),
                                          color: white),
                                      child: Row(children: [
                                        setFuturaHF(name, greyColor, 13),
                                        SizedBox(width: 5.w),
                                        setFuturaHF("-", greyColor, 13),
                                      ]),
                                    ),
                                    SizedBox(width: 5.w),
                                    setFuturaHF(widget.del.name, black, 13)
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
                                          setFuturaHF(to, greyColor, 13),
                                          setDivider(1.h, 94.w, orange2)
                                        ]),
                                    SizedBox(width: 5.w),
                                    setFuturaHF("-", greyColor, 13),
                                    SizedBox(width: 5.w),
                                    setFuturaHF(
                                        widget.del.acceptTime, black, 13)
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
                                          setFuturaHF(daddr, greyColor, 13),
                                          setDivider(1.h, 94.w, orange2)
                                        ]),
                                    SizedBox(width: 5.w),
                                    setFuturaHF("-", greyColor, 13),
                                    SizedBox(width: 5.w),
                                    Flexible(
                                        child: setFuturaHF(
                                            widget.del.deliveryAddress,
                                            black,
                                            13))
                                  ],
                                ),
                                // const SizedBox(height: 6.5),
                                // setFuturaHF(widget.del.apart, black, 13),
                                // const SizedBox(height: 6.5),
                                // setFuturaHF(widget.del.area, black, 13),
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
                                              "$order No - ${widget.del.orderId} ",
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: SizedBox(
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: widget.del.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    setFuturaHF(
                                                        "${widget.del.Items[index].quantity}x ${widget.del.Items[index].itemName}. ",
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
                                            itemCount: widget.del.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    setFuturaHF(
                                                        widget.del.Items[index]
                                                            .price,
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
                                            widget.del.total, greyColor, 13),
                                        SizedBox(
                                          height: 10.5.h,
                                        ),
                                        setFuturaHF("Total", greyColor, 13),
                                        setDivider(1.h, 94.w, orange2),
                                        SizedBox(
                                          height: 3.5.h,
                                        ),
                                        setFuturaHF(widget.del.paid, black, 13)
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
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () async {
                  setState(() {
                    isloading = true;
                  });

                  await Controller.updateStatus(
                          widget.del.orderId, OrderStatus.COMPLETED)
                      .then((value) {
                    if (value) {
                      setState(() {
                        isloading = false;
                      });

                      setState(() {
                        index = 3;
                      });

                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                completedOrder(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero,
                          ));
                    } else {
                      Get.snackbar("Confirm", "Failed to set for completion");
                      setState(() {
                        isloading = false;
                      });
                    }
                  });
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 77.h),
                    child: setContainer(
                        isloading
                            ? loader(white: true)
                            : Center(child: setFuturaHF(dc, white, 23)),
                        39.h,
                        8.r)),
              ),
              GestureDetector(
                onTap: () {
                  index = 2;

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const deliveryOrder(),
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
