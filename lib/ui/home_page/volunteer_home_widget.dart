import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_bloc.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_event.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_state.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail_page.dart';
import 'package:health_application/ui/elderly/exercise/bloc/exercise_bloc.dart';
import 'package:health_application/ui/elderly/exercise/exercise_widget.dart';
import 'package:health_application/ui/elderly/food_detail/food_detail_page.dart';
import 'package:health_application/ui/elderly/food_search/food_search_page.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/home_page/component/appointment_item.dart';
import 'package:health_application/ui/home_page/component/dialog/scan_error_dialog.dart';
import 'package:health_application/ui/home_page/component/volunteer_menu.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/volunteer/scan_qr/scan_qr_page.dart';
import 'package:health_application/ui/volunteer/search_elderly/search_elderly_page.dart';

import '../base/emergency_detail_card/emergency_detail_card.dart';
import '../base/routes.dart';
import '../elderly/exercise/exercise_page.dart';

class VolunteerHomeWidget extends StatelessWidget {
  const VolunteerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorTheme().BackgroundWhite,
        body: BlocProvider<AppointmentListBloc>(
          create: (context) =>
              AppointmentListBloc(AppointmentRepository.instance),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Image.asset(
                      'assets/images/background_home.png',
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  BlocConsumer<UserProfileBloc, UserProfileState>(
                    listener: (context, state) {},
                    builder: (BuildContext context, UserProfileState state) {
                      var userProfile = state.userProfile;
                      return Positioned(
                        top: 90,
                        left: 20,
                        right: 20,
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  1.8,
                                              child: textSubtitle24(
                                                  'สวัสดี, ${state.status == UserProfileStatus.success ? userProfile.profile.name : ''}',
                                                  ColorTheme().white),
                                            ),
                                            textSubtitle18Blod(
                                                'วันนี้, ${DateTime.now().toDisplayFullBuddishDate(locale: 'th')}',
                                                ColorTheme().white),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      true
                                          ? 'assets/images/notify_alert.png'
                                          : 'assets/images/notify.png',
                                      scale: 4,
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(16, 12, 16, 10),
                                  decoration: BoxDecoration(
                                      color: Colors.black.withAlpha(51),
                                      borderRadius: BorderRadius.circular(8)),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: Image.asset(
                                          'assets/images/home.png',
                                          width: 18,
                                          height: 18,
                                        ),
                                      ),
                                      SizedBox(width: 16),
                                      Expanded(
                                          child: Text(
                                        '3000 ถ.พหลโยธิน แขวง จอมพล เขตจตุจักร 3000 ถ.พหลโยธิน แขวง จอมพล เขตจตุจักร',
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontFamily: fontFamily,
                                            fontSize: 18.sp,
                                            color: ColorTheme().white),
                                      )),
                                      GestureDetector(
                                          onTap: () {},
                                          child: Image.asset(
                                              'assets/images/volunteer_chevron_right.png',
                                              width: 20,
                                              height: 20))
                                      // textSubtitle1('3000 ถ.พหลโยธิน แขวง จอมพล เขตจตุจักร ', ColorTheme().white)
                                    ],
                                  ),
                                )
                              ],
                            )),
                      );
                    },
                  ),
                  BlocBuilder<AppointmentListBloc, AppointmentListState>(
                    builder: (context, state) => Container(
                      margin: EdgeInsets.only(top: 222),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  VolunteerMenu(
                                    width:
                                        MediaQuery.of(context).size.width / 2.4,
                                    title: 'รายการอาหาร',
                                    image:
                                        'assets/images/volunteer_food_bg.png',
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  FoodSearchPage(
                                                    isToggleItemSelectable:
                                                        true,
                                                    onFoodSelected: (food) {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  FoodDetailPage(
                                                                      foodCode:
                                                                          food.code)));
                                                    },
                                                  )));
                                    },
                                  ),
                                  SizedBox(width: 20),
                                  VolunteerMenu(
                                    onTap: () {
                                      context.go(Routes.exerciseWidget);
                                      context
                                          .read<ExerciseBloc>()
                                          .add(Initial());
                                    },
                                    width:
                                        MediaQuery.of(context).size.width / 2.4,
                                    title: 'การออกกำลังกาย',
                                    image:
                                        'assets/images/volunteer_exercise_bg.png',
                                  ),
                                ]),
                            const SizedBox(
                              height: 10,
                            ),
                            VolunteerMenu(
                                onTap: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return ScanQrPage(onScan: (_) {});
                                      }).then((value) {});
                                },
                                width: MediaQuery.of(context).size.width,
                                title: 'ค้นหาข้อมูลผู้สูงอายุ',
                                image: 'assets/images/volunteer_elder_bg.png'),

                            const SizedBox(
                              height: 20,
                            ),

                            EmergencyDetailCard(),
                            SizedBox(height: 16),
                            Row(
                              children: [
                                textSubtitle1(
                                    'กานัดหมาย ', ColorTheme().black87),
                                (state.appointments.isEmpty)
                                    ? Container()
                                    : textSubtitle1(
                                        '(${state.appointments.length})',
                                        ColorTheme().black87)
                              ],
                            ),
                            SizedBox(height: 16),
                            (state.appointments.isEmpty)
                                ? Container(
                                    padding: EdgeInsets.only(top: 64),
                                    width: MediaQuery.of(context).size.width,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            'assets/images/appointment_empty.png',
                                            width: 42,
                                            height: 42),
                                        SizedBox(height: 42),
                                        textSubtitle1('ยังไม่มีการนัดหมาย',
                                            ColorTheme().grey50)
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: state.appointments
                                        .map((appointment) => Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 10),
                                            child: AppointmentItem(
                                              appointment: appointment,
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            AppointmentDetailPage(
                                                              appointment:
                                                                  appointment,
                                                            )));
                                              },
                                              onApply: () {
                                                context
                                                    .read<AppointmentListBloc>()
                                                    .add(AppointmentApproved(
                                                        appointmentId:
                                                            appointment.id));
                                              },
                                            )))
                                        .toList()),
                            // AppointmentItem(appointment: Appointment()),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const SizedBox(
                              height: 100,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
              ),
            ],
          ),
        ));
  }
}
