import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/personal_medication/bloc/personal_medication_bloc.dart';
import 'package:health_application/ui/elderly/personal_medication/view/medication_detail.dart';
import 'package:health_application/ui/elderly/personal_medication/view/summary_medication.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

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
        create: (context) => PersonalMedicationBloc(),
        child: BlocConsumer<PersonalMedicationBloc, PersonalMedicationState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return Stack(
              children: [
                InitialWidget(context, state),
                if (false) ...{Loader()}
              ],
            );
          },
        ));
  }
}
