import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/title_header.dart';
import 'package:health_application/ui/elderly/personal_medication/model/period_time_model.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/extension/master_data_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/model/master_data_detail.dart';
import '../../../base/widget/dropdown_widget.dart';
import '../bloc/personal_medication_bloc.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({super.key});

  @override
  Widget build(BuildContext context) {
    var medicationIntakeTime = BlocProvider.of<MasterDataBloc>(context)
        .state
        .medicationIntakeTime
        .data;
    var notificationEveryHour = BlocProvider.of<MasterDataBloc>(context)
        .state
        .notificationEveryHour
        .data;

    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var currentMedication = state.currentMedication;
        var periodTimes = [...currentMedication.periodTimes];
        List<MasterDataDetail> getMasterList(String code) {
          if (code == TimeOfMedication.OTHER.name) {
            return notificationEveryHour;
          } else {
            return medicationIntakeTime;
          }
        }

        bool checkIsSelect(String code) {
          return periodTimes.map((item) => item.code).contains(code);
        }

        String getNotiTimeDDL(String code) {
          String timeCode = periodTimes
              .firstWhere((element) => element.code == code,
                  orElse: () => PeriodTimeModel())
              .notificationTime;
          var master = getMasterList(code);
          return master.getKeyName(timeCode);
        }

        return Column(
          children: [
            for (var item in TimeOfMedication.values)
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      MedicationChange type = MedicationChange.addTime;
                      if (checkIsSelect(item.name)) {
                        type = MedicationChange.removeTime;
                      }
                      addEvent(
                          context,
                          ChangeDetailMedication(
                              type: type, value: item.name, code: item.name));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.all(5),
                      decoration: StyleBorder().greyDecoration(radius: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(minHeight: 50),
                            child: Image.asset(
                              checkIsSelect(item.name)
                                  ? 'assets/images/check_box_check.png'
                                  : 'assets/images/check_box_uncheck.png',
                              scale: 4,
                            ),
                          ),
                          SpaceWidget(
                            width: 20,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.6,
                            child: textH7(
                              item.title,
                              color.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SpaceWidget(
                    height: 20,
                  ),
                  if (checkIsSelect(item.name))
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleHeaderWidget(
                          title: 'เวลาแจ้งเตือน',
                          isMandatory: true,
                        ),
                        DropdownWidget(
                          value: getNotiTimeDDL(item.name).takeOrNullIfEmpty(),
                          items: getMasterList(item.name).toListKeyName(),
                          setErrorWithOuter:
                              getNotiTimeDDL(item.name).takeOrNullIfEmpty() ==
                                  null,
                          onChanged: (value) {
                            addEvent(
                                context,
                                ChangeDetailMedication(
                                    type: MedicationChange.setTimeNoti,
                                    value: getMasterList(item.name)
                                        .getKeyCode(value ?? ''),
                                    code: item.name));
                          },
                          hint: 'ระบุเวลาแจ้งเตือน',
                        ),
                        SpaceWidget(
                          height: 20,
                        ),
                      ],
                    ),
                ],
              )
          ],
        );
      },
    );
  }
}
