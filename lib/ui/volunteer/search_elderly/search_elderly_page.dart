import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/model/elderly_profile_model.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/volunteer/search_elderly/component/elder_detail.dart';

import '../../elderly/water_intake/component/piechart_water_intake.dart';
import '../../ui-extensions/color.dart';

class ElderlySearchDetailPage extends StatelessWidget {
  const ElderlySearchDetailPage({super.key, required this.elderlyProfile});

  final ElderlyProfileModel elderlyProfile;

  @override
  Widget build(BuildContext context) {
    bool showhealth = false;
    bool showWater = false;
    bool showDrug = false;
    List<String> congenitalDisease =
        elderlyProfile.congenitalDisease.map((el) => el.name).toList();
    List<String> foodAllergy =
        elderlyProfile.allergicFoods.map((el) => el.name).toList();
    var medicine = elderlyProfile.personalMedication;
    var drinkingWater = elderlyProfile.drinkingWater;
    return Scaffold(
      backgroundColor: color.whiteBackground,
      appBar: appBar(
          onBack: () {
            context.go(Routes.home);
          },
          title: 'ข้อมูลผู้สูงอายุ'),
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                elderlyProfile.profile.gender == SexType.FEMALE.name
                    ? 'assets/images/woman_active.png'
                    : 'assets/images/man_active.png',
                scale: 4,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textSubtitle16Blod('${elderlyProfile.profile.name}', color.black87),
            textSubtitle16W500(
                '${elderlyProfile.profile.gender == SexType.FEMALE.name ? 'เพศหญิง' : 'เพศชาย'}, อายุ ${elderlyProfile.profile.age} ปี',
                color.greyText),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.all(30),
              decoration: StyleBorder().greyDecoration(isBorder: false),
              child: IntrinsicHeight(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          textSubtitle16W500('น้ำหนัก', color.greyText),
                          const SizedBox(
                            height: 5,
                          ),
                          textSubtitle16Blod(
                              '${elderlyProfile.profile.weight} กิโลกรัม',
                              color.black87),
                        ],
                      ),
                      VerticalDivider(
                        color: ColorTheme().GreyBackGround,
                        thickness: 1.5,
                      ),
                      Column(
                        children: [
                          textSubtitle16W500('ส่วนสูง', color.greyText),
                          const SizedBox(
                            height: 5,
                          ),
                          textSubtitle16Blod(
                              '${elderlyProfile.profile.height} เซนติเมตร',
                              color.black87),
                        ],
                      )
                    ]),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            StatefulBuilder(
              builder: (BuildContext context, setState) {
                return Column(
                  children: [
                    sectionExpand(
                        onClick: () {
                          setState(
                            () {
                              showhealth = !showhealth;
                            },
                          );
                        },
                        img: 'assets/images/elderly_detail_health.png',
                        title: 'ข้อมูลสุขภาพ',
                        isExpand: showhealth,
                        child: Column(
                          children: [
                            carddetail(
                                img: 'assets/images/board_blue.png',
                                title: 'โรคประจำตัว',
                                detail: congenitalDisease.join(', ')),
                            const SizedBox(
                              height: 10,
                            ),
                            carddetail(
                                img: 'assets/images/board_blue.png',
                                title: 'การแพ้อาหาร',
                                detail: foodAllergy.join(', ')),
                            const SizedBox(
                              height: 10,
                            ),
                            carddetail(
                                img:
                                    'assets/images/elderly_detail_exercise.png',
                                title: 'การออกกำลังกาย',
                                detail:
                                    'ออกกำลังกาย หรือเล่นกีฬา แบบเบาๆ 1-3 วันต่อสัปดาห์')
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    sectionExpand(
                        onClick: () {
                          setState(
                            () {
                              showWater = !showWater;
                            },
                          );
                        },
                        img: 'assets/images/elderly_detail_water.png',
                        title: 'ข้อมูลการดื่มน้ำ',
                        isExpand: showWater,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            WaterIntakeChart(
                                total: drinkingWater.target.toDouble(),
                                isDrink: drinkingWater.achievable.toDouble(),
                                left: MediaQuery.of(context).size.width / 2.8),
                            const SizedBox(
                              height: 30,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: IntrinsicHeight(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      children: [
                                        Column(
                                          children: [
                                            textSubtitle2('เป้าหมาย',
                                                ColorTheme().greyText, true),
                                            textBody1(
                                                '${drinkingWater.target} มล.',
                                                ColorTheme().black87)
                                          ],
                                        )
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: ColorTheme().GreyBackGround,
                                      thickness: 1,
                                    ),
                                    Column(
                                      children: [
                                        textSubtitle2('ปริมาณที่เหลือ',
                                            ColorTheme().greyText, true),
                                        textBody1(
                                            '${drinkingWater.remaining} มล.',
                                            ColorTheme().black87)
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    sectionExpand(
                        onClick: () {
                          setState(
                            () {
                              showDrug = !showDrug;
                            },
                          );
                        },
                        img: 'assets/images/elderly_detail_drug.png',
                        title: 'ยาประจำตัว',
                        isExpand: showDrug,
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            for (var medic in medicine)
                              drugCard(
                                  img: 'assets/images/pill.png',
                                  nameDrug: medic.name,
                                  qtyDrug: '1/4 เม็ด',
                                  time: 'ก่อนอาหาร เช้า กลางวัน เย็น')
                          ],
                        ))
                  ],
                );
              },
            ),
            const SizedBox(
              height: 40,
            ),
          ]),
        ),
      ),
    );
  }
}
