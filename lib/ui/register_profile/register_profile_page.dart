import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/bmi_profile/bmi_widget.dart';
import 'package:health_application/ui/register_profile/food_allergies/food_allergies_widget.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/views/address/address_profile.dart';
import 'package:health_application/ui/register_profile/volunteer/views/upload_document/upload_document.dart';
import 'package:health_application/ui/register_profile/volunteer/views/work_information/work_information.dart';

import '../ui-extensions/loaddingScreen.dart';
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
    Widget getView(BuildContext context, ProfileType profileType,
        RegisterProfileState state) {
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
      } else if (profileType == ProfileType.workInformation) {
        return WorkInformationView();
      } else if (profileType == ProfileType.address) {
        return AddressProfile();
      } else if (profileType == ProfileType.uploadDocument) {
        return UploadDocumentView();
      } else {
        return ResultRegisterWidget();
      }
    }

    return BlocProvider<RegisterProfileBloc>(
      create: (_) => RegisterProfileBloc(),
      child: BlocConsumer<RegisterProfileBloc, RegisterProfileState>(
          listener: (context, RegisterState) async {
        if (RegisterState.status == SubmitStatus.fail) {
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
      }, builder: (BuildContext context, RegisterProfileState RegisterState) {
        var profileType = RegisterState.profileType;

        return BlocProvider(
          create: (context) => VolunteerRegisterBloc(),
          child: BlocConsumer<VolunteerRegisterBloc, VolunteerRegisterState>(
            listener: (context, VolunteerState) async {
              if (VolunteerState.status == RegisterStatus.success) {
                context
                    .read<RegisterProfileBloc>()
                    .add(ChangeProfileView(profileType: ProfileType.success));
              } else if (VolunteerState.status == RegisterStatus.fail) {
                final bool acceptClose = await showDialog(
                    context: context,
                    builder: (BuildContext context) => ErrorAlertWidget(
                          title: 'ไม่สำเร็จ!',
                          subTitle: "กรุณาลองใหม่อีกครั้ง",
                          btnName: 'ลองอีกครั้ง',
                        )) as bool;

                if (acceptClose) {
                  context.read<VolunteerRegisterBloc>().add(DefaultStatus());
                  context.read<VolunteerRegisterBloc>().add(RegisterProfile());
                }
              }
            },
            builder: (context, VolunteerState) {
              return Stack(
                children: [
                  getView(context, profileType, RegisterState),
                  if (VolunteerState.status == RegisterStatus.loading) Loader()
                ],
              );
            },
          ),
        );
      }),
    );
  }
}
