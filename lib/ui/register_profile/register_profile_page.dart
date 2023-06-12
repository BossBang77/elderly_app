import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/bmi_profile/bmi_widget.dart';
import 'package:health_application/ui/register_profile/food_allergies/food_allergies_widget.dart';

import 'disease/disease_widget.dart';
import 'privacy_profile/privacy_profile.dart';
import 'result_register/result_register.dart';
import 'select_role/select_role_widget.dart';
import 'volunteer/views/personal_information/personal_information.dart';
import 'volunteer/views/privacy_profile/volunteer_privacy_profile.dart';

class RegisterProfilePage extends StatelessWidget {
  const RegisterProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterProfileBloc>(
      create: (_) => RegisterProfileBloc(),
      child: BlocConsumer<RegisterProfileBloc, RegisterProfileState>(
          listener: (context, state) async {
        if (state.status == SubmitStatus.fail) {
          final bool acceptClose = await showDialog(
              context: context,
              builder: (BuildContext context) => ErrorAlertWidget(
                    title: 'เกิดข้อผิดพลาด',
                    subTitle:
                        "มีบางอย่างผิดพลาดในการสร้างบัญชี\nกรุณาลองใหม่อีกครั้ง",
                    btnName: 'ตกลง',
                  )) as bool;

          if (acceptClose) {
            context.read<RegisterProfileBloc>().add(InitialStatus());
          }
        }
      }, builder: (BuildContext context, RegisterProfileState state) {
        var profileType = state.profileType;
        if (profileType == ProfileType.role) {
          return SelectRoleWidget(state: state);
        } else if (profileType == ProfileType.privacyProfile) {
          if (state.roleType == RoleType.ROLE_USER_ELDERLY) {
            return PrivacyProfile(state: state);
          } else {
            return VolunteerPrivacyProfile(state: state);
          }
        } else if (profileType == ProfileType.bmiProfile) {
          return BMIWidget(state: state);
        } else if (profileType == ProfileType.disease) {
          return DiseaseWidget(state: state);
        } else if (profileType == ProfileType.foodAllergies) {
          return FoodAllergiesWidget(state: state);
        } else if (profileType == ProfileType.personalInformation) {
          return PersonalInformationView(registerData: state.registerModel);
        } else {
          return ResultRegisterWidget();
        }
      }),
    );
  }
}
