import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/personal_medication/bloc/personal_medication_bloc.dart';
import 'package:health_application/ui/elderly/personal_medication/view/medication_detail.dart';
import 'package:health_application/ui/elderly/personal_medication/view/summary_medication.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

import '../../base/dialog/success_dialog.dart';

class PersonalMedicationPage extends StatelessWidget {
  const PersonalMedicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget InitialWidget(BuildContext context, PersonalMedicationState state) {
      var view = state.pageView;
      switch (view) {
        case PageViewMedication.summaryPage:
          return SummaryMedication();
        case PageViewMedication.medicationDetail:
          return MedicationDetail();
        default:
          return Container();
      }
    }

    return BlocProvider(
        create: (context) => PersonalMedicationBloc()..add(InitialValue()),
        child: BlocConsumer<PersonalMedicationBloc, PersonalMedicationState>(
          listener: (context, state) async {
            if (state.submitState == SubmitState.deleteMedicationFail) {
              final bool acceptClose = await showDialog(
                  context: context,
                  builder: (BuildContext context) => ErrorAlertWidget(
                        title: 'เกิดข้อผิดพลาด',
                        subTitle:
                            "${SubmitState.deleteMedicationFail.title}\nกรุณาลองใหม่อีกครั้ง",
                        btnName: 'ตกลง',
                      )) as bool;

              if (acceptClose) {
                addEvent(context, ResetSubmitState());
              }
            }

            if (state.submitState == SubmitState.deleteMedicationSuccess) {
              final bool acceptClose = await showDialog(
                  context: context,
                  builder: (BuildContext _) => SuccessDialog(
                        header: "สำเร็จ!",
                        subtitle: SubmitState.deleteMedicationSuccess.title,
                        buttonName: 'ตกลง',
                        onTap: () {},
                      ));

              if (acceptClose) {
                addEvent(context, ResetSubmitState());
                addEvent(context, InitialValue());
              }
            }

            if (state.submitState == SubmitState.submitMedicationSuccess) {
              final bool acceptClose = await showDialog(
                  context: context,
                  builder: (BuildContext _) => SuccessDialog(
                        header: "สำเร็จ!",
                        subtitle: SubmitState.submitMedicationSuccess.title,
                        buttonName: 'ตกลง',
                        onTap: () {},
                      ));

              if (acceptClose) {
                addEvent(context, ResetSubmitState());
                addEvent(context, InitialValue());
                addEvent(context, ChangeView());
              }
            }

            if (state.submitState == SubmitState.submitMedicationFail) {
              final bool acceptClose = await showDialog(
                  context: context,
                  builder: (BuildContext context) => ErrorAlertWidget(
                        title: 'เกิดข้อผิดพลาด',
                        subTitle:
                            "${SubmitState.submitMedicationFail.title}\nกรุณาลองใหม่อีกครั้ง",
                        btnName: 'ตกลง',
                      )) as bool;

              if (acceptClose) {
                addEvent(context, ResetSubmitState());
              }
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                InitialWidget(context, state),
                if (state.isLoading) ...{Loader()}
              ],
            );
          },
        ));
  }
}
