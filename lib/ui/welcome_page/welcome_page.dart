import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food_detail/food_detail_page.dart';
import 'package:health_application/ui/elderly/food_log/food_log_page.dart';
import 'package:health_application/ui/register_profile/register_profile_page.dart';
import 'package:health_application/ui/signIn_page/login/login_page.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../signIn_page/signIn_widget.dart';

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

              /// TODO real text
              textSubtitle2(
                  'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Elit, ipsum sed diam amet, dui\n vitae libero viverra.',
                  ColorTheme().black87,
                  true),
              const SizedBox(
                height: 50,
              ),
              ButtonGradient(
                btnName: 'เริ่มต้นใช้งาน',
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RegisterProfilePage()));
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ButtonBlueFade(
                btnName: 'เข้าสู่ระบบ',
                onClick: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignInPage()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
