import 'package:flutter/material.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/volunteer/personal_information/gender_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class PersonalInformationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
        title: 'โปรไฟล์ของฉัน',
        onBack: (){}
      ),
      backgroundColor: ColorTheme().white,
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textSubtitle18Blod('ข้อมูลส่วนตัว', ColorTheme().black87),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle18Blod('ชื่อ- นามสกุล', ColorTheme().black87),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget.enable(
                    text: '',
                    textNumberType: true,
                    maxLength: 50,
                    hintText: 'ชื่อ- นามสกุล',
                    onChanged: (value) {
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle18Blod('เลขบัตรประชาชน', ColorTheme().black87),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget.enable(
                    text: '',
                    onTap: () {

                    },
                    maxLength: 13,
                    hintText: 'เลขบัตรประชาชน',
                    onChanged: ((value) {

                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle18Blod('วัน/เดือน/ปี เกิด', ColorTheme().black87),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFieldWidget.enable(
                    text: '',
                    suffix: true,
                    imagePath: 'assets/images/calendar.png',
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context, //context of current state
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101)
                      );
                      print('picked date ${pickedDate}');
                    },
                    maxLength: 13,
                    hintText: 'วัน/เดือน/ปี เกิด',
                    onChanged: ((value) {

                    }),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  textSubtitle18Blod('เพศ', ColorTheme().black87),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GenderWidget(
                          gender: 'ผู้ชาย', 
                          image: 'assets/images/gender_male.png',
                          selectedImage: 'assets/images/gender_male_selected.png',
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: GenderWidget(
                          gender: 'ผู้หญิง', 
                          image: 'assets/images/gender_female.png',
                          selectedImage: 'assets/images/gender_female_selected.png',
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),

            Spacer(),

            const SizedBox(
              height: 40,
            ),
            ButtonGradient(
              btnName: 'ถัดไป',
              onClick: () {
                // if (user.username.isNotEmpty && user.password.isNotEmpty) {
                //   context.read<RegisterProfileBloc>().add(
                //       ChangeProfileView(profileType: ProfileType.bmiProfile));
                // }
              },
            ),
          ],
        )
      )
    );
  }
}