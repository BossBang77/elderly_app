import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/switch_toggle.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

void onFiter(BuildContext context) {
  bool filterDisease = true;
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
                    imgPath: 'assets/images/exit_icon.png',
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
                                    textSubtitle1('โรคประจำตัว', color.black87),
                                    SwitchToggle(
                                      onChange: (value) {
                                        setState(
                                          () {
                                            filterDisease = value;
                                          },
                                        );
                                      },
                                      value: filterDisease,
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: textH7(
                                    'โรคความดันโลหิตสูง, โรคเบาหวาน ,โรคภูมิคุ้มกันบกพร่อง , โรคอ้วน',
                                    color.black87,
                                  ),
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
                          //แคลอรี่
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1('แคลอรี่', color.black87),
                                textH7(
                                  'ระบุแคลอรี่ที่ต้องการออกกำลังกาย',
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
                                            suffixTxt: 'kcal',
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
                                            suffixTxt: 'kcal',
                                            text: '',
                                            textNumberType: true,
                                            maxLength: 100)),
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
                          //ประเภทการออกกำลังกาย
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle1(
                                    'ประเภทการออกกำลังกาย', color.black87),
                                textH7(
                                  'เลือกได้มากกว่า 1',
                                  color.grey50,
                                ),
                                for (var i = 0;
                                    i < typeOfExerciseList.length;
                                    i++) ...{
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        padding: EdgeInsets.only(
                                            left: 15,
                                            right: 15,
                                            top: 10,
                                            bottom: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(10)),
                                          border: Border.all(
                                              color: color.GreyBorder),
                                          color: color.grey10,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              constraints:
                                                  BoxConstraints(minHeight: 50),
                                              child: Image.asset(
                                                i % 2 == 0
                                                    ? 'assets/images/check_box_check.png'
                                                    : 'assets/images/check_box_uncheck.png',
                                                scale: 4,
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: textH7(
                                                typeOfExerciseList[i],
                                                color.black87,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                                }
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
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
