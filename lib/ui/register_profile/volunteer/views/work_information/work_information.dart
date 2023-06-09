import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class WorkInformationView extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(onBack: (){}),
      backgroundColor: ColorTheme().white,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textSubtitle18Blod('ข้อมูลการทำงาน', ColorTheme().black87),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('รหัสจิตอาสา', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.disable(
                text: '',
                hintText: 'รหัสจิตอาสา'
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('รหัสเครือข่ายดูแลผู้สูงอายุ', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.disable(
                text: '',
                hintText: 'รหัสเครือข่ายดูแลผู้สูงอายุ',
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('ชื่อเครือข่ายดูแลผู้สูงอายุ', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.disable(
                text: '',
                hintText: 'ชื่อเครือข่ายดูแลผู้สูงอายุ',
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle18Blod('ที่อยู่เครือข่ายดูแลผู้สูงอายุ', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  color: ColorTheme().GreyBackGround.withOpacity(0.03),
                  borderRadius: BorderRadius.circular(15)
                ),
                child: TextField(
                  maxLines: null,
                  minLines: 3,
                  style: TextStyle(
                    color: ColorTheme().black87,
                    fontSize: 18.sp,
                    fontFamily: fontFamily,
                  ),
                  decoration: InputDecoration(
                    hintText: 'ที่อยู่',
                    hintStyle: TextStyle(
                      color: ColorTheme().grey50,
                      fontSize: 18.sp,
                      fontFamily: fontFamily,
                    ),
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
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              textSubtitle18Blod('ประสบการณ์', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              TextFieldWidget.enable(
                text: '',
                hintText: 'ประสบการณ์',
                textNumberType: true,
                maxLength: 10,
                // suffix: true,
                // suffixTxt: 'ปี',
              ),
              const SizedBox(
                height: 20,
              ),

              Column(
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonGradient(
                    btnName: 'ถัดไป',
                    onClick: () {
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}