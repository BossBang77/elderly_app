import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/widget/button_dark_bule.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/home_page/component/menu_card.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

import '../base/liquid_linear_grap/liquid_linear_grap.dart';
import 'bloc/home_page_bloc.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
              Positioned(
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
                            true
                                ? 'assets/images/profile_man.png'
                                : 'assets/images/profile_woman.png',
                            fit: BoxFit.cover,
                            width: 60,
                            height: 60,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              textSubtitle24(
                                  'สวัสดี, นางทองใบ', ColorTheme().white),
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
              ),
              Container(
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
                                        textSubtitle16Blod(
                                            'รับประทาน ', ColorTheme().black87),
                                        Row(
                                          children: [
                                            textSubtitle24(
                                                '0', ColorTheme().Primary),
                                            textSubtitle18Blod(
                                                ' kcal', ColorTheme().black87),
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
                                                '0', ColorTheme().Primary),
                                            textSubtitle18Blod(
                                                ' kcal', ColorTheme().black87),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        textSubtitle16Blod(
                                            'วันนี้คุณยังรับประทานได้อีก',
                                            ColorTheme().black87),
                                      ],
                                    ),
                                    textSubtitle24(
                                        '1050 kcal', ColorTheme().Primary),
                                    Container(
                                        height: 20,
                                        child: Stack(
                                          children: [
                                            LiquidLinearProgressIndicator(
                                              value: 0.5, // TODO
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
                                              alignment: Alignment.centerRight,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 8),
                                                child: textOverline2(
                                                    '1050 kcal',
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
                                    onClick: () {},
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
                      textSubtitle18Blod('บันทึกกิจกรรม', ColorTheme().black87),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              menuCard(
                                context,
                                background: 'assets/images/food.png',
                                title: 'อาหาร',
                                onClick: () {},
                                subTitle: 'บันทึกมื้ออาหาร',
                                icon: 'assets/images/food_icon.png',
                              ),
                              menuCard(
                                context,
                                background: 'assets/images/exercise.png',
                                title: 'ออกกำลังกาย',
                                onClick: () {},
                                subTitle: 'บันทึกการ\nออกกำลังกาย',
                                icon: 'assets/images/exercise_icon.png',
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
                              menuCard(
                                context,
                                background: 'assets/images/water_intake.png',
                                title: 'ดื่มน้ำ',
                                onClick: () {
                                  context.read<HomePageBloc>().add(
                                      ChangeMenu(menus: menuType.drinkingPage));
                                },
                                subTitle: 'บันทึกการดื่มน้ำ',
                                icon: 'assets/images/water_intake_icon.png',
                              ),
                              menuCard(
                                context,
                                background: 'assets/images/medicine.png',
                                title: 'ยาประจำตัว',
                                onClick: () {},
                                subTitle: 'ตั้งค่าแจ้งเตือน\nการทานยา',
                                icon: 'assets/images/medicine_icon.png',
                              ),
                            ]),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      menuCard(
                        context,
                        background: 'assets/images/sos.png',
                        title: 'ดื่มน้ำ',
                        onClick: () {},
                        subTitle: 'บันทึกการดื่มน้ำ',
                        icon: 'assets/images/sos_icon.png',
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
