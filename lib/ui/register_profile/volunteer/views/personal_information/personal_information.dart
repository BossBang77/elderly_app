import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/date_time_picker/date_time_picker.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/views/personal_information/gender_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class PersonalInformationView extends StatelessWidget {
  const PersonalInformationView({required this.registerState});
  final RegisterProfileState registerState;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(title: 'โปรไฟล์ของฉัน', onBack: () {}),
      backgroundColor: ColorTheme().white,
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            BlocProvider(
              create: (context) => VolunteerRegisterBloc()
                ..add(InitialForm(registerState: registerState)),
              child:
                  BlocConsumer<VolunteerRegisterBloc, VolunteerRegisterState>(
                listener:
                    (BuildContext context, VolunteerRegisterState state) {},
                builder: (BuildContext context, VolunteerRegisterState state) {
                  return SingleChildScrollView(
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
                          text: state.name,
                          textNumberType: true,
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
                          text: state.cid,
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
                          text: state.birthDate.isNotEmpty
                              ? state.birthDate.parseToBuddishDate()
                              : '',
                          suffix: true,
                          imagePath: 'assets/images/calendar.png',
                          onTap: () async {
                            DateTime pickedDate = await datePicker(
                              context,
                              initialDate: state.birthDate.isNotEmpty
                                  ? state.birthDate.toDateTime()
                                  : null,
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
                                isSelected: state.sex == SexType.MALE.name,
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
                              isSelected: state.sex == SexType.FEMALE.name,
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
                  );
                },
              ),
            ),
            Spacer(),
            const SizedBox(
              height: 40,
            ),
            ButtonGradient(
              btnName: 'ถัดไป',
              onClick: () {
                context.read<VolunteerRegisterBloc>().add(RegisterProfile());
              },
            ),
          ],
        ),
      )),
    );
  }
}
