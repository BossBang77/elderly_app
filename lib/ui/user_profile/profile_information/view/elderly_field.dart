import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/profile_information/bloc/profile_information/profile_information_bloc.dart';

import '../../../ui-extensions/color.dart';

class ElderlyField extends StatelessWidget {
  const ElderlyField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInformationBloc, ProfileInformationState>(
      builder: (context, state) {
        var elderlyProfile = state.profile;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              textSubtitle18Blod('หน่วยงานที่ดูแล', ColorTheme().black87),
              textSubtitle18Blod('ยังไม่ยืนยัน', ColorTheme().DarkRed),
            ]),
            const SizedBox(
              height: 20,
            ),
            textSubtitle18Blod('รหัสหน่วยงาน', ColorTheme().black87),
            TextFieldWidget.enable(
              text: elderlyProfile.elderlyCareCode,
              hintText: 'ตัวเลข 4 ตัว',
              textNumberType: true,
              maxLength: 4,
              onChanged: (value) {
                context
                    .read<ProfileInformationBloc>()
                    .add(ChangeElderlyCode(elderlyCode: value));
              },
            ),
            //TODO Pending card EL-299

            const SizedBox(
              height: 20,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/info.png', width: 24, height: 24),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textSubtitle16Blod(
                      'ข้อมูลเครือข่าย',
                      ColorTheme().black87,
                    ),
                    textSubtitle16Blod(
                      'ไม่พบข้อมูล',
                      ColorTheme().black87,
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
