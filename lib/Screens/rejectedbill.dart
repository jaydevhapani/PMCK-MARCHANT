import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rewardz/Screens/rejected.dart';
import 'package:rewardz/Utilities/container.dart';
import 'package:rewardz/Utilities/text.dart';
import 'package:rewardz/Widgets/mainbody.dart';
import 'package:rewardz/models/orders.dart';

import '../Utilities/colors.dart';
import '../Utilities/constants.dart';

class rejectedbill extends StatefulWidget {
  Order rej = Order();

  rejectedbill(this.rej, {Key? key}) : super(key: key);

  @override
  _rejectedbill createState() => _rejectedbill();
}

class _rejectedbill extends State<rejectedbill> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      mainbody(),
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
                                        setFuturaHF(name, greyColor, 13),
                                        SizedBox(width: 5.w),
                                        setFuturaHF("-", greyColor, 13),
                                      ]),
                                    ),
                                    SizedBox(width: 5.w),
                                    setFuturaHF(widget.rej.name, black, 13)
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
                                        widget.rej.rejectTime, black, 13)
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
                                            widget.rej.deliveryAddress
                                                    .contains("Collected")
                                                ? "Colleting"
                                                : widget.rej.deliveryAddress,
                                            black,
                                            13))
                                  ],
                                ),
                                // widget.rej.deliveryAddress.contains("Collected")
                                //     ? Container()
                                //     : const SizedBox(height: 6.5),
                                // widget.rej.deliveryAddress.contains("Collected")
                                //     ? Container()
                                //     : setFuturaHF(widget.rej.apart, black, 13),
                                // widget.rej.deliveryAddress.contains("Collected")
                                //     ? Container()
                                //     : const SizedBox(height: 6.5),
                                // widget.rej.deliveryAddress.contains("Collected")
                                //     ? Container()
                                //     : setFuturaHF(widget.rej.area, black, 13),
                                // SizedBox(height: 16.5.h),
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
                                            itemCount: widget.rej.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    setFuturaHF(
                                                        "${widget.rej.Items[index].quantity}x ${widget.rej.Items[index].itemName}. ",
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
                                            itemCount: widget.rej.Items.length,
                                            itemBuilder: ((context, index) =>
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    const SizedBox(height: 15),
                                                    setFuturaHF(
                                                        widget.rej.Items[index]
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
                                            widget.rej.total, greyColor, 13),
                                        SizedBox(
                                          height: 10.5.h,
                                        ),
                                        setFuturaHF("Total", greyColor, 13),
                                        setDivider(1.h, 94.w, orange2),
                                        SizedBox(
                                          height: 3.5.h,
                                        ),
                                        setFuturaHF(widget.rej.paid, black, 13)
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
                onTap: () {
                  Navigator.push(
                      context,
                      PageRouteBuilder(
                        pageBuilder: (context, animation1, animation2) =>
                            rejectedOrder(),
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
