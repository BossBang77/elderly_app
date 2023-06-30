import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/timeline_process.dart';
import 'package:health_application/ui/elderly/volunteer_appoint_summary/bloc/appoint_summary_bloc.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:collection/collection.dart';
import '../../base/constant/gender_const.dart';
import '../../base/routes.dart';
import '../../base/widget/page_scroll.dart';
import '../appointment_detail/appointment_status_section/appointment_status.dart';

class VolunteerAppointSummaryPage extends StatelessWidget {
  const VolunteerAppointSummaryPage({super.key, required this.profileId});
  final String profileId;

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    Widget carddetail(
        {required String img, required String title, required String detail}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Image.asset(
                  img,
                  scale: 3,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textButton1(title, color.greyText),
                  textButton1(detail, color.black87, maxLines: 10),
                ],
              ),
            )
          ],
        ),
      );
    }

    Set<Marker> markers = {};
    return BlocProvider(
      create: (context) =>
          AppointSummaryBloc()..add(GetAppointmentId(id: profileId)),
      child: BlocConsumer<AppointSummaryBloc, AppointSummaryState>(
        listener: (context, state) async {
          var detail = state.appointDetail;
          if (!state.isLoading) {
            markers.add(Marker(
                markerId: MarkerId("Home"),
                position: LatLng(detail.latitude, detail.longitude),
                onTap: () {}));
          }

          if (state.statusUpdate == StatusUpdate.updateStatusSuccess) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => SuccessDialog(
                      header: 'สำเร็จ',
                      subtitle: "ยกเลิกการนัดหมายสำเร็จ",
                      buttonName: 'ตกลง',
                      onTap: () {
                        context.go(Routes.home);
                      },
                    )) as bool;

            if (acceptClose) {
              context.read<AppointSummaryBloc>().add(UpdateStatus());
            }
          }

          if (state.statusUpdate == StatusUpdate.updateStatusFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาก',
                      subTitle: "ยกเลิกการนัดหมายไม่สำเร็จ\nลองอีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<AppointSummaryBloc>().add(UpdateStatus());
            }
          }
        },
        builder: (context, state) {
          var detail = state.appointDetail;

          return Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: ColorTheme().BlueFade2.withOpacity(0.1),
                centerTitle: true,
                title: textSubtitle18W800('การนัดหมาย', ColorTheme().black87),
                leading: BackButtonWidget(onClick: () {
                  context.pop();
                }),
                actions: [
                  detail.status == AppointStatus.CREATE.name
                      ? InkWell(
                          onTap: () {
                            context
                                .read<AppointSummaryBloc>()
                                .add(RejectAppointment(appointId: profileId));
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: textSubtitle16Blod(
                                'ยกเลิก', ColorTheme().BlueDark),
                          )),
                        )
                      : Container()
                ],
              ),
              body: PageScroll(
                imgPath: 'assets/images/appoint_volunteer_summary_bg.png',
                child: Container(
                  color: ColorTheme().BlueFade2.withOpacity(0.1),
                  child: Column(
                    children: [
                      Container(
                        child: Container(
                          padding:
                              EdgeInsets.only(left: 15, right: 15, top: 30),
                          decoration: StyleBorder().buttomSheet(radius: 25),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    textSubtitle18Blod('สถานะการนัดหมาย : ',
                                        ColorTheme().black87),
                                    textSubtitle18Blod(detail.getStatusTitle(),
                                        ColorTheme().DartBlue),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppointmentStatusStep(
                                    stepValues: AppointmentStatus.values
                                        .mapIndexed((index, status) =>
                                            AppointmentStatusItem(
                                                value: status,
                                                title: (index + 1).toString(),
                                                description: status.title))
                                        .toList(),
                                    width:
                                        MediaQuery.of(context).size.width - 48,
                                    currentStep: AppointmentStatus
                                        .values[AppointStatus.values
                                            .firstWhereOrNull((element) =>
                                                element.name == detail.status)
                                            ?.index ??
                                        0]),
                                const SizedBox(
                                  height: 20,
                                ),
                                textSubtitle18Blod(
                                    'จิตอาสา', ColorTheme().black87),
                                Container(
                                  padding: EdgeInsets.only(
                                      top: 20, bottom: 20, left: 20, right: 20),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15))),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: detail.volunteer.image.isNotEmpty
                                            ? CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    detail.volunteer.image,
                                                    scale: 4),
                                                radius: 40,
                                              )
                                            : CircleAvatar(
                                                backgroundImage: ExactAssetImage(
                                                    'assets/images/img_notfound.png',
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            textSubtitle16Blod(
                                                '${detail.volunteer.name} (${detail.volunteer.elderlyCareCode})',
                                                ColorTheme().black87),
                                            textH7(
                                                detail
                                                    .volunteer.elderlyCareName,
                                                color.greyText),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            InkWell(
                                              onTap: () {
                                                makePhoneCall(detail.volunteer
                                                    .elderlyCareContactMobile);
                                              },
                                              child: Container(
                                                constraints: BoxConstraints(
                                                    maxWidth: 80),
                                                padding: EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                    color: color.DartBlue
                                                        .withOpacity(0.15),
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                15))),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      'assets/images/call_icon.png',
                                                      scale: 4,
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    textH7(
                                                        'โทร', color.DartBlue),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                textSubtitle18Blod('ข้อมูลการนัดหมายจิตอาสา',
                                    ColorTheme().black87),
                                const SizedBox(
                                  height: 20,
                                ),
                                carddetail(
                                  img: 'assets/images/type_appoit_icon.png',
                                  title: 'ประเภทการนัดหมาย',
                                  detail: detail.getTypeAppoint().isNoData(),
                                ),
                                carddetail(
                                  img: 'assets/images/calendar_blue.png',
                                  title: 'วันที่นัดหมาย',
                                  detail:
                                      '${detail.appointmentDate.parseTime().toDisplayFullBuddishDate(locale: 'th')}',
                                ),
                                carddetail(
                                  img: 'assets/images/clock_blue.png',
                                  title: 'เวลานัดหมาย',
                                  detail: detail.getTimeSlotNextLine(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                textSubtitle18Blod('ข้อมูลการดูแลผู้สูงอายุ',
                                    ColorTheme().black87),
                                const SizedBox(
                                  height: 20,
                                ),
                                carddetail(
                                  img: 'assets/images/person_blue.png',
                                  title: 'ชื่อ',
                                  detail: detail.elderly.name,
                                ),
                                carddetail(
                                  img: 'assets/images/person_blue.png',
                                  title: 'เพศ/อายุ',
                                  detail:
                                      '${Gender.mapToTitle(detail.elderly.gender)} (${detail.elderly.age} ปี)',
                                ),
                                carddetail(
                                  img: 'assets/images/call_icon.png',
                                  title: 'เบอร์ติดต่อ',
                                  detail:
                                      '${detail.elderly.mobileNumber.toPhoneFormat()}',
                                ),
                                carddetail(
                                  img: 'assets/images/board_blue.png',
                                  title: 'โรคประจำตัว',
                                  detail:
                                      detail.elderly.getCongenital().isNoData(),
                                ),
                                carddetail(
                                  img: 'assets/images/board_blue.png',
                                  title: 'การแพ้อาหาร',
                                  detail: detail.elderly
                                      .getAllergicFoods()
                                      .isNoData(),
                                ),
                                carddetail(
                                  img: 'assets/images/clock_blue.png',
                                  title: 'รายละเอียดเพิ่มเติมถึงจิตอาสา',
                                  detail: detail.note.isNoData(),
                                ),
                                carddetail(
                                    img: 'assets/images/location_blue.png',
                                    title: 'สถานที่นัดหมาย',
                                    detail: detail.addressFull),
                                const SizedBox(
                                  height: 20,
                                ),
                                if (!state.isLoading)
                                  Container(
                                      height: 200,
                                      width: sized.width * 0.93,
                                      alignment: Alignment.center,
                                      child: GoogleMap(
                                        initialCameraPosition: CameraPosition(
                                          target: LatLng(detail.latitude,
                                              detail.longitude),
                                          zoom: 15,
                                        ),
                                        compassEnabled: true,
                                        tiltGesturesEnabled: false,
                                        myLocationEnabled: true,
                                        myLocationButtonEnabled: false,
                                        mapType: MapType.normal,
                                        markers: markers,
                                        onTap: (LatLng latLng) {
                                          launchMapsUrl(detail.latitude,
                                              detail.longitude);
                                        },
                                      )),
                                const SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}

enum AppointmentStatus {
  waitforapprove(title: 'รอการยืนยัน'),
  waitforstart(title: 'รอเริ่มงาน'),
  start(title: 'เริ่มงาน'),
  done(title: 'สำเร็จ');

  const AppointmentStatus({required this.title});

  final String title;
}
