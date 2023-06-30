import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/dialog/accept_two_condition_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/request_assistance/bloc/request_assistance_bloc.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../../../base/constant/gender_const.dart';
import '../../../base/luncher/luncher_function.dart';

class AssitstanceDetailWidget extends StatelessWidget {
  const AssitstanceDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return BlocBuilder<RequestAssistanceBloc, RequestAssistanceState>(
      builder: (context, state) {
        var emergencyDetail = state.emergencyHelpDetail;
        var volunteerList = emergencyDetail.emergencyHelpers;
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
                  context.go(Routes.home);
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
                            textH6('รอความช่วยเหลือ...', color.black87, false),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/silane_icon.png',
                                  scale: 3,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textSubtitle16Blod(
                                        '${emergencyDetail.profile.name} (${Gender.mapToTitle(emergencyDetail.profile.gender)}, ${emergencyDetail.profile.age} ปี)',
                                        color.black87),
                                    Container(
                                      width: sized.width * 0.7,
                                      child: textButton1(
                                          emergencyDetail.addressFull,
                                          color.black87,
                                          maxLines: 3),
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
                        thickness: 10,
                        indent: 0,
                        endIndent: 0,
                        color: color.grey10,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //TODO
                      for (var volunteer in volunteerList)
                        Container(
                          padding: EdgeInsets.only(left: 20, right: 20),
                          child: Column(children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                volunteer.profile.image.isNotEmpty
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            volunteer.profile.image,
                                            scale: 4),
                                        radius: 30,
                                      )
                                    : CircleAvatar(
                                        backgroundImage: ExactAssetImage(
                                            Gender.getPicGenderVolunteer(
                                                volunteer.profile.gender),
                                            scale: 4),
                                        radius: 30,
                                      ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textSubtitle16Blod(
                                        '${volunteer.profile.name} (${volunteer.volunteerCode.isNotEmpty ? volunteer.volunteerCode : 'ไม่ระบุหมายเลขจิตอาสา'})',
                                        color.black87),
                                    Container(
                                      width: sized.width * 0.68,
                                      child: textButton1(
                                          volunteer.elderlyCareName.isNotEmpty
                                              ? volunteer.elderlyCareName
                                              : 'ไม่ทราบเครือข่ายจิตอาสา',
                                          color.greyText,
                                          maxLines: 3),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        await Luncher.makePhoneCall(
                                            volunteer.profile.mobileNumber);
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color:
                                              color.emergency.withOpacity(0.2),
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
                            const SizedBox(
                              height: 40,
                            ),
                            Row(
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
                                          volunteer.addressFull, color.black87,
                                          maxLines: 3),
                                    ),
                                    // TODO No data this field
                                    // textOverline2('ตระยะทาง 2.4 กม. (28 นาที)',
                                    //     color.greyText),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: 200,
                                width: sized.width * 0.93,
                                alignment: Alignment.center,
                                child: GoogleMap(
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                        volunteer.latitude.toDouble(),
                                        volunteer.longitude.toDouble()),
                                    zoom: 15,
                                  ),
                                  compassEnabled: true,
                                  tiltGesturesEnabled: false,
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: false,
                                  mapType: MapType.normal,
                                  markers: [
                                    Marker(
                                        markerId: MarkerId(volunteer.profileId),
                                        position: LatLng(
                                            volunteer.latitude.toDouble(),
                                            volunteer.longitude.toDouble()),
                                        onTap: () {})
                                  ].toSet(),
                                  onTap: (LatLng latLng) async {
                                    await Luncher.launchMapsUrl(
                                        volunteer.latitude.toDouble(),
                                        volunteer.longitude.toDouble());
                                  },
                                )),
                            const SizedBox(
                              height: 20,
                            ),
                            Divider(
                              color: color.grey10,
                              thickness: 1.5,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ]),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ButtonGradient(
                          btnName: 'ฉันปลอดภัยแล้ว',
                          onClick: () async {
                            final bool acceptClose = await showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    AcceptTwoCondition(
                                      header: 'ปลอดภัยแล้ว',
                                      subtitle:
                                          'กรุณากดยืนยัน\nเพื่อยืนยันการได้รับ\nความช่วยเหลือแล้ว',
                                    )) as bool;

                            if (acceptClose) {
                              context
                                  .read<RequestAssistanceBloc>()
                                  .add(SubmitIsSafe());
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ]),
        );
      },
    );
  }
}
