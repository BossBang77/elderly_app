import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/request_assistance/bloc/request_assistance_bloc.dart';
import 'package:health_application/ui/elderly/request_assistance/emergency_call/assistance_detail_widget.dart';
import 'package:health_application/ui/elderly/request_assistance/emergency_call/emergency_call_widget.dart';
import 'package:health_application/ui/elderly/request_assistance/emergency_call/waiting_emergency_widget.dart';

class RequestAssitancePage extends StatelessWidget {
  const RequestAssitancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RequestAssistanceBloc(),
      child: BlocConsumer<RequestAssistanceBloc, RequestAssistanceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state.assistanceStatus == AssistanceStatus.emergencyCall) {
            return EmergrncyCallWidget();
          } else if (state.assistanceStatus ==
              AssistanceStatus.waitingForHelp) {
            return WaitingEmergencyWidget();
          } else if (state.assistanceStatus ==
              AssistanceStatus.volunteerAccept) {
            return AssitstanceDetailWidget();
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
