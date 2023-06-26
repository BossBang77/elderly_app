import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/widget/text_field_widget.dart';
import '../bloc/personal_medication_bloc.dart';

class OtherDes extends StatelessWidget {
  const OtherDes({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var currentMedication = state.currentMedication;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBody1('เพิ่มเติม', color.black87),
            SpaceWidget(
              height: 10,
            ),
            TextFieldWidget.enable(
              text: currentMedication.description,
              maxLength: 100,
              minLines: 4,
              multiLine: true,
              hintText: 'เช่น ทาบริเวณที่เป็นโรค',
              onChanged: (value) {
                addEvent(
                    context,
                    ChangeDetailMedication(
                        type: MedicationChange.setDescription, value: value));
              },
            ),
          ],
        );
      },
    );
  }
}
