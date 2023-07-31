import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/appoint_detail_card/bloc/appointment_card_bloc.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/elderly/volunteer_appoint_summary/volunteer_appoint_summary_page.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../elderly/search_volunteer/model/appointment_detail/appointment_detail.dart';

class AppointDetailCard extends StatelessWidget {
  const AppointDetailCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;

    return BlocConsumer<AppointmentCardBloc, AppointmentCardState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var appointList = state.appointList.data;
        if (appointList.isEmpty) {
          return Container();
        }
        final itemKey = GlobalKey();
        final scrollController = ScrollController();

        return Container(
          width: sized.width * 0.9,
          height: sized.height * 0.2,
          child: ListView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            children: <Widget>[
              for (int i = 0; i < appointList.length; i++)
                appointCard(context, appointList[i])
            ],
          ),
        );
      },
    );
  }

  Widget appointCard(BuildContext context, AppointmentDetail item) {
    var sized = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        context.push(Routes.volunteerAppointSummary, extra: item.id);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Container(
          padding: EdgeInsets.all(20),
          width: sized.width * 0.9,
          decoration: StyleBorder().blueDecoration(radius: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: item.volunteer.image.isNotEmpty
                              ? CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      item.volunteer.image,
                                      scale: 4),
                                  radius: 30,
                                )
                              : CircleAvatar(
                                  backgroundImage: ExactAssetImage(
                                      'assets/images/img_notfound.png',
                                      scale: 4),
                                  radius: 30,
                                ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              textSubtitle16Blod(
                                  item.volunteer.name, ColorTheme().black87),
                              textH7(
                                  'จิตอาสา (${item.volunteer.elderlyCareCode})',
                                  color.black87)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Image.asset(
                      'assets/images/arrow.png',
                      color: color.BlueDark,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              textButton1(
                '${item.appointmentDate.parseTime().toDisplayFullBuddishDate(locale: 'th')}',
                color.black87,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/appoint_time.png',
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: sized.width / 3,
                        child: textButton1(
                            item.getTimeSlot().isNoData(), ColorTheme().black87,
                            maxLines: 1),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/appoint_waiting.png',
                        scale: 4,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                          child: textButton1(
                              item.getStatusTitle(), ColorTheme().black87)),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
