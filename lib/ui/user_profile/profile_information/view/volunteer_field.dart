import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/date_time_picker/date_time_picker.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import '../../../register_profile/volunteer/views/personal_information/gender_widget.dart';
import '../bloc/profile_information/profile_information_bloc.dart';

class VolunteerField extends StatelessWidget {
  const VolunteerField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileInformationBloc, ProfileInformationState>(
      builder: (context, state) {
        var volunteerProfile = state.profile;
        bool checkValidate =
            checkValidateCitizen(volunteerProfile.profile.citizenId);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSubtitle18Blod('เลขบัตรประชาชน', ColorTheme().black87),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget.enable(
              text: volunteerProfile.profile.citizenId,
              textNumberType: true,
              onTap: () {},
              maxLength: 13,
              hintText: 'เลขบัตรประชาชน',
              onChanged: ((value) {
                context
                    .read<ProfileInformationBloc>()
                    .add(ChangeCitizenId(citizenId: value));
              }),
              setError: checkValidate,
              setErrorWithOuter: checkValidate,
            ),
            const SizedBox(
              height: 20,
            ),
            textSubtitle18Blod('วัน/เดือน/ปี เกิด', ColorTheme().black87),
            const SizedBox(
              height: 10,
            ),
            TextFieldWidget.enable(
              text: volunteerProfile.profile.birthDate.isNotEmpty
                  ? volunteerProfile.profile.birthDate.parseToBuddishDate()
                  : '',
              suffix: true,
              imagePath: 'assets/images/calendar.png',
              onTap: () async {
                DateTime pickedDate = await datePicker(
                  context,
                  initialDate: volunteerProfile.profile.birthDate.isNotEmpty
                      ? volunteerProfile.profile.birthDate.toDateTime()
                      : null,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );

                context.read<ProfileInformationBloc>().add(
                    ChangeBirthdate(birthDate: pickedDate.toApiFormatDate()));
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
                    selectedImage: 'assets/images/gender_male_selected.png',
                    isSelected: volunteerProfile.profile.gender ==
                        Gender.male.name.toUpperCase(),
                    onTap: () {
                      context.read<ProfileInformationBloc>().add(
                          ChangeGender(gender: Gender.male.name.toUpperCase()));
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                    child: GenderWidget(
                  gender: 'ผู้หญิง',
                  image: 'assets/images/gender_female.png',
                  selectedImage: 'assets/images/gender_female_selected.png',
                  isSelected: volunteerProfile.profile.gender ==
                      Gender.female.name.toUpperCase(),
                  onTap: () {
                    context.read<ProfileInformationBloc>().add(
                        ChangeGender(gender: Gender.female.name.toUpperCase()));
                  },
                ))
              ],
            )
          ],
        );
      },
    );
  }
}
