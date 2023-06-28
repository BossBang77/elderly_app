import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/log_out_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/elderly_setting/elderly_setting_page.dart';
import 'package:health_application/ui/elderly/health_profile/health_profile_page.dart';
import 'package:health_application/ui/elderly/qr_code_elderly/qr_code_elderly_page.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/component/card_list_menu.dart';
import 'package:health_application/ui/user_profile/profile_information/elderly_prfile_information_view.dart';
import 'package:health_application/ui/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';

import '../base/constant/gender_const.dart';

class ElderProfileWidget extends StatelessWidget {
  const ElderProfileWidget({super.key, required this.state});
  final UserProfileState state;

  @override
  Widget build(BuildContext context) {
    RegisterModel user = state.userProfile;
    return Scaffold(
      appBar: appBar(
          showBackbutton: false,
          title: 'โปรไฟล์',
          onBack: () {},
          suffixAction: InkWell(
            onTap: () async {
              String uuid = await UserSecureStorage().getUID();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => QrCodeElderlyPage(
                        uuid: uuid,
                      )));
            },
            child: Image.asset(
              'assets/images/qr_code_scan.png',
              scale: 3.5,
            ),
          )),
      body: Padding(
        padding: EdgeInsets.only(top: 20, left: 15, right: 15, bottom: 90),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/${Gender.isWoman(user.profile.gender) ? 'woman' : 'man'}_active.png',
                  scale: 4,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle16Blod(user.profile.name, color.black87),
              textCaption1(
                  '${Gender.mapToTitle(user.profile.gender)}, อายุ ${user.profile.age} ปี',
                  color.greyText),
              const SizedBox(
                height: 20,
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/person_profile_icon.png',
                onClick: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          ElderlyProfileInformationView(state: state),
                    ),
                  );
                },
                title: 'ข้อมูลส่วนตัว',
                sufficTxt: 'ยังไม่ยืนยัน',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/health_profile_icon.png',
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HealthProfilePage(
                            profile: user,
                          )));
                },
                title: 'ข้อมูลสุขภาพ',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/history_profile_icon.png',
                onClick: () {
                  context.go(
                    Routes.elderlyHistory,
                  );
                },
                title: 'ประวัติการบันทึกข้อมูล',
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
                onClick: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ElderlySettingPage(
                            profile: user,
                          )));
                },
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
                      context
                          .read<UserProfileBloc>()
                          .add(UserProfileLoggedOut());
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
