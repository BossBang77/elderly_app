import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme().white,
      body: Container(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 20),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/welcome_pic.png',
                scale: 4,
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle24('ยินดีต้อนรับ', ColorTheme().black87),
              const SizedBox(
                height: 10,
              ),
              textSubtitle2(
                  'แอพพลิเคชั่นสำหรับการดูแลผู้สูงอายุ \n ที่สามารถตั้งค่าการดูแลสุขภาพได้ \n เช่น บันทึกมื้ออาหาร, บันทึกการออกกำลังกาย, \n บันทึกการดื่มน้ำ  อีกทั้งยังสามารถนัดหมายจิตอาสา\nเพื่อมาดูแลผู้สูงอายุในเครือข่ายได้',
                  ColorTheme().black87,
                  true,
                  maxLine: 5),
              const SizedBox(
                height: 50,
              ),
              ButtonGradient(
                btnName: 'เริ่มต้นใช้งาน',
                onClick: () {
                  context.push(Routes.register);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonBlueFade(
                btnName: 'เข้าสู่ระบบ',
                onClick: () {
                  context.push(Routes.login);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
