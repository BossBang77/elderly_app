import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

String get fontFamily => 'IBMPlex';
Widget textH1(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 106.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w300));
}

Widget textH2(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 66.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w300));
}

Widget textH3(String text, Color color) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 53.sp,
        fontFamily: fontFamily,
      ));
}

Widget textH4(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 38.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w800));
}

Widget textH5(String text, Color color, bool shadow) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 26.sp,
        fontFamily: fontFamily,
        shadows: <Shadow>[
          (shadow)
              ? Shadow(
                  offset: Offset(-1.0, 6.0),
                  blurRadius: 4.0,
                  color: Color.fromRGBO(0, 0, 0, 0.25),
                )
              : Shadow(),
        ],
      ));
}

Widget textH6(String text, Color color, bool center) {
  return Text(text,
      textAlign: (center) ? TextAlign.center : TextAlign.start,
      style: TextStyle(
          height: 1.2,
          color: color,
          fontSize: 22.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500));
}

Widget textH7(String text, Color color) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontFamily: fontFamily,
      ));
}

Widget textSubtitle1(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 18.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500));
}

Widget textSubtitle2(String text, Color color, bool center) {
  return Text(text,
      textAlign: (center) ? TextAlign.center : TextAlign.start,
      softWrap: true,
      style: TextStyle(
          color: color,
          fontSize: 15.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500));
}

Widget textBody1(String text, Color color) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 18.sp,
        fontFamily: fontFamily,
      ));
}

Widget textBody2(String text, Color color, bool underline) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 14.sp,
        fontFamily: fontFamily,
        decoration:
            (underline) ? TextDecoration.underline : TextDecoration.none,
      ));
}

Widget textBody3(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 10.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w300));
}

Widget textButton1(String text, Color color,
    {TextAlign align = TextAlign.start, int maxLines = 1}) {
  return Text(text,
      maxLines: maxLines,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: 15.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500));
}

Widget textButton2(String text, Color color,
    {int maxline = 1, TextAlign align = TextAlign.start}) {
  return Text(text,
      maxLines: maxline,
      textAlign: align,
      style: TextStyle(
        color: color,
        fontSize: 13.sp,
        fontFamily: fontFamily,
      ));
}

Widget textCaption1(String text, Color color) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 13.sp,
        fontFamily: fontFamily,
      ));
}

Widget textCaption2(String text, Color color) {
  return Text(text,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,
        fontFamily: fontFamily,
      ));
}

Widget textOverline1(String text, Color color, bool center) {
  return Text(text,
      textAlign: (center) ? TextAlign.center : TextAlign.start,
      style: TextStyle(
        color: color,
        fontSize: 11.sp,
        fontFamily: fontFamily,
      ));
}

Widget textOverline2(String text, Color color,
    {TextAlign align = TextAlign.center}) {
  return Text(text,
      textAlign: align,
      overflow: TextOverflow.fade,
      style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w300));
}

Widget textSubtitle24(String text, Color color, {int maxLine = 1}) {
  return Text(text,
      maxLines: maxLine,
      style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w800));
}

Widget textSubtitle18Blod(String text, Color color,
    {TextAlign align = TextAlign.start}) {
  return Text(text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: 18.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700));
}

Widget textSubtitle18W800(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 18.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w800));
}

Widget textSubtitle24W700(String text, Color color,
    {TextAlign align = TextAlign.start}) {
  return Text(text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: 24.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700));
}

Widget textSubtitle16Blod(String text, Color color,
    {TextAlign align = TextAlign.start}) {
  return Text(text,
      textAlign: align,
      style: TextStyle(
          color: color,
          fontSize: 16.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700));
}

Widget textSubtitle16W500(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 16.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w500));
}

Widget textSubtitle16W200(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 16.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w200));
}

Widget text12Bold(String text, Color color,
    {TextAlign align = TextAlign.center}) {
  return Text(text,
      textAlign: align,
      overflow: TextOverflow.fade,
      style: TextStyle(
          color: color,
          fontSize: 12.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w700));
}

Widget textSubtitle15w400(String text, Color color) {
  return Text(text,
      style: TextStyle(
          color: color,
          fontSize: 15.sp,
          fontFamily: fontFamily,
          fontWeight: FontWeight.w300));
}
