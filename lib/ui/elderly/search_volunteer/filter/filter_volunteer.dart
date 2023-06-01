import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/filter/component/select_gender.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

void onFiter(BuildContext context) {
  bool filterVolunteer = true;
  showModalBottomSheet(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: ColorTheme().white,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => StatefulBuilder(builder: (context, setState) {
            return Container(
              padding: EdgeInsets.only(
                  top: MediaQueryData.fromWindow(WidgetsBinding.instance.window)
                      .padding
                      .top),
              child: Scaffold(
                backgroundColor: color.whiteBackground,
                appBar: AppBar(
                  elevation: 0,
                  shadowColor: ColorTheme().white,
                  backgroundColor: ColorTheme().white,
                  centerTitle: true,
                  title: textSubtitle18W800('ตัวกรอง', ColorTheme().black87),
                  leading: BackButtonWidget(
                    onClick: () {
                      Navigator.of(context).pop(true);
                    },
                    //  imgPath: 'assets/images/exit_icon.png',
                  ),
                  actions: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(right: 10),
                          child: textSubtitle16Blod(
                              'ล้างค่า', ColorTheme().BlueDark)),
                    )
                  ],
                ),
                body: Padding(
                  padding: EdgeInsets.fromLTRB(15, 20, 15, 0),
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          //โรคประจำตัว
                          Container(
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textSubtitle1('เพศ', color.black87),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    selectGender(context,
                                        active: false,
                                        imgActive:
                                            'assets/images/woman_volunteer_white.png',
                                        imgInactive:
                                            'assets/images/woman_volunteer_black.png',
                                        title: 'ผู้หญิง'),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    selectGender(context,
                                        active: true,
                                        imgActive:
                                            'assets/images/man_volunteer_white.png',
                                        imgInactive:
                                            'assets/images/man_volunteer_black.png',
                                        title: 'ผู้ชาย'),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: color.grey50,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //ระยะทาง
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1('ระยะทาง', color.black87),
                                textH7(
                                  'กำหนดระยะทางไม่เกินช่วงที่ต้องการเอง',
                                  color.grey50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Slider(
                                  value: 0,
                                  max: 10,
                                  divisions: 1,
                                  thumbColor: color.DartBlue,
                                  activeColor: color.DartBlue,
                                  inactiveColor: color.greyText,
                                  label: 0.round().toString(),
                                  onChanged: (double value) {},
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textH7(
                                      '1 กม.',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '10 กม.',
                                      color.grey50,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: color.grey50,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          //ประสบการฯ์การทำงาน
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1(
                                    'ประสบการณ์การทำงาน', color.black87),
                                textH7(
                                  'กำหนดประสบการณ์การทำงานเริ่มต้น',
                                  color.grey50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Slider(
                                  value: 0,
                                  max: 5,
                                  divisions: 1,
                                  thumbColor: color.DartBlue,
                                  activeColor: color.DartBlue,
                                  inactiveColor: color.greyText,
                                  label: 0.round().toString(),
                                  onChanged: (double value) {},
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    textH7(
                                      '< 1 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '1 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '2 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '3 ปี',
                                      color.grey50,
                                    ),
                                    textH7(
                                      '>3 ปี',
                                      color.grey50,
                                    ),
                                  ],
                                ),
                                Divider(
                                  color: color.grey50,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1('ช่วงอายุ', color.black87),
                                textH7(
                                  'ระบุช่วงอายุที่ต้องการ',
                                  color.grey50,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                        child: TextFieldWidget.enable(
                                            suffix: true,
                                            suffixTxt: 'ปี',
                                            text: '',
                                            textNumberType: true,
                                            maxLength: 100)),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 20),
                                      child: textSubtitle16Blod(
                                          '-', color.black87),
                                    ),
                                    Flexible(
                                        child: TextFieldWidget.enable(
                                            suffix: true,
                                            suffixTxt: 'ปี',
                                            text: '',
                                            textNumberType: true,
                                            maxLength: 100)),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Divider(
                                  color: color.grey50,
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textSubtitle1('คะแนน', color.black87),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          for (int i = 4; i >= 0; i--)
                                            Flexible(
                                                child: Container(
                                              padding: EdgeInsets.only(
                                                  top: 5, bottom: 5),
                                              margin:
                                                  EdgeInsets.only(right: 10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: true
                                                        ? color.DartBlue
                                                        : color.GreyBorder),
                                                color: true
                                                    ? color.DartBlue
                                                    : color.grey10,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20)),
                                              ),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  textH7(
                                                    (i + 1).toString(),
                                                    true
                                                        ? color.white
                                                        : color.black87,
                                                  ),
                                                  const SizedBox(
                                                    width: 5,
                                                  ),
                                                  Image.asset(
                                                    true
                                                        ? 'assets/images/star_white.png'
                                                        : 'assets/images/star_outline.png',
                                                    scale: 3,
                                                    color: true
                                                        ? color.white
                                                        : null,
                                                  ),
                                                ],
                                              ),
                                            ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),

                          ButtonGradient(
                            btnName: 'ค้นหา',
                            onClick: () {
                              Navigator.of(context).pop(true);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }));
}
