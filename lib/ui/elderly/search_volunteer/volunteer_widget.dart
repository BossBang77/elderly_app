import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/appoint_detail_card/appoint_detail_card.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/component/last_volunteer.dart';
import 'package:health_application/ui/elderly/search_volunteer/component/volunteer_card.dart';
import 'package:health_application/ui/elderly/search_volunteer/model/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import '../../base/appoint_detail_card/bloc/appointment_card_bloc.dart';
import '../../ui-extensions/font.dart';

class VolunteerWidget extends StatelessWidget {
  const VolunteerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;

    List<AppointmentDetail> removeDuplicateVolunteer(
        List<AppointmentDetail> master) {
      final ids =
          master.map((masterMol) => masterMol.volunteer.profileId).toSet();
      master.retainWhere((d) => ids.remove(d.volunteer.profileId));
      return master;
    }

    return Scaffold(
      appBar: appBar(
          onBack: () {
            context.go(Routes.home);
          },
          showNotification: false,
          title: 'เรียกจิตอาสา'),
      body: BlocBuilder<SearchVolunteerBloc, SearchVolunteerState>(
        builder: (context, state) {
          var lastest =
              removeDuplicateVolunteer([...state.lastestAppointList.data]);

          return Container(
            width: sized.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 50),
                        width: sized.width,
                        child: Image.asset(
                          'assets/images/volunteer_bg.png',
                          scale: 4,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 20,
                        child: InkWell(
                          onTap: () {
                            context.read<SearchVolunteerBloc>().add(Changeview(
                                view: SearchVolunteerView.searchResult));
                          },
                          child: Container(
                            width: sized.width * 0.9,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: color.grey10,
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                                color: color.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                Image.asset(
                                  'assets/images/search_icon.png',
                                  scale: 4,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                textButton1('ค้นหาจิตอาสา', color.greyText),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 15, right: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (context
                              .read<AppointmentCardBloc>()
                              .state
                              .appointList
                              .data
                              .isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                textSubtitle18Blod(
                                    'การนัดหมายของคุณ', ColorTheme().black87),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppointDetailCard(),
                              ],
                            ),
                          const SizedBox(
                            height: 20,
                          ),
                          if (lastest.isNotEmpty)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle18Blod(
                                    'เรียกล่าสุด', ColorTheme().black87),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: sized.width * 0.9,
                                      height: sized.height * 0.25,
                                      child: ListView(
                                        scrollDirection: Axis.horizontal,
                                        children: <Widget>[
                                          for (int i = 0;
                                              i < lastest.length;
                                              i++)
                                            lastVolunteer(context, onClick: () {
                                              context
                                                  .read<SearchVolunteerBloc>()
                                                  .add(GetDetailVolunteer(
                                                      id: lastest[i]
                                                          .volunteer
                                                          .profileId));
                                            }, detail: lastest[i])
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),

                          const SizedBox(
                            height: 20,
                          ),

                          //TODO  no api this part
                          /*
                          textSubtitle18Blod(
                              'จิตอาสาใกล้คุณ', ColorTheme().black87),
                          const SizedBox(
                            height: 10,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GoogleMaps()),
                              ).then((value) {
                                // TODO integrate
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      'assets/images/icon_map_marker.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: sized.width * 0.7,
                                      child: textButton1(
                                          'ตำแหน่ง : 3000 ถนนพหลโยธิน แขวง จอมพล เขตจตุจักร กรุงเทพฯ 10900',
                                          color.BlueDark),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  size: 15,
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: sized.width,
                            height: sized.height * 0.25,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                for (int i = 0; i < 10; i++)
                                  nearVolunteer(context)
                              ],
                            ),
                          ), */
                          textSubtitle18Blod(
                              'จิตอาสาทั้งหมด', ColorTheme().black87),
                          const SizedBox(
                            height: 10,
                          ),
                          for (int i = 0; i < state.searchRes.data.length; i++)
                            InkWell(
                                onTap: () {
                                  context.read<SearchVolunteerBloc>().add(
                                      GetDetailVolunteer(
                                          id: state
                                              .searchRes.data[i].profileId));
                                },
                                child: volunteerCard(
                                    context, state.searchRes.data[i]))
                        ],
                      ))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
