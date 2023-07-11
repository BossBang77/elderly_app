import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/dialog/success_dialog.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/base/widget/error_alert.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/loaddingScreen.dart';
import 'package:health_application/ui/volunteer/volunteer_address/bloc/volunteer_address_bloc.dart';
import 'package:health_application/ui/volunteer/volunteer_address/widget/fill_volunteer_address.dart';
import 'package:health_application/ui/volunteer/volunteer_address/widget/summary_address.dart';

class VolunteerAddressPage extends StatelessWidget {
  const VolunteerAddressPage({super.key, required this.profile});
  final RegisterModel profile;

  @override
  Widget build(BuildContext context) {
    Widget initialWidget(VolunteerAddressState state) {
      if (state.section == VoluteerAddressSection.summaryAddress) {
        return SummaryAddress();
      } else {
        return FillVolunteerAddress();
      }
    }

    return BlocProvider(
      create: (context) =>
          VolunteerAddressBloc()..add(InitialData(profile: profile)),
      child: BlocConsumer<VolunteerAddressBloc, VolunteerAddressState>(
        listener: (context, state) async {
          if (state.submitStatus == SubmitStatus.fail) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext context) => ErrorAlertWidget(
                      title: 'เกิดข้อผิดพลาด',
                      subTitle: "บันทึกข้อมูลไม่สำเร็จ\nกรุณาลองใหม่อีกครั้ง",
                      btnName: 'ตกลง',
                    )) as bool;

            if (acceptClose) {
              context.read<VolunteerAddressBloc>().add(ResetSubmitForm());
            }
          }

          if (state.submitStatus == SubmitStatus.success) {
            final bool acceptClose = await showDialog(
                context: context,
                builder: (BuildContext _) => SuccessDialog(
                      header: "สำเร็จ!",
                      subtitle: "บันทึกข้อมูลสำเร็จ",
                      buttonName: 'ตกลง',
                      onTap: () {},
                    ));

            if (acceptClose) {
              context.read<VolunteerAddressBloc>().add(ResetSubmitForm());
              context.go(Routes.home);
            }
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              Scaffold(
                appBar: appBar(
                    onBack: () {
                      if (state.section ==
                          VoluteerAddressSection.fillVolunteerAddress) {
                        context.read<VolunteerAddressBloc>().add(ChangeSection(
                            section: VoluteerAddressSection.summaryAddress));
                      } else {
                        context.pop();
                      }
                    },
                    title: 'ที่อยู่ของคุณ'),
                body: initialWidget(state),
              ),
              if (state.isLoading) Loader()
            ],
          );
        },
      ),
    );
  }
}
