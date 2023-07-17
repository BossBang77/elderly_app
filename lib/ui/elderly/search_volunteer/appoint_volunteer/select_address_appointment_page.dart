import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/accept_two_condition_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../../google_map/locationsModel.dart';
import '../../../ui-extensions/color.dart';
import '../../../user_profile/bloc/user_profile_bloc.dart';

class SelectAddressAppointmentPage extends StatelessWidget {
  const SelectAddressAppointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: color.white,
      appBar: appBar(
          onBack: () {
            String uid = BlocProvider.of<SearchVolunteerBloc>(context)
                .state
                .currentVolunteerUid;
            context.go(
              Routes.volunteerPage,
              extra: [uid, true],
            );
          },
          title: 'เลือกสถานที่นัดหมาย',
          images: 'assets/images/close_icon.png'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpaceWidget(
            height: 20,
          ),
          InkWell(
            onTap: () {
              GoRouter.of(context).go(Routes.googleMaps);
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Image.asset(
                          'assets/images/map_search_icon.png',
                          scale: 3,
                        ),
                      ),
                      SpaceWidget(
                        width: 20,
                      ),
                      textSubtitle16Blod('ค้นหาที่อยู่บนแผนที่', color.black87,
                          align: TextAlign.center)
                    ],
                  ),
                  Image.asset(
                    'assets/images/chevron_right.png',
                    scale: 3,
                  )
                ],
              ),
            ),
          ),
          SpaceWidget(
            height: 30,
          ),
          Divider(
            color: color.grey10.withOpacity(0.05),
            thickness: 10,
          ),
          SpaceWidget(
            height: 30,
          ),
          BlocListener<UserProfileBloc, UserProfileState>(
            listener: (context, state) async {
              if (state.status == UserProfileStatus.delFail) {
                final bool acceptClose = await showDialog(
                    context: context,
                    builder: (BuildContext context) => ErrorAlertWidget(
                          title: 'เกิดข้อผิดพลาด',
                          subTitle:
                              "มีบางอย่างผิดพลาดในการลบข้อมูล\nกรุณาลองใหม่อีกครั้ง",
                          btnName: 'ตกลง',
                        )) as bool;

                if (acceptClose) {
                  context.read<UserProfileBloc>().add(IntitalLogoutStatus());
                }
              }
            },
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
              builder: (context, state) {
                var addressList = state.userProfile.addresses;
                return Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      textSubtitle18Blod(
                          'สถานที่นัดหมายที่บันทึกไว้', color.black87),
                      if (addressList.isEmpty)
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: text12('ไม่พบที่อยู่', color.greyText),
                        )),
                      for (var i = 0; i < addressList.length; i++)
                        Container(
                          padding: const EdgeInsets.only(top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/location_icon.png',
                                    scale: 3,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Flexible(
                                    child: InkWell(
                                      onTap: () {
                                        Locations _locations = Locations(
                                            latitude: addressList[i].latitude,
                                            longtitude:
                                                addressList[i].longitude,
                                            nameAddress:
                                                addressList[i].fullAddress);
                                        context.read<SearchVolunteerBloc>().add(
                                            MapCreateAppointment(
                                                createObj:
                                                    CreateAppointObj.address,
                                                value: _locations));
                                        String uid = BlocProvider.of<
                                                SearchVolunteerBloc>(context)
                                            .state
                                            .currentVolunteerUid;
                                        context.go(
                                          Routes.volunteerPage,
                                          extra: [uid, true],
                                        );
                                      },
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          textSubtitle16W500(
                                            addressList[i].fullAddress,
                                            ColorTheme().black87,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      final bool acceptClose = await showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AcceptTwoCondition(
                                                header: 'ลบที่อยู่',
                                                subtitle:
                                                    'คุณต้องการลบที่อยู่นี้ใช่หรือไม่',
                                                btnAcceptName:
                                                    "ใช่ ลบที่อยู่นี้",
                                              )) as bool;

                                      if (acceptClose) {
                                        var profile = state.userProfile;
                                        var listAddress = [
                                          ...state.userProfile.addresses
                                        ];
                                        listAddress.removeAt(i);
                                        profile = profile.copyWith(
                                            addresses: listAddress);

                                        context.read<UserProfileBloc>().add(
                                            UpdateProfile(profile: profile));
                                      }
                                    },
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      child: Image.asset(
                                        'assets/images/close_icon.png',
                                        scale: 4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Divider()
                            ],
                          ),
                        )
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
