import 'package:flutter/material.dart';
import 'package:rewardz/Utilities/colors.dart';

setAppbarContainer(Widget child) {
  return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [redColor, orangeColor, yellowColor])),
      child: child);
}

setDivider(
  double height,
  double width,
  Color color,
) {
  return Container(width: width, height: height, color: color);
}

setContainer(
  Widget child,
  double height,
  double radius,
) {
  return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient:
              LinearGradient(colors: [redColor, orangeColor, yellowColor])),
      child: child);
}

setContainerwithoutwidth(
  Widget child,
  double radius,
) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient:
              LinearGradient(colors: [redColor, orangeColor, yellowColor])),
      child: child);
}

setListViewContainer(
  Widget child,
  double radius,
) {
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: orange2, width: 2),
          borderRadius: BorderRadius.circular(radius),
          color: white),
      child: child);
}

setListViewContainerwithHeight(
  Widget child,
  double height,
  double radius,
) {
  return Container(
      width: double.infinity,
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: orange2, width: 2),
          borderRadius: BorderRadius.circular(radius),
          color: white),
      child: child);
}

setTabbarContainerUS(
  Widget child,
) {
  return Container(
      child: Padding(
    padding: const EdgeInsets.all(4.0),
    child: child,
  ));
}

setTabbarContainer(
  Widget child,
  double radius,
) {
  return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          gradient:
              LinearGradient(colors: [redColor, orangeColor, yellowColor])),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: child,
      ));
}

setMarkAsContainer(Widget child, double height, double radius) {
  return Container(
      height: height,
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(radius),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              bottomRight: Radius.circular(radius)),
          gradient:
              LinearGradient(colors: [redColor, orangeColor, yellowColor])),
      child: Padding(
        padding: const EdgeInsets.only(left: 11, right: 5),
        child: child,
      ));
}

setNotiContainer(Widget child, double height, double radius) {
  return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.circular(radius),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(radius),
              topLeft: Radius.circular(radius)),
          gradient:
              LinearGradient(colors: [redColor, orangeColor, yellowColor])),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 6,
        ),
        child: child,
      ));
}

setContainerTextField(TextEditingController controller) {
  return SizedBox(
    height: 45.5,
    child: TextFormField(
        controller: controller,
        cursorColor: orange,
        decoration: const InputDecoration(
          border: InputBorder.none,
        )),
  );
}

setContainerTextField2() {
  return Container(
    height: 149.5,
    width: double.infinity,
    decoration: BoxDecoration(
        border: Border.all(color: orange2, width: 2), color: white),
    child: TextFormField(
        maxLines: 5,
        cursorColor: orange,
        decoration: const InputDecoration(
          border: InputBorder.none,
        )),
  );
}

loader({bool white = false}) {
  final color = white ? Colors.white : const Color(0xffFF6C0E);
  return Center(
    child: CircularProgressIndicator(
      strokeWidth: 2,
      valueColor: AlwaysStoppedAnimation<Color>(color),
    ),
  );
}
