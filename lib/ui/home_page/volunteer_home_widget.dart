import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/extension/date_extension.dart';
import 'package:health_application/ui/home_page/component/appointment_item.dart';
import 'package:health_application/ui/home_page/component/volunteer_menu.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class VolunteerHomeWidget extends StatelessWidget {
  const VolunteerHomeWidget({super.key});

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
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
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

                      SizedBox(height: 18,),

                      Container(
                        padding: EdgeInsets.fromLTRB(16, 12, 16, 10),
                        decoration: BoxDecoration(
                          color: Colors.black.withAlpha(51),
                          borderRadius: BorderRadius.circular(8)
                        ),
                        child: Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                    color: ColorTheme().white
                                  ),
                                )
                              ),
                              GestureDetector(
                                onTap: (){},
                                child: Image.asset('assets/images/volunteer_chevron_right.png', width: 20, height: 20)
                              )
                              // textSubtitle1('3000 ถ.พหลโยธิน แขวง จอมพล เขตจตุจักร ', ColorTheme().white)
                            ],
                          ),
                        )
                      )
                    ],
                  )
                ),
              ),
              Container(
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
                        children: [
                          Expanded(
                            child: VolunteerMenu(
                              title: 'รายการอาหาร',
                              image: 'assets/images/volunteer_food_bg.png',
                            )
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: VolunteerMenu(
                              title: 'การออกกำลังกาย',
                              image: 'assets/images/volunteer_exercise_bg.png',
                            )
                          )
                        ],
                      ),
                      
                      const SizedBox(
                        height: 10,
                      ),
                      VolunteerMenu(title: 'ค้นหาข้อมูลผู้สูงอายุ', image: 'assets/images/volunteer_elder_bg.png'),
                      const SizedBox(
                        height: 20,
                      ),
                      if (true)
                        Column(
                          children: [
                            // AppointDetailCard(),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      textSubtitle18Blod('การนัดหมาย', ColorTheme().black87),
                      const SizedBox(
                        height: 10,
                      ),
                      AppointmentItem(appointment: Appointment()),
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
              )
            ]),
          ),
        ],
      ),
    );
  }
}