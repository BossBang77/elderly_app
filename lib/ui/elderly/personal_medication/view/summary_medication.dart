import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_orange.dart';
import 'package:health_application/ui/elderly/personal_medication/bloc/personal_medication_bloc.dart';
import 'package:health_application/ui/elderly/personal_medication/component/medication_widget.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/widget/space_widget.dart';

class SummaryMedication extends StatelessWidget {
  const SummaryMedication({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonalMedicationBloc, PersonalMedicationState>(
      builder: (context, state) {
        var personalMedi = state.personalMedicationList.data;
        return Scaffold(
          backgroundColor: color.whiteBackground,
          appBar: appBar(
              onBack: () {
                context.go(Routes.home);
              },
              title: 'ยาประจำตัว',
              showNotification: true),
          body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceWidget(
                  height: 30,
                ),
                textSubtitle18Blod('ยาที่ต้องรับประทาน', ColorTheme().black87),
                SpaceWidget(
                  height: 30,
                ),
                ButtonOrange(
                  btnName: 'เพิ่มรายการยา',
                  onClick: () {
                    addEvent(context, CreateFormMedication());
                  },
                ),
                SpaceWidget(
                  height: 30,
                ),
                for (var _item in personalMedi)
                  MedicationWidget(
                    item: _item,
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
