import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';
import '../bloc/personal_medication_bloc.dart';

class PeriodWidget extends StatelessWidget {
  const PeriodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var currentMedication = state.currentMedication;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBody1('ช่วงเวลา', color.black87),
            SpaceWidget(
              height: 10,
            ),
            Row(
              children: [
                for (var item in Period.values)
                  Expanded(
                      child: InkWell(
                    onTap: () {
                      addEvent(
                          context,
                          ChangeDetailMedication(
                              type: MedicationChange.peroid, value: item.name));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 5),
                      padding: EdgeInsets.only(
                          top: 20, bottom: 20, left: 10, right: 10),
                      decoration: BoxDecoration(
                        color: !(item.name == currentMedication.periodType)
                            ? color.grey10.withOpacity(0.05)
                            : color.blueText.withOpacity(0.2),
                        border: !(item.name == currentMedication.periodType)
                            ? null
                            : Border.all(color: color.blueText),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            item.img,
                            scale: 3,
                          ),
                          textButton1(item.title, color.black87)
                        ],
                      ),
                    ),
                  )),
              ],
            )
          ],
        );
      },
    );
  }
}
