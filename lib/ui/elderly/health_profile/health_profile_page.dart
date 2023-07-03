import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';

import 'package:health_application/ui/elderly/health_profile/bloc/health_profile_bloc.dart';
import 'package:health_application/ui/elderly/health_profile/bmi_summary_widget.dart';
import 'package:health_application/ui/elderly/health_profile/date_of_birth_widget.dart';
import 'package:health_application/ui/elderly/health_profile/edit_disease_widget.dart';
import 'package:health_application/ui/elderly/health_profile/food_allergies_widget.dart';
import 'package:health_application/ui/elderly/health_profile/gender_widget.dart';
import 'package:health_application/ui/elderly/health_profile/height_widget.dart';
import 'package:health_application/ui/elderly/health_profile/summary_widget.dart';
import 'package:health_application/ui/elderly/health_profile/weight_widget.dart';
import 'package:health_application/ui/home_page/home_page.dart';

import 'package:health_application/ui/register_profile/model/register_model.dart';

import '../../base/routes.dart';
import '../../user_profile/bloc/user_profile_bloc.dart';

class HealthProfilePage extends StatelessWidget {
  const HealthProfilePage({super.key, required this.profile});
  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
    Widget initialWidget(BuildContext context, HealthProfileState state) {
      var view = state.pageView;
      switch (view) {
        case PageViewWidget.summary:
          return SummaryWidget();
        case PageViewWidget.gender:
          return GenderWidget();
        case PageViewWidget.height:
          return HeightWidget();
        case PageViewWidget.bmi:
          return BMISummaryWidget();
        case PageViewWidget.weight:
          return WeightWidget();
        case PageViewWidget.dateOfBirth:
          return DateOfBirthWidget(
            dateOfBirth: state.currentProfile.profile.birthDate,
          );
        case PageViewWidget.disease:
          return DiseaseWidget();
        case PageViewWidget.foodAllergies:
          return FoodAllergiesWidget();

        default:
          return Container();
      }
    }

    return BlocProvider(
        create: (context) =>
            HealthProfileBloc()..add(SetProfile(master: profile)),
        child: BlocConsumer<HealthProfileBloc, HealthProfileState>(
          listener: (context, state) async {
            if (state.statusUpdate == StatusUpdate.updateSuccess) {
              final bool acceptClose = await showDialog(
                  context: context,
                  builder: (BuildContext context) => SuccessDialog(
                        header: 'สำเร็จ',
                        subtitle: "บันทึกข้อมูลสุขภาพสำเร็จ",
                        buttonName: 'ตกลง',
                        onTap: () {
                          Navigator.pop(context, true);
                          context.go(Routes.home);
                        },
                      )) as bool;

              if (acceptClose) {
                context.read<UserProfileBloc>().add(GetUserProfile());
                context.read<HealthProfileBloc>().add(ResetStatusUpdate());
              }
            }

            if (state.statusUpdate == StatusUpdate.updateFail) {
              final bool acceptClose = await showDialog(
                  context: context,
                  builder: (BuildContext context) => ErrorAlertWidget(
                        title: 'เกิดข้อผิดพลาด',
                        subTitle:
                            "มีบางอย่างผิดพลาดในการบันทึกข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                        btnName: 'ตกลง',
                      )) as bool;

              if (acceptClose) {
                context.read<HealthProfileBloc>().add(ResetStatusUpdate());
              }
            }
          },
          builder: (context, state) {
            return Stack(
              children: [initialWidget(context, state)],
            );
          },
        ));
  }
}
