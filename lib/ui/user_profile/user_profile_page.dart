import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/elderly_profile.dart';
import 'package:health_application/ui/user_profile/volunteer_profile.dart';

import '../register_profile/bloc/register_profile_bloc.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) async {},
        builder: (BuildContext context, UserProfileState state) {
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
