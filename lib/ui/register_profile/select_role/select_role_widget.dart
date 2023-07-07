import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/component/role_card.dart';
import 'package:health_application/ui/signIn_page/signIn_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import '../../base/routes.dart';

class SelectRoleWidget extends StatelessWidget {
  const SelectRoleWidget({super.key, required this.state});
  final RegisterProfileState state;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTheme().white,
      appBar: appBar(onBack: () {
        context.pop();
      }),
      body: Padding(
        padding: EdgeInsets.fromLTRB(15, 0, 15, 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(children: [
              const SizedBox(
                height: 30,
              ),
              Center(child: textSubtitle24('ฉันคือ...', ColorTheme().black87)),
              const SizedBox(
                height: 20,
              ),
              textButton1('เลือกสิทธิการใช้งานของคุณ', ColorTheme().black87),
              const SizedBox(
                height: 40,
              ),
              roleCard(context,
                  title: 'ผู้สูงอายุ',
                  subTitle: 'ผู้รับการดูแลจากเจ้าหน้าที่',
                  imgPath: 'assets/images/role_icon.png',
                  isSelect: state.roleType == RoleType.ROLE_USER_ELDERLY,
                  onTap: () {
                context
                    .read<RegisterProfileBloc>()
                    .add(SelectRole(roleType: RoleType.ROLE_USER_ELDERLY));
              }),
              const SizedBox(
                height: 20,
              ),
              roleCard(context,
                  title: 'จิตอาสา',
                  subTitle: 'เจ้าหน้าที่ดูแลผู้สูงอายุ',
                  imgPath: 'assets/images/role_icon.png',
                  isSelect: state.roleType == RoleType.ROLE_USER_VOLUNTEER,
                  onTap: () {
                context
                    .read<RegisterProfileBloc>()
                    .add(SelectRole(roleType: RoleType.ROLE_USER_VOLUNTEER));
              })
            ]),
            ButtonGradient(
              btnName: 'ยืนยัน',
              onClick: () {
                if (state.roleType != RoleType.initial)
                  context.read<RegisterProfileBloc>().add(FormFillType(
                        type: FillType.role,
                        value: state.roleType.name,
                      ));
                context.read<RegisterProfileBloc>().add(
                    ChangeProfileView(profileType: ProfileType.privacyProfile));
              },
            ),
          ],
        ),
      ),
    );
  }
}
