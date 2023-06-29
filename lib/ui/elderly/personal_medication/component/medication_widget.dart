import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/extension/master_data_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../bloc/personal_medication_bloc.dart';
import '../model/medication_detail_model.dart';

class MedicationWidget extends StatelessWidget {
  const MedicationWidget({super.key, required this.item});
  final MedicationDetailModel item;

  @override
  Widget build(BuildContext context) {
    var timeList = BlocProvider.of<MasterDataBloc>(context)
        .state
        .medicationIntakeTime
        .data;

    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var medicationSelect =
            getMedication(state.masterMedication, item.medicationId);
        String getImg() {
          try {
            return MedicationType.values
                .firstWhere((type) => type.name == medicationSelect.type)
                .img;
          } catch (e) {
            return MedicationType.PILL.img;
          }
        }

        return InkWell(
          onTap: () {
            addEvent(context, UpdateFormMedication(currentMedication: item));
          },
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Image.asset(
                        getImg(),
                        scale: 4,
                      ),
                    ),
                    SpaceWidget(
                      width: 10,
                    ),
                    Flexible(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textSubtitle16W500(
                                  getNameMedication(state.masterMedication,
                                          item.medicationId)
                                      .isNoData(),
                                  color.black87),
                              InkWell(
                                onTap: () {
                                  context
                                      .read<PersonalMedicationBloc>()
                                      .add(DeleteMedcation(id: item.id));
                                },
                                child: Image.asset(
                                  'assets/images/exit_icon.png',
                                  scale: 3,
                                ),
                              )
                            ],
                          ),
                          textSubtitle2(
                              item.dosage.isNoData(), color.black87, false),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              textSubtitle2(item.periodName().isNoData(),
                                  color.black87, false),
                              SpaceWidget(
                                width: 20,
                              ),
                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for (var period in item.periodTimes)
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          textSubtitle2(period.desPeriod(),
                                              color.black87, false),
                                          textSubtitle2(
                                              timeList.getKeyName(
                                                  period.notificationTime),
                                              color.black87,
                                              false),
                                        ],
                                      )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          if (item.isNotificationEveryDay)
                            textSubtitle15w400(
                                'แจ้งเตือนซ้ำๆทุกวัน', color.black87)
                        ],
                      ),
                    ),
                  ],
                ),
                Divider()
              ],
            ),
          ),
        );
      },
    );
  }
}
