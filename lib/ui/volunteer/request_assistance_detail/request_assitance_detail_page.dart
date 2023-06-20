import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_red.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/widget/button_gradient.dart';
import '../../ui-extensions/color.dart';

class RequestAssitanceDetailPage extends StatelessWidget {
  const RequestAssitanceDetailPage({super.key});

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
                        textH6('ขอความช่วยเหลือฉุกเฉิน', color.black87, false),
                        textH7('ระยะทาง 2.4 กม. (28 นาที)', color.black87),
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textSubtitle16Blod(
                                    'นายสมบัติ สุวรรณโชติ', color.black87),
                                Container(
                                  width: sized.width * 0.7,
                                  child: textButton1(
                                      'เพศชาย, 85 ปี', color.greyText,
                                      maxLines: 3),
                                ),
                                const SizedBox(
                                  height: 10,
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
                        //TODO
                      },
                      child: textButton1('ดูข้อมูลเพิ่มเติม', color.blueText,
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
                            textSubtitle16Blod('ตำแหน่ง :', color.black87),
                            Container(
                              width: sized.width * 0.7,
                              child: textButton1(
                                  '89 ถนนสาทรเหนือ แขวงยานนาวาเขตสาทร จังหวัดกรุงเทพฯ 10120',
                                  color.black87,
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
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: ButtonRed(
                      btnName: 'นำทางไปที่หมาย',
                      onClick: () async {
                        //TODO
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
        )
      ]),
    );
  }
}
