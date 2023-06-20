import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/luncher/luncher_function.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_red.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/volunteer/request_assistance_detail/bloc/request_assistance_bloc.dart';
import 'package:health_application/ui/volunteer/search_elderly/search_elderly_page.dart';

import '../../base/constant/gender_const.dart';
import '../../base/widget/button_gradient.dart';
import '../../base/widget/error_alert.dart';
import '../../ui-extensions/color.dart';

class RequestAssitanceDetailPage extends StatelessWidget {
  const RequestAssitanceDetailPage({super.key, required this.assistanceId});
  final String assistanceId;

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => RequestAssistanceBloc()
        ..add(GetAssistanceDatail(emergencyId: assistanceId)),
      child: BlocConsumer<RequestAssistanceBloc, RequestAssistanceState>(
        listener: (context, state) async {
          if (state.eventStatus == EventStatus.searchElderlySuccess) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ElderlySearchDetailPage(
                    elderlyProfile: state.elderlyProfile)));
          }

          if (state.eventStatus == EventStatus.searchElderlyFail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle:
                          "มีบางอย่างผิดพลาดในการดึงข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<RequestAssistanceBloc>().add(SetInitialEvent());
            }
          }
        },
        builder: (context, state) {
          var detail = state.emergencyDetail;
          var profile = detail.profile;
          return Scaffold(
            body: Stack(children: [
              Container(
                  height: sized.height,
                  alignment: Alignment.topCenter,
                  child: Image.asset('assets/images/assistance_bg.png')),
              Positioned(
                top: 50,
                left: 20,
                child: BackButtonWidget(
                  onClick: () {
                    Navigator.pop(context);
                  },
                  imgPath: 'assets/images/back_icon_outline.png',
                ),
              ),
              Positioned(
                top: sized.height * 0.35,
                child: Container(
                  width: sized.width,
                  height: sized.height * 0.65,
                  decoration: StyleBorder().buttomSheet(),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              textH6('ขอความช่วยเหลือฉุกเฉิน', color.black87,
                                  false),
                              //TODO
                              // textH7(
                              //     'ระยะทาง 2.4 กม. (28 นาที)', color.black87),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/man_active.png',
                                    scale: 7,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      textSubtitle16Blod(
                                          profile.name, color.black87),
                                      Container(
                                        width: sized.width * 0.6,
                                        child: textButton1(
                                            '${Gender.mapToTitle(profile.gender)}, ${profile.age} ปี',
                                            color.greyText,
                                            maxLines: 3),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          await Luncher.makePhoneCall(
                                              profile.mobileNumber);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.all(7),
                                          decoration: BoxDecoration(
                                            color: color.emergency
                                                .withOpacity(0.2),
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                          ),
                                          child: Row(children: [
                                            Image.asset(
                                              'assets/images/phone_blue.png',
                                              color: color.emergency,
                                              scale: 4,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            textButton1('โทร', color.emergency),
                                          ]),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Divider(
                          thickness: 1,
                          indent: 10,
                          endIndent: 10,
                          color: color.grey10,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        InkWell(
                            onTap: () {
                              context.read<RequestAssistanceBloc>().add(
                                  GetElderlyProfile(id: profile.profileId));
                            },
                            child: textButton1(
                                'ดูข้อมูลเพิ่มเติม', color.blueText,
                                maxLines: 3)),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/position_emergency.png',
                                scale: 3,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textSubtitle16Blod(
                                      'ตำแหน่ง :', color.black87),
                                  Container(
                                    width: sized.width * 0.7,
                                    child: textButton1(
                                        detail.addressFull, color.black87,
                                        maxLines: 3),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        if (detail.latitude.toDouble() != 0 ||
                            detail.longitude.toDouble() != 0)
                          Container(
                              height: 200,
                              width: sized.width * 0.93,
                              alignment: Alignment.center,
                              child: GoogleMap(
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(detail.latitude.toDouble(),
                                      detail.longitude.toDouble()),
                                  zoom: 15,
                                ),
                                compassEnabled: true,
                                tiltGesturesEnabled: false,
                                myLocationEnabled: true,
                                myLocationButtonEnabled: false,
                                mapType: MapType.normal,
                                markers: [
                                  Marker(
                                      markerId: MarkerId(detail.id),
                                      position: LatLng(
                                          detail.latitude.toDouble(),
                                          detail.longitude.toDouble()),
                                      onTap: () {})
                                ].toSet(),
                                onTap: (LatLng latLng) async {
                                  await Luncher.launchMapsUrl(
                                      detail.latitude.toDouble(),
                                      detail.longitude.toDouble());
                                },
                              )),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: ButtonRed(
                            btnName: 'นำทางไปที่หมาย',
                            onClick: () async {
                              await Luncher.launchMapsUrl(
                                  detail.latitude.toDouble(),
                                  detail.longitude.toDouble());
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (state.isLoading) Loader()
            ]),
          );
        },
      ),
    );
  }
}
