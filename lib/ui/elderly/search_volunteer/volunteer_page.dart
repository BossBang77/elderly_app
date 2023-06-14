import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/appoint_volunteer_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/search/search_volunteer_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_detail/volunteer_detail.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

import 'bloc/search_volunteer_bloc.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key, required this.uid});
  final String uid;

  @override
  Widget build(BuildContext context) {
    context.read<SearchVolunteerBloc>().add(Intital(elderlyId: uid));
    Widget intital(BuildContext context, SearchVolunteerState state) {
      if (state.searchVolunteerView == SearchVolunteerView.searchSummary) {
        return VolunteerWidget(
          uid: uid,
        );
      } else if (state.searchVolunteerView ==
          SearchVolunteerView.searchResult) {
        return SearchVolunteerWidget();
      } else if (state.searchVolunteerView ==
          SearchVolunteerView.volunteerDetail) {
        return VolunteerDetailWidget();
      } else if (state.searchVolunteerView ==
          SearchVolunteerView.AppointVolunteer) {
        return AppointVolunteerWidget();
      } else {
        return Container();
      }
    }

    return BlocConsumer<SearchVolunteerBloc, SearchVolunteerState>(
        listener: (context, state) async {
      if (state.status == SearchStatus.getDetailFail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'เกิดข้อผิดพลาด',
                  subTitle:
                      "มีบางอย่างผิดพลาดในดึงข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'ตกลง',
                )) as bool;

        if (acceptClose) {
          context.read<SearchVolunteerBloc>().add(UpdateSearchStatus());
        }
      }

      if (state.status == SearchStatus.createAppointmentFail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'เกิดข้อผิดพลาด',
                  subTitle:
                      "มีบางอย่างผิดพลาดในการบันทึกข้อมูล\nกรุณาตรวจสอบข้อมูลอีกครั้ง",
                  btnName: 'ตกลง',
                )) as bool;

        if (acceptClose) {
          context.read<SearchVolunteerBloc>().add(UpdateSearchStatus());
        }
      }

      if (state.status == SearchStatus.createAppointSuccess) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext _) => SuccessDialog(
                  header: "ส่งคำขอสำเร็จ!",
                  subtitle:
                      "รอการยืนยันคุณสามารถแชทกับจิตอาสาได้หลังจากที่จิตอาสายืนยันการนัดหมาย",
                  buttonName: 'ตกลง',
                  onTap: () {
                    Navigator.pop(context, true);
                  },
                ));

        if (acceptClose) {
          context.read<SearchVolunteerBloc>().add(UpdateSearchStatus());
          context
              .read<SearchVolunteerBloc>()
              .add(Changeview(view: SearchVolunteerView.searchSummary));
        }
      }
    }, builder: (BuildContext parent, SearchVolunteerState state) {
      return Container(
        color: color.whiteBackground,
        child: Stack(
          children: [
            intital(context, state),
            if (state.isLoading) ...{Loader()}
          ],
        ),
      );
    });
  }
}
