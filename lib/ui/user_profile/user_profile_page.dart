import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/user_profile/bloc/user_profile_bloc.dart';
import 'package:health_application/ui/user_profile/elderly_profile.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserProfileBloc, UserProfileState>(
        listener: (context, state) async {},
        builder: (BuildContext context, UserProfileState state) {
          return ElderProfileWidget(state: state);
        });
  }
}
