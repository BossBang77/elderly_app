import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/elderly/elderly_setting/bloc/elderly_setting_bloc.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';

import '../../base/routes.dart';
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
      create: (context) => ElderlySettingBloc()..add(GetVersionApp()),
      child: BlocConsumer<ElderlySettingBloc, ElderlySettingState>(
        listener: (BuildContext context, ElderlySettingState state) async {
          if (state.deleteStatus == DeleteStatus.success) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext _) => SuccessDialog(
                      header: "สำเร็จ!",
                      subtitle: 'ลบข้อมูลสำเร็จ',
                      buttonName: 'ตกลง',
                      onTap: () {},
                    ));

            if (acceptClose) {
              context.read<ElderlySettingBloc>().add(ResetDeleteStatus());
              context.go(Routes.root);
            }
          }

          if (state.deleteStatus == DeleteStatus.fail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle: "ลบข้อมูลไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<ElderlySettingBloc>().add(ResetDeleteStatus());
            }
          }
        },
        builder: (BuildContext context, ElderlySettingState state) {
          return Stack(
            children: [
              initialWidget(context, state),
              if (state.isLoading) Loader()
            ],
          );
        },
      ),
    );
  }
}
