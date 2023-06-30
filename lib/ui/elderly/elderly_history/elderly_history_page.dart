import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_application/ui/base/routes.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/health_profile/component/health_menu.dart';
import 'package:health_application/ui/register_profile/model/register_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';

class ElderlyHistoryPage extends StatelessWidget {
  const ElderlyHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
      appBar: appBar(
          onBack: () {
            Navigator.pop(context);
          },
          title: 'ประวัติการบันทึกข้อมูล'),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              HealthMenu(
                title: 'บันทึกมื้ออหาร',
                subtitle: '',
                callback: () {
                  context.go(Routes.elderlyHistoryFood);
                },
              ),
              HealthMenu(
                title: 'บันทึกการออกกำลังกาย',
                subtitle: '',
                callback: () {},
              ),
              HealthMenu(
                title: 'บันทึกการดื่มน้ำ',
                subtitle: '',
                callback: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
