import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/emergency_detail_card/bloc/emergency_detail_card_bloc.dart';
import 'package:health_application/ui/base/emergency_detail_card/component/volunteer_accept_assistance.dart';
import 'package:health_application/ui/base/emergency_detail_card/component/waiting_assistance.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../ui-extensions/color.dart';

class EmergencyDetailCard extends StatelessWidget {
  const EmergencyDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return BlocConsumer<EmergencyDetailCardBloc, EmergencyDetailCardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state.status == EmergencyStatus.WaitingAssistance) {
          return WaitingAssistance();
        } else {
          return VolunteerAcceptAssistance();
        }
      },
    );
  }
}
