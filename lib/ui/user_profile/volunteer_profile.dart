import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/constant/gender_const.dart';
import 'package:health_application/ui/base/dialog/log_out_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/component/card_list_menu.dart';

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
              Center(
                child: user.profile.image.isNotEmpty
                    ? CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            NetworkImage(user.profile.image, scale: 4)..evict(),
                      )
                    : Image.asset(
                        Gender.isWoman(user.profile.gender)
                            ? 'assets/images/volunteer_woman.png'
                            : 'assets/images/volunteer_men.png',
                        scale: 15),
              ),
              const SizedBox(
                height: 20,
              ),
              textSubtitle16Blod(user.profile.name, color.black87),
              textCaption1(
                  'จิตอาสา(${user.volunteerCode.isNotEmpty ? user.volunteerCode : 'ไม่พบหมายเลขจิตอาสา'})',
                  color.greyText),
              const SizedBox(
                height: 20,
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/person_profile_icon.png',
                onClick: () {
                  context.push(Routes.elderlyProfileInformationView,
                      extra: state.userProfile);
                },
                title: 'ข้อมูลส่วนตัว',
              ),
              CardListMenu(
                img:
                    'assets/images/profile_menu_icon/take_care_profile_icon.png',
                onClick: () {
                  context.push(Routes.volunteerInformation,
                      extra: state.userProfile);
                },
                title: 'ข้อมูลจิตอาสา',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/home_profile_icon.png',
                onClick: () {
                  context.push(Routes.volunteerAddress,
                      extra: state.userProfile);
                },
                title: 'ที่อยู่ของคุณ',
              ),
              CardListMenu(
                img: 'assets/images/profile_menu_icon/star_profile_icon.png',
                onClick: () {},
                title: 'รีวิวจากผู้ใช้งาน',
              ),
              CardListMenu(
                img:
                    'assets/images/profile_menu_icon/reset_pass_profile_icon.png',
                onClick: () {
                  context.push(Routes.changePassword, extra: user);
                },
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
                  context.push(Routes.elderlySettingPage, extra: user);
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
