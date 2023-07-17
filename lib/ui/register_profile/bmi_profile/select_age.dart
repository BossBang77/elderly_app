import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../base/widget/text_field_line.dart';

TextEditingController day = TextEditingController();
TextEditingController month = TextEditingController();
TextEditingController year = TextEditingController();

class SelectDateOfBirth extends StatelessWidget {
  SelectDateOfBirth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(builder: (context, setState) {
      return Container(
          width: MediaQuery.of(context).size.width,
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
                              controller: day,
                              textNumberType: true,
                              maxLength: 2,
                              hintText: 'วว',
                              onChange: (value) {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            textSubtitle16Blod('วัน', ColorTheme().black87),
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
                              controller: month,
                              textNumberType: true,
                              maxLength: 2,
                              hintText: 'ดด',
                              onChange: (value) {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            textSubtitle16Blod('เดือน', ColorTheme().black87),
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
                              controller: year,
                              textNumberType: true,
                              maxLength: 4,
                              hintText: 'ปี(พ.ศ.)',
                              onChange: (value) {},
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            textSubtitle16Blod('ปี', ColorTheme().black87),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SpaceWidget(
                height: 300.h,
              ),
              Column(
                children: [
                  ButtonGradient(
                    btnName: 'ยืนยัน',
                    onClick: () async {
                      try {
                        var years = (int.tryParse(year.text) ?? 0) - 543;
                        var months = month.text.padLeft(2, '0');
                        var days = day.text.padLeft(2, '0');
                        var fullDate = '$years-$months-$days';
                        print(fullDate);
                        if (fullDate.isDate() &&
                            fullDate.parseTime().isBefore(DateTime.now())) {
                          context.read<RegisterProfileBloc>().add(FormFillType(
                              type: FillType.birthDate, value: fullDate));
                          context
                              .read<RegisterProfileBloc>()
                              .add(ForwardBMIDetail());
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
          ));
    });
  }
}
