import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/user_secure_storage.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/elderly_profile.dart';
import 'package:health_application/ui/user_profile/volunteer_profile.dart';

import '../register_profile/bloc/register_profile_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserProfileBloc>().add(GetUserProfile());
    return BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) async {
      if (state.logoutStatus == LogoutStatus.success) {
        await UserSecureStorage().clearSession();
        context.go(Routes.root);
      } else if (state.logoutStatus == LogoutStatus.fail) {
        final bool acceptClose = await showDialog(
            context: context,
            builder: (BuildContext context) => ErrorAlertWidget(
                  title: 'ไม่สำเร็จ!',
                  subTitle: "ล็อกเอ้าท์ไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                  btnName: 'ตกลง',
                )) as bool;
      }
    }, builder: (BuildContext context, UserProfileState state) {
      if (state.userProfile.role == RoleType.ROLE_USER_ELDERLY.name) {
        return ElderProfileWidget(state: state);
      } else {
        return VolunteerProfileWidget(
          state: state,
        );
      }
    });
  }
}
