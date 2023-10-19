import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:printing/printing.dart';
import 'package:rewardz/models/OrderStatus.dart';
import 'package:rewardz/models/orders.dart';
import 'package:rewardz/network/api.dart';
import 'package:screenshot/screenshot.dart';

import '../Utilities/colors.dart';
import '../Utilities/constants.dart';
import '../Utilities/container.dart';
import '../Utilities/text.dart';

class OrdersController extends GetxController {
  Orders? orders;
  Orders match = Orders();
  Orders newOrders = Orders();
  Orders accepted = Orders();
  Orders completed = Orders();
  Orders delivery = Orders();
  Orders cancel = Orders();
  Api api = Api();
  BuildContext context;
  OrdersController(this.context);
  final player = AudioPlayer();
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    await getOrders(context);

    newOrders.orders = orders!.orders
        .where((element) => element.orderStatus == OrderStatus.NEW)
        .toList();
    await timer(context);
    super.onInit();
  }

  Future<void> getOrders(context) async {
    orders = await api.getOrders();
    if (orders != null) {
      match.orders = orders!.orders
          .where((element) => element.orderStatus == OrderStatus.NEW)
          .toList();
    }

    if (match.orders.length != newOrders.orders.length) {
      print("n");
      int a = match.orders.length - newOrders.orders.length;
      print(a);
      for (int i = 0; i < a; i++) {
        player.play(AssetSource('images/sound.mp3'));
        print("n");
      }
      for (int i = 0; i < match.orders.length; i++) {
        int c = 0;
        for (int j = 0; j < newOrders.orders.length; j++) {
          if (match.orders[i].orderId == newOrders.orders[j].orderId) {
            c = 1;
            break;
          }
          if (c == 0) {
            var container = Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15.0.h, bottom: 15.h),
                  child: Image.asset("assets/images/applogo.png",
                      width: 102.w, height: 80.h),
                ),
                Padding(
                    padding: EdgeInsets.only(left: 20.w, right: 20.w),
                    child: Wrap(children: [
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
                                                    color: orange2,
                                                    width: 1.h)),
                                            color: white),
                                        child: Row(children: [
                                          setFuturaHFBold(name, greyColor, 13),
                                          SizedBox(width: 5.w),
                                          setFuturaHFBold("-", greyColor, 13),
                                        ]),
                                      ),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].name, black, 13)
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
                                            setFuturaHFBold(to, greyColor, 13),
                                            setDivider(1.h, 94.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].newTime, black, 13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHF("Membership Number",
                                                greyColor, 13),
                                            setDivider(1.h, 150.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHF("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHF(
                                          match.orders[i].membership_number,
                                          black,
                                          13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHF(
                                                "Food Note", greyColor, 13),
                                            setDivider(1.h, 84.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHF("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      Flexible(
                                          child: setFuturaHF(
                                              match.orders[i].food_note,
                                              black,
                                              13))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHF(
                                                "Delivery note", greyColor, 13),
                                            setDivider(1.h, 94.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHF("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      Flexible(
                                          child: setFuturaHF(
                                              match.orders[i].delivery_note,
                                              black,
                                              13))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHF(
                                                "Phone number", greyColor, 13),
                                            setDivider(1.h, 100.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHF("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHF(match.orders[i].phone_number,
                                          black, 13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.5.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold(
                                                match.orders[i].dropzone_id ==
                                                        ""
                                                    ? daddr
                                                    : "Drop Zone\nDelivery Address",
                                                greyColor,
                                                13),
                                            setDivider(1.h, 94.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      Flexible(
                                          child: setFuturaHFBold(
                                              match.orders[i].deliveryAddress
                                                      .contains("Collected")
                                                  ? "Collecting"
                                                  : match.orders[i]
                                                      .deliveryAddress,
                                              black,
                                              13))
                                    ],
                                  ),
                                  // match.orders[i].deliveryAddress
                                  //         .contains("Collected")
                                  //     ? Container()
                                  //     : const SizedBox(height: 6.5),
                                  // match.orders[i].deliveryAddress
                                  //         .contains("Collected")
                                  //     ? Container()
                                  //     : setFuturaHFBold(
                                  //         match.orders[i].deliveryAddress
                                  //                 .contains("Collected")
                                  //             ? match.orders[i].apart
                                  //             : "hii",
                                  //         black,
                                  //         13),
                                  // match.orders[i].deliveryAddress
                                  //         .contains("Collected")
                                  //     ? Container()
                                  //     : const SizedBox(height: 6.5),
                                  // match.orders[i].deliveryAddress
                                  //         .contains("Collected")
                                  //     ? Container()
                                  //     : setFuturaHFBold(
                                  //         match.orders[i].area, black, 13),
                                  SizedBox(height: 16.5.h),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          setFuturaHFBold(
                                              "$order No - ${match.orders[i].orderId} ",
                                              greyColor,
                                              13),
                                          setDivider(1.h, 94.w, orange2),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          setFuturaHFBold(price, greyColor, 13),
                                          setDivider(1.h, 94.w, orange2),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  match.orders[i].Items.length,
                                              itemBuilder: ((context, index) =>
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      setFuturaHFBold(
                                                          "${match.orders[i].Items[index].quantity}x ${match.orders[i].Items[index].itemName}. ",
                                                          black,
                                                          13),
                                                      const SizedBox(
                                                          height: 15),
                                                    ],
                                                  ))),
                                        ),
                                      ),
                                      Expanded(
                                        child: SizedBox(
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  match.orders[i].Items.length,
                                              itemBuilder: ((context, index) =>
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.end,
                                                    children: [
                                                      setFuturaHFBold(
                                                          match
                                                              .orders[i]
                                                              .Items[index]
                                                              .price,
                                                          black,
                                                          13),
                                                      const SizedBox(
                                                          height: 15),
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
                                          setFuturaHFBold(
                                              "Sub total", greyColor, 13),
                                          setDivider(1.h, 94.w, orange2),
                                          SizedBox(height: 3.5.h),
                                          setFuturaHFBold(match.orders[i].total,
                                              greyColor, 13),
                                          SizedBox(
                                            height: 10.5.h,
                                          ),
                                          setFuturaHFBold(
                                              "Total", greyColor, 13),
                                          setDivider(1.h, 94.w, orange2),
                                          SizedBox(
                                            height: 3.5.h,
                                          ),
                                          setFuturaHFBold(
                                              match.orders[i].paid, black, 13)
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold("Restaurant Name",
                                                greyColor, 13),
                                            setDivider(1.h, 110.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].restaurant_name,
                                          black,
                                          13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold(
                                                "Restaurant Location",
                                                greyColor,
                                                13),
                                            setDivider(1.h, 120.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      Flexible(
                                          child: setFuturaHFBold(
                                              match.orders[i]
                                                  .restaurant_location,
                                              black,
                                              13))
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold(
                                                "Restaurant Contact No.",
                                                greyColor,
                                                13),
                                            setDivider(1.h, 135.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].restaurant_contact,
                                          black,
                                          13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold("Order Placed Date",
                                                greyColor, 13),
                                            setDivider(1.h, 115.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].order_created_date,
                                          black,
                                          13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold(
                                                "Order Accepted Date",
                                                greyColor,
                                                13),
                                            setDivider(1.h, 135.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].order_accepted_date,
                                          black,
                                          13)
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Row(
                                    children: [
                                      Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            setFuturaHFBold(
                                                "Order Accepted Time",
                                                greyColor,
                                                13),
                                            setDivider(1.h, 135.w, orange2)
                                          ]),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold("-", greyColor, 13),
                                      SizedBox(width: 5.w),
                                      setFuturaHFBold(
                                          match.orders[i].acceptTime, black, 13)
                                    ],
                                  ),
                                ],
                              )),
                          8.r)
                    ])),
              ],
            );

            ScreenshotController screenshotController = ScreenshotController();

            screenshotController
                .captureFromWidget(
                    InheritedTheme.captureAll(
                        context, Material(child: container)),
                    delay: Duration(seconds: 1))
                .then((capturedImage) async {
              // showing the captured invisible widgets

              //ShowCapturedWidget(context, capturedImage);

              const platform = MethodChannel('my_java_linker');
              String result = 'no result';
              try {
                String backVal = await platform
                    .invokeMethod('myJavaFunc', {'data': capturedImage});

                result = backVal;
              } on PlatformException catch (e) {
                result = 'Something went wrong: $e';
              }

              if (result.contains("done")) {
                showToast(result,
                    context: context,
                    backgroundColor: Colors.green,
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Futura Heavy font",
                        fontSize: 14.sp),
                    animation: StyledToastAnimation.fade,
                    fullWidth: true,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.top,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    textPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    axis: Axis.vertical,
                    duration: Duration(seconds: 3));
              } else {
                showToast(result,
                    context: context,
                    backgroundColor: Colors.red,
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontFamily: "Futura Heavy font",
                        fontSize: 14.sp),
                    animation: StyledToastAnimation.fade,
                    fullWidth: true,
                    reverseAnimation: StyledToastAnimation.fade,
                    position: StyledToastPosition.top,
                    borderRadius: BorderRadius.all(Radius.circular(0)),
                    textPadding:
                        EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    axis: Axis.vertical,
                    duration: Duration(seconds: 3));
              }
            });
          }
          c = 0;
        }
      }
    } else {
      print("p");
    }
    newOrdersFN();

    acceptedFn();
    completedFn();
    deliveryFn();
    cancelFn();
    update();
  }

  newOrdersFN() {
    if (orders == null) {
      return;
    }

    newOrders.orders = orders!.orders
        .where((element) => element.orderStatus == OrderStatus.NEW)
        .toList();
    for (int i = 0; i < newOrders.orders.length; i++) {
      player.play(AssetSource('images/sound.mp3'));
    }
  }

  void acceptedFn() {
    if (orders == null) {
      return;
    }

    accepted.orders = orders!.orders
        .where((element) => element.orderStatus == OrderStatus.ACCEPTED)
        .toList();
  }

  void completedFn() {
    if (orders == null) {
      return;
    }

    completed.orders = orders!.orders
        .where((element) => element.orderStatus == OrderStatus.COMPLETED)
        .toList();
  }

  void deliveryFn() {
    if (orders == null) {
      return;
    }

    delivery.orders = orders!.orders
        .where((element) => element.orderStatus == OrderStatus.DELIVERED)
        .toList();
  }

  void cancelFn() {
    if (orders == null) {
      return;
    }

    cancel.orders = orders!.orders
        .where((element) => element.orderStatus == OrderStatus.CANCELLED)
        .toList();
  }

  Future<void> timer(context) async {
    Timer.periodic(const Duration(seconds: 5), (timer) async {
      await getOrders(context);
    });
  }

  Future<bool> updateStatus(String orderId, String status) async {
    return await api.updateOrderStatus(orderId, status);
  }

  Future<String> print2(List<Item> items, String orderId) async {
    var html =
        "<html><body><br/><p>$orderId</p><br/><table><tr><th>Item Name</th><th>Quantity</th></tr>";
    var list = "";
    for (var item in items) {
      list += "<tr><td>${item.itemName}</td><td>${item.quantity}</td></tr>";
    }

    html += list;
    html += "</tr></table></body><html>";

    return html;
  }
}
