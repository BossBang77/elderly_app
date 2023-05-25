import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/register_profile/bloc/register_profile_bloc.dart';
import 'package:health_application/ui/register_profile/bmi_profile/bmi_widget.dart';

import 'privacy_profile/privacy_profile.dart';
import 'select_role/select_role_widget.dart';

class RegisterProfilePage extends StatelessWidget {
  const RegisterProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegisterProfileBloc>(
      create: (_) => RegisterProfileBloc(),
      child: BlocConsumer<RegisterProfileBloc, RegisterProfileState>(
          listener: (context, state) {},
          builder: (BuildContext context, RegisterProfileState state) {
            var profileType = state.profileType;
            if (profileType == ProfileType.role) {
              return SelectRoleWidget(state: state);
            } else if (profileType == ProfileType.privacyProfile) {
              return PrivacyProfile();
            } else if (profileType == ProfileType.bmiProfile) {
              return BMIWidget(state: state);
            } else {
              return Container();
            }
          }),
    );
  }
}
