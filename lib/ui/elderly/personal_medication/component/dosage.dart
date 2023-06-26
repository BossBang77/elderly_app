import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/personal_medication/bloc/personal_medication_bloc.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../ui-extensions/color.dart';

class Dosage extends StatelessWidget {
  const Dosage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var currentMedication = state.currentMedication;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textBody1('ขนาดและวิธีการใช้ยา', color.black87),
            SpaceWidget(
              height: 10,
            ),
            TextFieldWidget.enable(
              text: currentMedication.dosage,
              maxLength: 100,
              hintText: 'ระบุขนาดและวิธีการใช้ยา',
              onChanged: (value) {
                addEvent(
                    context,
                    ChangeDetailMedication(
                        type: MedicationChange.dosage, value: value));
              },
            ),
          ],
        );
      },
    );
  }
}
