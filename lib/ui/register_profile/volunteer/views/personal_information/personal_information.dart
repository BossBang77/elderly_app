import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/date_time_picker/date_time_picker.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/views/personal_information/gender_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({required this.registerData});
  final RegisterModel registerData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBar(
          title: 'โปรไฟล์ของฉัน',
          onBack: () {
            context.read<RegisterProfileBloc>().add(
                ChangeProfileView(profileType: ProfileType.privacyProfile));
          }),
      backgroundColor: ColorTheme().white,
      body: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(15),
              child: BlocBuilder<VolunteerRegisterBloc, VolunteerRegisterState>(
                builder: (context, state) {
                  bool validateCID =
                      state.registerData.profile.citizenId.isNotEmpty &&
                          state.registerData.profile.citizenId.length < 13;
                  return Column(
                    children: [
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textSubtitle18Blod(
                                'ข้อมูลส่วนตัว', ColorTheme().black87),
                            const SizedBox(
                              height: 20,
                            ),
                            textSubtitle18Blod(
                                'ชื่อ- นามสกุล', ColorTheme().black87),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text: state.registerData.profile.name,
                              textNumberType: false,
                              maxLength: 50,
                              hintText: 'ชื่อ- นามสกุล',
                              onChanged: (value) {
                                context.read<VolunteerRegisterBloc>().add(
                                    UpdateValue(
                                        type: FormFieldType.name,
                                        value: value));
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            textSubtitle18Blod(
                                'เลขบัตรประชาชน', ColorTheme().black87),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text: state.registerData.profile.citizenId,
                              textNumberType: true,
                              onTap: () {},
                              maxLength: 13,
                              hintText: 'เลขบัตรประชาชน',
                              errorText: 'โปรดกรอกข้อมูลให้ครบถ้วน',
                              autoValid: validateCID,
                              setError: validateCID,
                              setErrorWithOuter: validateCID,
                              onChanged: ((value) {
                                context.read<VolunteerRegisterBloc>().add(
                                    UpdateValue(
                                        type: FormFieldType.cid, value: value));
                              }),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            textSubtitle18Blod(
                                'วัน/เดือน/ปี เกิด', ColorTheme().black87),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFieldWidget.enable(
                              text: state
                                      .registerData.profile.birthDate.isNotEmpty
                                  ? state.registerData.profile.birthDate
                                      .parseToBuddishDate()
                                  : '',
                              suffix: true,
                              readOnly: true,
                              imagePath: 'assets/images/calendar.png',
                              onTap: () async {
                                DateTime pickedDate = await datePicker(
                                  context,
                                  initialDate: state.registerData.profile
                                          .birthDate.isNotEmpty
                                      ? state.birthDate.toDateTime()
                                      : null,
                                  firstDate: DateTime(1950),
                                  lastDate: DateTime.now(),
                                );
                                context.read<VolunteerRegisterBloc>().add(
                                    UpdateValue(
                                        type: FormFieldType.birthDate,
                                        value: pickedDate.toApiFormatDate()));
                              },
                              maxLength: 13,
                              hintText: 'วัน/เดือน/ปี เกิด',
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
                                    selectedImage:
                                        'assets/images/gender_male_selected.png',
                                    isSelected:
                                        state.registerData.profile.gender ==
                                            SexType.MALE.name,
                                    onTap: () {
                                      context.read<VolunteerRegisterBloc>().add(
                                          UpdateValue(
                                              type: FormFieldType.sex,
                                              value: SexType.MALE.name));
                                    },
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                    child: GenderWidget(
                                  gender: 'ผู้หญิง',
                                  image: 'assets/images/gender_female.png',
                                  selectedImage:
                                      'assets/images/gender_female_selected.png',
                                  isSelected:
                                      state.registerData.profile.gender ==
                                          SexType.FEMALE.name,
                                  onTap: () {
                                    context.read<VolunteerRegisterBloc>().add(
                                        UpdateValue(
                                            type: FormFieldType.sex,
                                            value: SexType.FEMALE.name));
                                  },
                                ))
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
                          var profile = state.registerData.profile;
                          if (checkMandatoryPersonalProfile(profile)) {
                            context.read<VolunteerRegisterBloc>().add(
                                UpdateValue(
                                    type: FormFieldType.addAddress, value: ''));
                            context.read<RegisterProfileBloc>().add(
                                ChangeProfileView(
                                    profileType: ProfileType.address));
                          }
                        },
                      ),
                    ],
                  );
                },
              ))),
    );
  }
}
