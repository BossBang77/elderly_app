import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'dart:math' as math;

import 'package:health_application/ui/ui-extensions/font.dart';

class DropdownWidget<ItemsType> extends StatelessWidget {
  const DropdownWidget({
    this.items = const[], 
    this.hint = '',
    this.onChanged
  });
  final List<DropdownMenuItem<ItemsType>> items;
  final String hint;
  final Function(ItemsType?)? onChanged;
  
  @override 
  Widget build(BuildContext context) {
    return Container(
      // height: 54,
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: ColorTheme().GreyBackGround.withOpacity(0.03),
        borderRadius: BorderRadius.circular(15)
      ),
      child: DropdownButtonFormField(
        icon: Transform.rotate(
          angle: math.pi,
          child: Container(
            width: 20,
            height: 20,
            child: Image.asset('assets/images/dropdown_arrow_icon.png', fit: BoxFit.cover)
          )
        ),
        items: items,
        onChanged: onChanged,
        onTap: (){
          
        },
        hint: Text(hint, style: TextStyle(
          color: ColorTheme().grey50,
          fontSize: 18.sp,
          fontFamily: fontFamily,
        ),),
        decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().DarkRed),
            borderRadius: BorderRadius.all(Radius.circular(15)
          )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().grey10),
            borderRadius: BorderRadius.all(Radius.circular(15)
          )),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().grey10),
            borderRadius: BorderRadius.all(Radius.circular(15)
          )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: ColorTheme().grey10),
            borderRadius: BorderRadius.all(Radius.circular(15)
          ),
          
        )),
      )
    );
  }
}