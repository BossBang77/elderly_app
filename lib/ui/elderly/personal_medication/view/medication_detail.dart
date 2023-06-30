import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/elderly/personal_medication/bloc/personal_medication_bloc.dart';
import 'package:health_application/ui/elderly/personal_medication/component/other_des.dart';
import 'package:health_application/ui/elderly/personal_medication/component/period_widget.dart';
import 'package:health_application/ui/elderly/personal_medication/component/search_medication.dart';
import 'package:health_application/ui/elderly/personal_medication/component/select_repeat_notifications.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

import '../../../base/dialog/warning_dialog.dart';
import '../component/dosage.dart';
import '../component/select_time.dart';

class MedicationDetail extends StatelessWidget {
  const MedicationDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.whiteBackground,
      appBar: appBar(
          onBack: () {
            addEvent(context,
                ChangeView(viewMedication: PageViewMedication.summaryPage));
          },
          title: 'ยาประจำตัว',
          showNotification: true),
      body: BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SpaceWidget(
                    height: 30,
                  ),
                  SearchMedication(),
                  SpaceWidget(
                    height: 20,
                  ),
                  Dosage(),
                  SpaceWidget(
                    height: 20,
                  ),
                  PeriodWidget(),
                  SpaceWidget(
                    height: 20,
                  ),
                  SelectTime(),
                  SpaceWidget(
                    height: 20,
                  ),
                  OtherDes(),
                  SpaceWidget(
                    height: 20,
                  ),
                  SelectRepeatNotifications(),
                  SpaceWidget(
                    height: 20,
                  ),
                  ButtonGradient(
                    btnName: 'บันทึก',
                    onClick: () async {
                      if (!checkMandatory(state.currentMedication)) {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => WarningDialog(
                                  header: 'แจ้งเตือน',
                                  subtitle: "กรุณากรอกข้อมูลให้ครบถ้วน",
                                  buttonName: 'ตกลง',
                                  onTap: () {},
                                )) as bool;
                      } else if (!checkDuplicateMedication(
                              state, state.currentMedication.medicationId) &&
                          (state.modeData == ModeData.CREATE)) {
                        await showDialog(
                            context: context,
                            builder: (BuildContext context) => WarningDialog(
                                  header: 'แจ้งเตือน',
                                  subtitle: "ไม่สามารถเพิ่มยาซ้ำกันได้",
                                  buttonName: 'ตกลง',
                                  onTap: () {},
                                )) as bool;
                      } else {
                        addEvent(context, SubmitMedication());
                      }
                    },
                  ),
                  SpaceWidget(
                    height: 40,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
