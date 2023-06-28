import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/elderly_setting/bloc/elderly_setting_bloc.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';

import 'view/elderly_summary_widget.dart';

class ElderlySettingPage extends StatelessWidget {
  const ElderlySettingPage({super.key, required this.profile});

  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
    Widget initialWidget(BuildContext context, ElderlySettingState state) {
      var view = state.pageView;
      switch (view) {
        case PageViewType.summary:
          return ElderlySumaryWidget();

        default:
          return Container();
      }
    }

    return BlocProvider(
      create: (context) => ElderlySettingBloc(),
      child: BlocConsumer<ElderlySettingBloc, ElderlySettingState>(
        listener: (BuildContext context, ElderlySettingState state) {
          // TODO: implement listener
        },
        builder: (BuildContext context, ElderlySettingState state) {
          return Stack(
            children: [initialWidget(context, state)],
          );
        },
      ),
    );
  }
}
