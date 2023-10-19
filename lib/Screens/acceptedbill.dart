import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:rewardz/Controller/ordersController.dart';
import 'package:rewardz/Screens/accepted.dart';
import 'package:rewardz/Screens/completed.dart';
import 'package:rewardz/Screens/delivery.dart';
import 'package:rewardz/Screens/ex.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/global.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/Widgets/tabbar.dart';
import 'package:rewardz/models/OrderStatus.dart';

import 'package:printing/printing.dart';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../Utilities/colors.dart';
import '../Utilities/constants.dart';
import '../models/orders.dart';
import 'package:screenshot/screenshot.dart';

class acceptedbill extends StatefulWidget {
  Order accept = Order();

  acceptedbill(this.accept, {Key? key}) : super(key: key);

  @override
  _acceptedbill createState() => _acceptedbill();
}

class _acceptedbill extends State<acceptedbill> {
  bool isLoading = false;
  bool isPrinting = false;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrdersController(context));

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
                              bottom: 25.25.h,
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
                                        setFuturaHF(name, greyColor, 13),
                                        SizedBox(width: 5.w),
                                        setFuturaHF("-", greyColor, 13),
                                      ]),
                                    ),
                                    SizedBox(width: 5.w),
                                    setFuturaHF(widget.accept.name, black, 13)
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
                                        widget.accept.newTime, black, 13)
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
                                    setFuturaHF(widget.accept.membership_number,
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
                                          setFuturaHF(
                                              "Food Note", greyColor, 13),
                                          setDivider(1.h, 84.w, orange2)
                                        ]),
                                    SizedBox(width: 5.w),
                                    setFuturaHF("-", greyColor, 13),
                                    SizedBox(width: 5.w),
                                    Flexible(
                                        child: setFuturaHF(
                                            widget.accept.food_note, black, 13))
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
                                            widget.accept.delivery_note,
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
                                    setFuturaHF(
                                        widget.accept.phone_number, black, 13)
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
                                              widget.accept.dropzone_id == ""
                                                  ? daddr
                                                  : "Drop Zone\nDelivery Address",
                                              greyColor,
                                              13),
                                          setDivider(1.h, 94.w, orange2)
                                        ]),
                                    SizedBox(width: 5.w),
                                    setFuturaHF("-", greyColor, 13),
                                    SizedBox(width: 5.w),
                                    Flexible(
                                        child: setFuturaHF(
                                            widget.accept.deliveryAddress
                                                    .contains("Collected")
                                                ? "Collecting"
                                                : widget.accept.deliveryAddress,
                                            black,
                                            13))
                                  ],
                                ),
                                // widget.accept.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : const SizedBox(height: 6.5),
                                // widget.accept.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : setFuturaHF(
                                //         widget.accept.apart, black, 13),
                                // widget.accept.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : const SizedBox(height: 6.5),
                                // widget.accept.deliveryAddress
                                //         .contains("Collected")
                                //     ? Container()
                                //     : setFuturaHF(
                                //         widget.accept.area, black, 13),
                                SizedBox(height: 16.5.h),
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
                                            "$order No - ${widget.accept.orderId} ",
                                            greyColor,
                                            13),
                                        setDivider(1.h, 94.w, orange2),
                                      ],
                                    ),
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
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                widget.accept.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    setFuturaHF(
                                                        "${widget.accept.Items[index].quantity}x ${widget.accept.Items[index].itemName}. ",
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
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount:
                                                widget.accept.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    setFuturaHF(
                                                        widget.accept
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
                                            widget.accept.total, greyColor, 13),
                                        SizedBox(
                                          height: 10.5.h,
                                        ),
                                        setFuturaHF("Total", greyColor, 13),
                                        setDivider(1.h, 94.w, orange2),
                                        SizedBox(
                                          height: 3.5.h,
                                        ),
                                        setFuturaHF(
                                            widget.accept.paid, black, 13)
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
                    isPrinting = true;
                  });

                  // const platform = MethodChannel('my_java_linker');
                  // String result = 'no result';
                  // try {
                  //   await platform.invokeMethod('addTextStack', {"name": "  "});

                  //   await platform.invokeMethod('addTextStack',
                  //       {"name": "Order No : ${widget.accept.orderId}"});

                  //   for (var item in widget.accept.Items) {
                  //     await platform.invokeMethod('addTextStack', {
                  //       "name":
                  //           "Item name : ${item.itemName}   X ${item.quantity}"
                  //     });
                  //   }
                  //   await platform.invokeMethod('addTextStack', {"name": "  "});
                  // } on PlatformException catch (e) {
                  //   result = 'Something went wrong: $e';
                  // }
                  // setState(() {});
                  // setState(() {
                  //   isPrinting = false;
                  // });
                  // if (result.contains("done")) {
                  //   showToast(result,
                  //       context: context,
                  //       backgroundColor: Colors.green,
                  //       textStyle: TextStyle(
                  //           color: Colors.white,
                  //           fontFamily: "Futura Heavy font",
                  //           fontSize: 14.sp),
                  //       animation: StyledToastAnimation.fade,
                  //       fullWidth: true,
                  //       reverseAnimation: StyledToastAnimation.fade,
                  //       position: StyledToastPosition.top,
                  //       borderRadius: BorderRadius.all(Radius.circular(0)),
                  //       textPadding: EdgeInsets.symmetric(
                  //           horizontal: 10.0, vertical: 10.0),
                  //       axis: Axis.vertical,
                  //       duration: Duration(seconds: 3));
                  // } else {
                  //   showToast(result,
                  //       context: context,
                  //       backgroundColor: Colors.red,
                  //       textStyle: TextStyle(
                  //           color: Colors.white,
                  //           fontFamily: "Futura Heavy font",
                  //           fontSize: 14.sp),
                  //       animation: StyledToastAnimation.fade,
                  //       fullWidth: true,
                  //       reverseAnimation: StyledToastAnimation.fade,
                  //       position: StyledToastPosition.top,
                  //       borderRadius: BorderRadius.all(Radius.circular(0)),
                  //       textPadding: EdgeInsets.symmetric(
                  //           horizontal: 10.0, vertical: 10.0),
                  //       axis: Axis.vertical,
                  //       duration: Duration(seconds: 3));
                  // }

                  // final retun = await controller.print(
                  //     widget.accept.Items, widget.accept.orderId);
                  // if (retun) {
                  //   Get.snackbar("Printing", "Printed Succcessfully");
                  // } else {
                  //   Get.snackbar("Printing", "Printed Failed");
                  // }
                  // Navigator.push(
                  //     context,
                  //     PageRouteBuilder(
                  //       pageBuilder: (context, animation1, animation2) => Ex(),
                  //       transitionDuration: Duration.zero,
                  //       reverseTransitionDuration: Duration.zero,
                  //     ));
                  // setState(() {
                  //   isPrinting = false;
                  // });
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
                                                setFuturaHFBold(
                                                    name, greyColor, 13),
                                                SizedBox(width: 5.w),
                                                setFuturaHFBold(
                                                    "-", greyColor, 13),
                                              ]),
                                            ),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget.accept.name, black, 13)
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
                                                  setFuturaHFBold(
                                                      to, greyColor, 13),
                                                  setDivider(1.h, 94.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget.accept.newTime,
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
                                                      "Membership Number",
                                                      greyColor,
                                                      13),
                                                  setDivider(
                                                      1.h, 150.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHF("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHF(
                                                widget.accept.membership_number,
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
                                                  setFuturaHF("Food Note",
                                                      greyColor, 13),
                                                  setDivider(1.h, 84.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHF("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            Flexible(
                                                child: setFuturaHF(
                                                    widget.accept.food_note,
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
                                                  setFuturaHF("Delivery note",
                                                      greyColor, 13),
                                                  setDivider(1.h, 94.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHF("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            Flexible(
                                                child: setFuturaHF(
                                                    widget.accept.delivery_note,
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
                                                  setFuturaHF("Phone number",
                                                      greyColor, 13),
                                                  setDivider(
                                                      1.h, 100.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHF("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHF(
                                                widget.accept.phone_number,
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
                                                  setFuturaHFBold(
                                                      widget.accept
                                                                  .dropzone_id ==
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
                                                    widget.accept
                                                            .deliveryAddress
                                                            .contains(
                                                                "Collected")
                                                        ? "Collecting"
                                                        : widget.accept
                                                            .deliveryAddress,
                                                    black,
                                                    13))
                                          ],
                                        ),
                                        // widget.accept.deliveryAddress
                                        //         .contains("Collected")
                                        //     ? Container()
                                        //     : const SizedBox(height: 6.5),
                                        // widget.accept.deliveryAddress
                                        //         .contains("Collected")
                                        //     ? Container()
                                        //     : setFuturaHFBold(
                                        //         widget.accept.deliveryAddress
                                        //                 .contains("Collected")
                                        //             ? widget.accept.apart
                                        //             : "hii",
                                        //         black,
                                        //         13),
                                        // widget.accept.deliveryAddress
                                        //         .contains("Collected")
                                        //     ? Container()
                                        //     : const SizedBox(height: 6.5),
                                        // widget.accept.deliveryAddress
                                        //         .contains("Collected")
                                        //     ? Container()
                                        //     : setFuturaHFBold(
                                        //         widget.accept.area, black, 13),
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
                                                    "$order No - ${widget.accept.orderId} ",
                                                    greyColor,
                                                    13),
                                                setDivider(1.h, 94.w, orange2),
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                setFuturaHFBold(
                                                    price, greyColor, 13),
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
                                                    itemCount: widget
                                                        .accept.Items.length,
                                                    itemBuilder:
                                                        ((context, index) =>
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                setFuturaHFBold(
                                                                    "${widget.accept.Items[index].quantity}x ${widget.accept.Items[index].itemName}. ",
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
                                                    itemCount: widget
                                                        .accept.Items.length,
                                                    itemBuilder:
                                                        ((context, index) =>
                                                            Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                setFuturaHFBold(
                                                                    widget
                                                                        .accept
                                                                        .Items[
                                                                            index]
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                setFuturaHFBold(
                                                    "Sub total", greyColor, 13),
                                                setDivider(1.h, 94.w, orange2),
                                                SizedBox(height: 3.5.h),
                                                setFuturaHFBold(
                                                    widget.accept.total,
                                                    greyColor,
                                                    13),
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
                                                    widget.accept.paid,
                                                    black,
                                                    13)
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
                                                  setFuturaHFBold(
                                                      "Restaurant Name",
                                                      greyColor,
                                                      13),
                                                  setDivider(
                                                      1.h, 110.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget.accept.restaurant_name,
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
                                                  setDivider(
                                                      1.h, 120.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            Flexible(
                                                child: setFuturaHFBold(
                                                    widget.accept
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
                                                  setDivider(
                                                      1.h, 135.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget
                                                    .accept.restaurant_contact,
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
                                                      "Order Placed Date",
                                                      greyColor,
                                                      13),
                                                  setDivider(
                                                      1.h, 115.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget
                                                    .accept.order_created_date,
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
                                                  setDivider(
                                                      1.h, 135.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget
                                                    .accept.order_accepted_date,
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
                                                  setDivider(
                                                      1.h, 135.w, orange2)
                                                ]),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold("-", greyColor, 13),
                                            SizedBox(width: 5.w),
                                            setFuturaHFBold(
                                                widget.accept.acceptTime,
                                                black,
                                                13)
                                          ],
                                        ),
                                      ],
                                    )),
                                8.r)
                          ])),
                    ],
                  );

                  ScreenshotController screenshotController =
                      ScreenshotController();

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
                    setState(() {});
                    setState(() {
                      isPrinting = false;
                    });
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
                          textPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
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
                          textPadding: EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          axis: Axis.vertical,
                          duration: Duration(seconds: 3));
                    }
                  });
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: setContainer(
                        isPrinting
                            ? loader(white: true)
                            : Center(
                                child: setFuturaHF("Print Slip", white, 23)),
                        39.h,
                        8.r)),
              ),
              GestureDetector(
                onTap: () async {
                  if (widget.accept.deliveryAddress.contains("Collected")) {
                    print("hii");
                    setState(() {
                      isLoading = true;
                    });

                    await controller
                        .updateStatus(
                            widget.accept.orderId, OrderStatus.COMPLETED)
                        .then((value) {
                      if (value) {
                        setState(() {
                          isLoading = false;
                        });
                        setState(() {
                          index = 3;
                        });
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  completedOrder(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ));
                      } else {
                        Get.snackbar(
                            "Confirm", "Couldn't confirm For delivery ");
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });
                  } else if (!widget.accept.deliveryAddress
                      .contains("Collected")) {
                    setState(() {
                      isLoading = true;
                    });

                    await controller
                        .updateStatus(
                            widget.accept.orderId, OrderStatus.DELIVERED)
                        .then((value) {
                      if (value) {
                        setState(() {
                          isLoading = false;
                        });
                        // ignore: use_build_context_synchronously
                        setState(() {
                          index = 2;
                        });
                        Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  deliveryOrder(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero,
                            ));
                      } else {
                        Get.snackbar(
                            "Confirm", "Couldn't confirm For delivery ");
                        setState(() {
                          isLoading = false;
                        });
                      }
                    });
                  } else {
                    Get.snackbar("Confirm", "Couldn't confirm For delivery ");
                    setState(() {
                      isLoading = false;
                    });
                  }
                },
                child: Padding(
                    padding:
                        EdgeInsets.only(left: 20.w, right: 20.w, bottom: 20.h),
                    child: setContainer(
                        Center(
                            child: isLoading
                                ? loader(white: true)
                                : setFuturaHF(
                                    widget.accept.deliveryAddress
                                            .contains("Collected")
                                        ? "COLLECTED IN STORE"
                                        : ofd,
                                    white,
                                    23)),
                        39.h,
                        8.r)),
              ),
              GestureDetector(
                onTap: () {
                  index = 1;

                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            const acceptedOrder(),
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
