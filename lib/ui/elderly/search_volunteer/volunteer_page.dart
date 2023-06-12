import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/search_volunteer/appoint_volunteer/appoint_volunteer_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/search/search_volunteer_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_detail/volunteer_detail.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_widget.dart';

import 'bloc/search_volunteer_bloc.dart';

class VolunteerPage extends StatelessWidget {
  const VolunteerPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SearchVolunteerBloc>().add(Intital());
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
    }, builder: (BuildContext parent, SearchVolunteerState state) {
      if (state.searchVolunteerView == SearchVolunteerView.searchSummary) {
        return VolunteerWidget();
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
    });
  }
}
