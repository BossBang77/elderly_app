import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/text_field_line.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/app_bar_widget.dart';
import '../../ui-extensions/color.dart';
import 'bloc/health_profile_bloc.dart';

class DateOfBirthWidget extends StatelessWidget {
  const DateOfBirthWidget({super.key, required this.dateOfBirth});

  final String dateOfBirth;

  @override
  Widget build(BuildContext context) {
    DateTime birthDate = dateOfBirth.parseTime();
    TextEditingController _day = TextEditingController(
        text: dateOfBirth.isNotEmpty ? birthDate.day.toString() : '');
    TextEditingController _month = TextEditingController(
        text: dateOfBirth.isNotEmpty ? birthDate.month.toString() : '');
    TextEditingController _year = TextEditingController(
        text: dateOfBirth.isNotEmpty ? (birthDate.year + 543).toString() : '');
    return BlocBuilder<HealthProfileBloc, HealthProfileState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: color.whiteBackground,
            appBar: appBar(
                onBack: () {
                  addEvent(
                      context,
                      FormFillType(
                        type: FillType.birthDate,
                        value: state.masterProfile.profile.birthDate,
                      ));
                  addEvent(context,
                      ChangePageView(pageView: PageViewWidget.summary));
                },
                title: 'วัน/เดือน/ปีเกิด'),
            body: StatefulBuilder(builder: (context, setState) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 70,
                        ),
                        Center(
                            child: textSubtitle24(
                                'วัน/เดือน/ปีเกิด', ColorTheme().black87)),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Flexible(
                              child: Column(
                                children: [
                                  TextFieldLine(
                                    controller: _day,
                                    textNumberType: true,
                                    maxLength: 2,
                                    hintText: 'วัน',
                                    onChange: ((value) {}),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  textSubtitle16Blod(
                                      'วัน', ColorTheme().black87),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  TextFieldLine(
                                    controller: _month,
                                    textNumberType: true,
                                    maxLength: 2,
                                    hintText: 'เดือน',
                                    onChange: ((value) {}),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  textSubtitle16Blod(
                                      'เดือน', ColorTheme().black87),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Flexible(
                              child: Column(
                                children: [
                                  TextFieldLine(
                                    controller: _year,
                                    textNumberType: true,
                                    maxLength: 4,
                                    hintText: 'ปี',
                                    onChange: ((value) {}),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  textSubtitle16Blod(
                                      'ปี', ColorTheme().black87),
                                ],
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ButtonGradient(
                          btnName: 'ยืนยัน',
                          onClick: () async {
                            try {
                              var year = (int.tryParse(_year.text) ?? 0) - 543;
                              var month = _month.text.padLeft(2, '0');
                              var day = _day.text.padLeft(2, '0');
                              var fullDate = '$year-$month-$day';
                              if (fullDate.isDate()) {
                                addEvent(context, SubmitEdit());
                                addEvent(
                                    context,
                                    FormFillType(
                                      type: FillType.birthDate,
                                      value: fullDate,
                                    ));
                              } else {
                                dateInvalidFormat(context);
                              }
                            } catch (e) {
                              dateInvalidFormat(context);
                              print(e);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    )
                  ],
                ),
              );
            }));
      },
    );
  }

  Future dateInvalidFormat(BuildContext context) async {
    final bool acceptClose = await showDialog(
        context: context,
        builder: (BuildContext context) => ErrorAlertWidget(
              title: 'เกิดข้อผิดพลาด',
              subTitle: "วันเกิดไม่ถูกต้อง \n กรุณาตรวจสอบข้อมูล",
              btnName: 'ตกลง',
            )) as bool;
  }
}
