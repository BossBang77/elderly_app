import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/elderly_setting/bloc/elderly_setting_bloc.dart';
import 'package:health_application/ui/elderly/elderly_setting/view/dialog/delete_submit_dialog.dart';
import 'package:health_application/ui/elderly/health_profile/component/health_menu.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class ElderlySumaryWidget extends StatelessWidget {
  const ElderlySumaryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ElderlySettingBloc, ElderlySettingState>(
      listener: (context, state) {
        if (state.deleteStatus == DeleteStatus.fail) {
          // TODO: handle delete fail
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: color.white,
          appBar: appBar(
              onBack: () {
                Navigator.pop(context);
              },
              title: 'การตั้งค่า'),
          body: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              HealthMenu(
                title: 'เวอร์ชันปัจจุบัน',
                subtitle: '1.0.0',
                isEdit: false,
                callback: () {},
              ),
              HealthMenu(
                title: 'ภาษา',
                subtitle: 'ภาษาไทย',
                callback: () {
                  context.read<ElderlySettingBloc>().add(SettingLanguage());
                },
              ),
              HealthMenu(
                title: 'ลบบัญชี',
                subtitle: '',
                callback: () {
                  showDialog(
                      context: context,
                      builder: (_) {
                        return DeleteSubmitDialog();
                      }).then((click) {});
                  context.read<ElderlySettingBloc>().add(DeleteAccount());
                },
              ),
              HealthMenu(
                title: 'เกี่ยวกับ',
                subtitle: '',
                callback: () {},
              ),
            ],
          )),
        );
      },
    );
  }
}
