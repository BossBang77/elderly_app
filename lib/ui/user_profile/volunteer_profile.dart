import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/base/dialog/log_out_dialog.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/component/card_list_menu.dart';
import 'package:health_application/ui/welcome_page/welcome_page.dart';

class VolunteerProfileWidget extends StatelessWidget {
  const VolunteerProfileWidget({super.key, required this.state});
  final UserProfileState state;

  @override
  Widget build(BuildContext context) {
    RegisterModel user = state.userProfile;
    return Scaffold(
      appBar: appBar(showBackbutton: false, title: 'โปรไฟล์', onBack: () {}),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 90),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              CircleAvatar(
                backgroundImage: ExactAssetImage(
                    'assets/images/example_volunteer2.png',
                    scale: 3),
                radius: 50,
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle16Blod(user.profile.name, color.black87),
              textCaption1('จิตอาสา(9045)', color.greyText),
              const SizedBox(
                height: 20,
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/person_profile_icon.png',
                onClick: () {},
                title: 'ข้อมูลส่วนตัว',
              ),
              CardListMenu(
                img:
                    'assets/images/profile_menu_icon/take_care_profile_icon.png',
                onClick: () {},
                title: 'ข้อมูลจิตอาสา',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/star_profile_icon.png',
                onClick: () {},
                title: 'รีวิวจากผู้ใช้งาน',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/home_profile_icon.png',
                onClick: () {},
                title: 'ที่อยู่ของคุณ',
              ),
              CardListMenu(
                img:
                    'assets/images/profile_menu_icon/reset_pass_profile_icon.png',
                onClick: () {},
                title: 'เปลี่ยนรหัสผ่าน',
              ),
              CardListMenu(
                img:
                    'assets/images/profile_menu_icon/notofication_profile_icon.png',
                onClick: () {},
                title: 'การแจ้งเตือน',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/setting_profile_icon.png',
                onClick: () {},
                title: 'การตั้งค่า',
              ),
              InkWell(
                  onTap: () async {
                    bool res = await showDialog(
                        context: context,
                        builder: (BuildContext _) => LogoutDialog(
                            header: 'ออกจากระบบ',
                            subtitle: 'คุณต้องการออกจากระบบ\nใช่หรือไม่'));

                    if (res) {
                      await UserSecureStorage().clearSession();
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) => WelcomePage()),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: textSubtitle16Blod('ออกจากระบบ', color.Error)),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
