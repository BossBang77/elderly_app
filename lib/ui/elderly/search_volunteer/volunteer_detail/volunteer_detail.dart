import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/linear_percent_indicator/linear_percent_indicator.dart';
import 'package:health_application/ui/base/widget/slider_widget.dart';
import 'package:health_application/ui/base/widget/star_rateing.dart';
import 'package:health_application/ui/elderly/search_volunteer/bloc/search_volunteer_bloc.dart';
import 'package:health_application/ui/elderly/search_volunteer/component/volunteer_information.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:provider/provider.dart';

class VolunteerDetailWidget extends StatelessWidget {
  const VolunteerDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sized.height,
        child: Stack(
          children: [
            Container(
                alignment: Alignment.topCenter,
                height: sized.height,
                child: Image.asset('assets/images/example_volunteer2.png')),
            Positioned(
              top: 50,
              left: 20,
              child: InkWell(
                onTap: () {
                  context
                      .read<SearchVolunteerBloc>()
                      .add(Changeview(view: SearchVolunteerView.searchResult));
                },
                child: CircleAvatar(
                  backgroundColor: color.whiteBackground.withOpacity(0.5),
                  child: Image.asset(
                    'assets/images/back_arrow.png',
                    scale: 4,
                  ),
                ),
              ),
            ),
            Positioned(
              top: sized.height * 0.3,
              height: sized.height * 0.7,
              child: Container(
                width: sized.width,
                padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                decoration: BoxDecoration(
                    color: color.whiteBackground,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle18Blod(
                          'นางบุญญาพร สุวรรณโชติ', ColorTheme().black87),
                      const SizedBox(
                        height: 5,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/icon_star_point.png',
                              scale: 4,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            textButton2('4.2 (34)', color.greyText),
                            const SizedBox(
                              width: 10,
                            ),
                            VerticalDivider(
                              color: ColorTheme().GreyBackGround,
                              thickness: 1,
                            ),
                            textButton2('5.4 กม. (28 น.)', color.greyText),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: color.GreyBorder),
                                    color: color.grey10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/woman_volunteer_black.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textCaption1('ผู้หญิง (34)', color.black87),
                                    textCaption2('เพศ/อายุ', Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: color.GreyBorder),
                                    color: color.grey10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/woman_volunteer_black.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textCaption1('3 ปี', color.black87),
                                    textCaption2('ประสบการณ์', Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(20),
                                decoration: BoxDecoration(
                                    border: Border.all(color: color.GreyBorder),
                                    color: color.grey10,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/woman_volunteer_black.png',
                                      scale: 4,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    textCaption1('28 ครั้ง', color.black87),
                                    textCaption2('สำเร็จ', Colors.grey),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textButton1('เกี่ยวกับจิตอาสา', color.black87),
                      const SizedBox(
                        height: 10,
                      ),
                      textH7(
                          'Lorem ipsum dolor sit amet consectetur. Pellentesque blandit viverra felis commodo eget. Et ut a sit turpis arcu vel. Dui blandit lacinia et ornare. Blandit convallis quis tristique laoreet tincidunt sollicitudin porttitor.',
                          color.black87),
                      const SizedBox(
                        height: 20,
                      ),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/volunteer_code_icon.png',
                          subTitle: '9045',
                          title: 'รหัสจิตอาสา'),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/elder_code_icon.png',
                          subTitle:
                              '2493 - ศูนย์บริการสาธารณสุข 20 บมจ. ธนาคารนครหลวงไทย \n\n 02-8749973',
                          title: 'เครือข่ายดูแลผู้สูงอายุ'),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/availability_icon.png',
                          subTitle: 'วันจันทร์-วันอาทิตย์\n08:00 น. -20:00 น.',
                          title: 'Availability'),
                      VolunteerInformation(context,
                          imgPath: 'assets/images/contact_icon.png',
                          subTitle:
                              '89 ถนนสาทรเหนือ แขวงยานนาวาเขตสาทร จังหวัดกรุงเทพฯ 10120. \n\n086-9868845',
                          title: 'ช่องทางติดต่อ'),
                      const SizedBox(
                        height: 20,
                      ),
                      textButton1('รีวิวจากผู้ใช้งาน', color.black87),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Column(
                              children: [
                                textButton1('4.8', color.black87),
                                textButton2('23 เรตติ้ง', color.greyText)
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Flexible(
                              flex: 4,
                              child: Column(
                                children: [
                                  RateingBar(context,
                                      barpercent: 0.7, starValue: 5),
                                  RateingBar(context,
                                      barpercent: 0.2, starValue: 4),
                                  RateingBar(context,
                                      barpercent: 0.2, starValue: 3),
                                  RateingBar(context,
                                      barpercent: 0.0, starValue: 2),
                                  RateingBar(context,
                                      barpercent: 0.0, starValue: 1)
                                ],
                              ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          for (int i = 4; i >= 0; i--)
                            Flexible(
                                child: Container(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: i == 0
                                        ? color.DartBlue
                                        : color.GreyBorder),
                                color: i == 0 ? color.DartBlue : color.grey10,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  textH7(
                                    (i + 1).toString(),
                                    i == 0 ? color.white : color.black87,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Image.asset(
                                    i == 0
                                        ? 'assets/images/star_white.png'
                                        : 'assets/images/star_outline.png',
                                    scale: 3,
                                    color: i == 0 ? color.white : null,
                                  ),
                                ],
                              ),
                            ))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      const SizedBox(
                        height: 20,
                      ),
                      for (int i = 0; i < 2; i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                textButton1('ปภาวดี ปัทมเดชา', color.black87),
                                textButton1('17 ม.ค. 65', color.greyText),
                              ],
                            ),
                            StarRate(context, 1),
                            textButton2(
                                'มีความรู้ดีมาก มีมารยาท เข้าใจผู้สูงอายุ',
                                color.greyText),
                            Divider(),
                          ],
                        ),
                      const SizedBox(
                        height: 60,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
