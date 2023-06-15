import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/dialog/accept_two_condition_dialog.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/home_page/home_page.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class AssitstanceDetailWidget extends StatelessWidget {
  const AssitstanceDetailWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var sized = MediaQuery.of(context).size;
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
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (Route<dynamic> route) => false);
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
                                    'นางสมศรี สุวรรณโชติ (หญิง, 76 ปี)',
                                    color.black87),
                                Container(
                                  width: sized.width * 0.7,
                                  child: textButton1(
                                      '3000 ถนนพหลโยธิน แขวงจอมพล เขตจตุจักร กรุงเทพมหานคร 10900',
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
                  for (int i = 0; i < 1; i++)
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Column(children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            false
                                ? CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        'https://storage.cloud.google.com/elderlyhealth-dev/master/food/Screenshot%202566-06-14%20at%2011.40.14.png',
                                        scale: 4),
                                    radius: 30,
                                  )
                                : CircleAvatar(
                                    backgroundImage: ExactAssetImage(
                                        'assets/images/img_notfound.png',
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
                                    'นางสาวพริมา ภูภาค (9045)', color.black87),
                                Container(
                                  width: sized.width * 0.7,
                                  child: textButton1(
                                      'ศูนย์บริการสาธารณสุข 16 ลุมพินี',
                                      color.greyText,
                                      maxLines: 3),
                                ),
                                Container(
                                  padding: EdgeInsets.all(7),
                                  decoration: BoxDecoration(
                                    color: color.emergency.withOpacity(0.2),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
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
                                textSubtitle16Blod('ตำแหน่ง :', color.black87),
                                Container(
                                  width: sized.width * 0.7,
                                  child: textButton1(
                                      '89 ถนนสาทรเหนือ แขวงยานนาวาเขตสาทร จังหวัดกรุงเทพฯ 10120',
                                      color.black87,
                                      maxLines: 3),
                                ),
                                textOverline2('ตระยะทาง 2.4 กม. (28 นาที)',
                                    color.greyText),
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
                                // TODO
                                target: LatLng(13.8134711, 100.5527565),
                                zoom: 15,
                              ),
                              compassEnabled: true,
                              tiltGesturesEnabled: false,
                              myLocationEnabled: true,
                              myLocationButtonEnabled: false,
                              mapType: MapType.normal,
                              // TODO
                              // markers: markers,
                              onTap: (LatLng latLng) {},
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
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => HomePage()),
                              (Route<dynamic> route) => false);
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
  }
}
