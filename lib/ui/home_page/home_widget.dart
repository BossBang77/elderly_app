import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/appoint_detail_card/appoint_detail_card.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/button_dark_bule.dart';
import 'package:health_application/ui/base/widget/space_widget.dart';
import 'package:health_application/ui/elderly/personal_medication/personal_medication_page.dart';
import 'package:health_application/ui/elderly/request_assistance/request_assistance_page.dart';
import 'package:health_application/ui/elderly/search_volunteer/volunteer_page.dart';
import 'package:health_application/ui/elderly/food/food_page.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/home_page/component/menu_card.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:provider/provider.dart';

import '../base/constant/gender_const.dart';
import '../base/liquid_linear_grap/liquid_linear_grap.dart';
import 'bloc/home_page_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().fetchTDEEData();
    return Scaffold(
      backgroundColor: ColorTheme().BackgroundWhite,
      body: Column(
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
                  listener: (context, state) async {},
                  builder: (BuildContext context, UserProfileState state) {
                    var userProfile = state.userProfile;
                    return Positioned(
                      top: 90,
                      left: 20,
                      right: 20,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/${Gender.isWoman(userProfile.profile.gender) ? 'woman' : 'man'}_active.png',
                                  fit: BoxFit.cover,
                                  width: 60,
                                  height: 60,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
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
                      ),
                    );
                  }),
              BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                double getValueCal(
                    {double eatingCalorieLimit = 0,
                    double eatingCalorieRemaining = 0,
                    double eatingCalorieAchievable = 0}) {
                  if (eatingCalorieAchievable != 0 && eatingCalorieLimit != 0) {
                    return eatingCalorieAchievable / eatingCalorieLimit;
                  } else {
                    return 0.0;
                  }
                }

                double calValue = getValueCal(
                    eatingCalorieAchievable:
                        state.tdeeModel.eatingCalorieAchievable,
                    eatingCalorieLimit: state.tdeeModel.eatingCalorieLimit,
                    eatingCalorieRemaining:
                        state.tdeeModel.eatingCalorieRemaining);

                return Container(
                  margin: EdgeInsets.only(top: 160),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Card(
                          color: Colors.transparent,
                          elevation: 10,
                          shadowColor: ColorTheme().grey10,
                          child: Column(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: ColorTheme().white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15))),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: ColorTheme()
                                          .BlueFade2
                                          .withOpacity(0.09),
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15))),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/eat.png',
                                            scale: 3,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          textSubtitle16Blod('รับประทาน ',
                                              ColorTheme().black87),
                                          Row(
                                            children: [
                                              textSubtitle24(
                                                  (state.tdeeModel
                                                              .eatingCalorieLimit -
                                                          state.tdeeModel
                                                              .eatingCalorieRemaining)
                                                      .floor()
                                                      .toString(),
                                                  ColorTheme().Primary),
                                              textSubtitle18Blod(' kcal',
                                                  ColorTheme().black87),
                                            ],
                                          )
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/burn.png',
                                            scale: 3,
                                          ),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          textSubtitle16Blod(
                                              'เผาผลาญ ', ColorTheme().black87),
                                          Row(
                                            children: [
                                              textSubtitle24(
                                                  state.tdeeModel.burnCalorie
                                                      .floor()
                                                      .toString(),
                                                  ColorTheme().Primary),
                                              textSubtitle18Blod(' kcal',
                                                  ColorTheme().black87),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.all(15),
                                  decoration: BoxDecoration(
                                      color: ColorTheme().white,
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(15),
                                          bottomRight: Radius.circular(15))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          textSubtitle16Blod(
                                              'วันนี้คุณยังรับประทานได้อีก',
                                              ColorTheme().black87),
                                        ],
                                      ),
                                      textSubtitle24(
                                          state.tdeeModel.eatingCalorieRemaining
                                                  .floor()
                                                  .toString() +
                                              ' kcal',
                                          ColorTheme().Primary),
                                      Container(
                                          height: 20,
                                          child: Stack(
                                            children: [
                                              LiquidLinearProgressIndicator(
                                                value: calValue,
                                                valueColor:
                                                    AlwaysStoppedAnimation(
                                                        ColorTheme().Primary),
                                                backgroundColor: Colors.white,
                                                borderColor:
                                                    ColorTheme().BlueBackGround,
                                                borderWidth:
                                                    MediaQuery.of(context)
                                                        .size
                                                        .width,
                                                borderRadius: 12.0,
                                                direction: Axis.horizontal,
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: textOverline2(
                                                      '${(state.tdeeModel.eatingCalorieLimit - state.tdeeModel.eatingCalorieRemaining).toString()} kcal',
                                                      ColorTheme()
                                                          .Primary
                                                          .withOpacity(0.6)),
                                                ),
                                              ),
                                            ],
                                          ))
                                    ],
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: ColorTheme().white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              )),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: ColorTheme().BlueBackGround,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(15),
                                )),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textSubtitle16Blod('หาจิตอาสามาดูแลคุณ',
                                        ColorTheme().black87),
                                    ButtonDatkBule(
                                      btnName: 'หาจิตอาสา',
                                      onClick: () async {
                                        String uid =
                                            await UserSecureStorage().getUID();
                                        context.go(Routes.volunteerPage,
                                            extra: [uid, false]);
                                      },
                                    )
                                  ],
                                ),
                                Image.asset(
                                  'assets/images/welcome_pic.png',
                                  scale: 8,
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        if (true)
                          Column(
                            children: [
                              AppointDetailCard(),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        textSubtitle18Blod(
                            'บันทึกกิจกรรม', ColorTheme().black87),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: menuCard(
                                    context,
                                    background: 'assets/images/food.png',
                                    title: 'อาหาร',
                                    onClick: () {
                                      context.read<HomePageBloc>().add(
                                          ChangeMenu(menus: menuType.foodPage));
                                    },
                                    subTitle: 'บันทึกมื้ออาหาร',
                                    icon: 'assets/images/food_icon.png',
                                  ),
                                ),
                                SpaceWidget(
                                  width: 10,
                                ),
                                Expanded(
                                  child: menuCard(
                                    context,
                                    background: 'assets/images/exercise.png',
                                    title: 'ออกกำลังกาย',
                                    onClick: () {
                                      context.read<HomePageBloc>().add(
                                          ChangeMenu(
                                              menus: menuType.exercisePage));
                                    },
                                    subTitle: 'บันทึกการ\nออกกำลังกาย',
                                    icon: 'assets/images/exercise_icon.png',
                                  ),
                                )
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.transparent,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: menuCard(
                                    context,
                                    background:
                                        'assets/images/water_intake.png',
                                    title: 'ดื่มน้ำ',
                                    onClick: () {
                                      context.read<HomePageBloc>().add(
                                          ChangeMenu(
                                              menus: menuType.drinkingPage));
                                    },
                                    subTitle: 'บันทึกการดื่มน้ำ',
                                    icon: 'assets/images/water_intake_icon.png',
                                  ),
                                ),
                                SpaceWidget(
                                  width: 10,
                                ),
                                Expanded(
                                  child: menuCard(
                                    context,
                                    background: 'assets/images/medicine.png',
                                    title: 'ยาประจำตัว',
                                    onClick: () {
                                      context.go(Routes.personalMedication);
                                    },
                                    subTitle: 'ตั้งค่าแจ้งเตือน\nการทานยา',
                                    icon: 'assets/images/medicine_icon.png',
                                  ),
                                ),
                              ]),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: menuCard(
                                context,
                                background: 'assets/images/sos.png',
                                title: 'ฉุกเฉิน',
                                onClick: () {
                                  context.push(Routes.requestAssitance);
                                },
                                subTitle: 'ขอความช่วยเหลือ',
                                icon: 'assets/images/sos_icon.png',
                              ),
                            ),
                            SpaceWidget(
                              width: 10,
                            ),
                            Expanded(child: Container())
                          ],
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ]),
          ),
        ],
      ),
    );
  }
}
