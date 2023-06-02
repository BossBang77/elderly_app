import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/date_of_appointment.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/personal_information.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/select_time.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/type_appoint.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../base/widget/button_gradient.dart';
import '../bloc/search_volunteer_bloc.dart';

class AppointVolunteerWidget extends StatelessWidget {
  const AppointVolunteerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: color.whiteBackground,
        appBar: appBar(
            onBack: () {
              context
                  .read<SearchVolunteerBloc>()
                  .add(Changeview(view: SearchVolunteerView.volunteerDetail));
            },
            title: 'นัดหมาย',
            showNotification: false),
        body: Padding(
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
              top: 20,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        top: 20, bottom: 20, left: 20, right: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: color.GreyBorder),
                        color: color.grey10,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Row(
                      children: [
                        Flexible(
                          child: CircleAvatar(
                            backgroundImage: ExactAssetImage(
                                'assets/images/example_volunteer2.png',
                                scale: 4),
                            radius: 40,
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSubtitle16Blod('นางบุญญาพร สุวรรณโชติ',
                                  ColorTheme().black87),
                              textH7('ศูนย์บริการสาธารณสุข 16 ลุมพินี',
                                  color.greyText),
                              textH7('จิตอาสา (9045)', color.greyText)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  TypeOfAppoint(),
                  Divider(),
                  DateOfAppointment(),
                  Divider(),
                  SelectTime(),
                  Divider(),
                  PersonalInformation(),
                  Divider(),
                  const SizedBox(
                    height: 30,
                  ),
                  ButtonGradient(
                    btnName: 'ส่งคำขอ',
                    onClick: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext _) => SuccessDialog(
                                header: "ส่งคำขอสำเร็จ!",
                                subtitle:
                                    "รอการยืนยันคุณสามารถแชทกับจิตอาสาได้หลังจากที่จิตอาสายืนยันการนัดหมาย",
                                buttonName: 'ตกลง',
                                onTap: () {
                                  Navigator.pop(context, true);
                                  context.read<SearchVolunteerBloc>().add(
                                      Changeview(
                                          view: SearchVolunteerView
                                              .searchSummary));
                                },
                              ));
                    },
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            )));
  }
}
