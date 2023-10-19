import 'package:flutter/material.dart';

setFuturaHF(String text, Color color, double size,
    {TextAlign align = TextAlign.left}) {
  return Text(text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: size,
          fontFamily: "Futura Heavy font",
          fontWeight: FontWeight.bold));
}

setFuturaHFBold(String text, Color color, double size,
    {TextAlign align = TextAlign.left}) {
  return Text(text,
      textAlign: align,
      style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: size,
          fontFamily: "Futura Heavy font"));
}
