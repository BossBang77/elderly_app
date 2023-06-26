import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/date_time_picker/date_time_picker.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/register_profile/volunteer/bloc/volunteer_register_bloc.dart';
import 'package:health_application/ui/register_profile/volunteer/views/personal_information/gender_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/profile_information/view/phonenumber_submission_widget.dart';
import 'package:health_application/ui/user_profile/profile_information/view/request_otp_page.dart';

class ElderlyProfileInformationView extends StatelessWidget {
  const ElderlyProfileInformationView({required this.state});
  final UserProfileState state;

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(onBack: (){
        Navigator.of(context).pop();
      }),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width - 32,
                            height: (MediaQuery.of(context).size.width - 32) * (9 / 16),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: ColorTheme().grey50,
                              image: DecorationImage(
                                image: AssetImage('')
                              )
                            ),
                          ),

                          Positioned(
                            top: 12,
                            right: 12,
                            child: GestureDetector(
                              onTap: () {

                              },
                              child: Container(
                                height: 32,
                                padding: EdgeInsets.only(left: 12, right: 12),
                                decoration: BoxDecoration(
                                  color: Colors.white.withAlpha(100),
                                  borderRadius: BorderRadius.circular(32)
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset('assets/images/camera_icon.png', width: 16, height: 16),
                                    SizedBox(width: 8,),
                                    textH7('แก้ไข', ColorTheme().black87)
                                  ],
                                ),
                              )
                            )
                          )
                        ]
                      ),
                      const SizedBox(
                        height: 32,
                      ),

                      textSubtitle18Blod(
                          'ข้อมูลส่วนตัว', ColorTheme().black87),
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle18Blod(
                          'ชื่อ- นามสกุล', ColorTheme().black87),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFieldWidget.disable(
                        text: state.userProfile.profile.name,
                        hintText: 'ชื่อ- นามสกุล',
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle18Blod(
                          'เบอร์มือถือของคุณ', ColorTheme().black87),
                      TextFieldWidget.readOnly(
                        text: state.userProfile.profile.name,
                        hintText: 'เบอร์มือถือของคุณ',
                        suffix: true,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            print("TAP");
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:(context) => RequestOtpPage(),
                                settings: RouteSettings(name: 'ElderlyProfileInformationView')
                              )
                            );
                          },
                          child: Container(
                            width: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('assets/images/edit_enable.png', width: 18, height: 18,),
                                SizedBox(width: 6,),
                                textSubtitle1('text', ColorTheme().blueText)
                              ]),
                          )
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                  
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          textSubtitle18Blod(
                          'หน่วยงานที่ดูแล', ColorTheme().black87),
                          textSubtitle18Blod(
                          'ยังไม่ยืนยัน', ColorTheme().DarkRed),
                        ]
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      textSubtitle18Blod(
                          'รหัสหน่วยงาน', ColorTheme().black87),
                      TextFieldWidget.enable(
                        text: '',
                        hintText: 'ตัวเลข 4 ตัว',
                        prefix: true,
                        prefixTxt: null,
                        imagePathPrefix: 'assets/images/search_icon.png',
                        maxLength: 100,
                        onChanged: (value) {
                          
                        },
                      ),

                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Image.asset('assets/images/info.png', width: 24, height: 24),
                          SizedBox(width: 24),
                          textSubtitle2(
                          'ข้อมูลเครือข่าย', ColorTheme().black87, false),
                        ],
                      ),
                      const SizedBox(
                        height: 12
                      ),
                      Row(
                        children: [
                          SizedBox(width: 48),
                          textSubtitle2(
                          '', ColorTheme().black87, false),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              // Spacer(),
              const SizedBox(
                height: 40,
              ),
              ButtonGradient(
                btnName: 'บันทึก',
                onClick: () {

                },
              ),
            ],
          )
        )
      ),
    );
  }
}