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
        child: BlocProvider(
          create: (context) =>
              VolunteerRegisterBloc()..add(InitialForm(data: registerData)),
          child: BlocConsumer<VolunteerRegisterBloc, VolunteerRegisterState>(
            listener:
                (BuildContext context, VolunteerRegisterState state) async {
              if (state.status == RegisterStatus.success) {
                context
                    .read<RegisterProfileBloc>()
                    .add(ChangeProfileView(profileType: ProfileType.success));
              } else if (state.status == RegisterStatus.fail) {
                final bool acceptClose = await showDialog(
                    context: context,
                    builder: (BuildContext context) => ErrorAlertWidget(
                          title: 'เกิดข้อผิดพลาด',
                          subTitle:
                              "มีบางอย่างผิดพลาดในการสร้างบัญชี\nกรุณาลองใหม่อีกครั้ง",
                          btnName: 'ตกลง',
                        )) as bool;

                if (acceptClose) {
                  context.read<VolunteerRegisterBloc>().add(DefaultStatus());
                }
              }
            },
            builder: (BuildContext context, VolunteerRegisterState state) {
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
                                    type: FormFieldType.name, value: value));
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
                          text: state.registerData.profile.birthDate.isNotEmpty
                              ? state.registerData.profile.birthDate
                                  .parseToBuddishDate()
                              : '',
                          suffix: true,
                          imagePath: 'assets/images/calendar.png',
                          onTap: () async {
                            DateTime pickedDate = await datePicker(
                              context,
                              initialDate: state
                                      .registerData.profile.birthDate.isNotEmpty
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
                                isSelected: state.registerData.profile.gender ==
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
                              isSelected: state.registerData.profile.gender ==
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
                      context
                          .read<VolunteerRegisterBloc>()
                          .add(RegisterProfile());
                    },
                  ),
                ],
              );
            },
          ),
        ),
      )),
    );
  }
}
