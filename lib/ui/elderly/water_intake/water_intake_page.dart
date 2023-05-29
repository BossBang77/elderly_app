import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/button_orange.dart';
import 'package:health_application/ui/base/widget/text_field_line.dart';
import 'package:health_application/ui/elderly/water_intake/bloc/water_intake_bloc.dart';
import 'package:health_application/ui/elderly/water_intake/component/add_water_intake.dart';
import 'package:health_application/ui/elderly/water_intake/component/change_water_intake.dart';
import 'package:health_application/ui/elderly/water_intake/component/piechart_water_intake.dart';
import 'package:health_application/ui/elderly/water_intake/model/volumn_type.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import '../../base/widget/app_bar_widget.dart';
import 'model/intake_water_model.dart';

class WaterIntakePage extends StatelessWidget {
  const WaterIntakePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(
          onBack: () {
            Navigator.pop(context, true);
          },
          title: 'ดื่มน้ำ'),
      backgroundColor: ColorTheme().white,
      body: BlocProvider<WaterIntakeBloc>(
        create: (_) => WaterIntakeBloc(),
        child: BlocConsumer<WaterIntakeBloc, WaterIntakeState>(
            listener: (context, state) {},
            builder: (BuildContext parent, WaterIntakeState state) {
              return initialWidget(parent, state);
            }),
      ),
    );
  }

  Widget initialWidget(BuildContext context, WaterIntakeState state) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            textSubtitle18Blod(
                'วันนี้, ${DateTime.now().toDisplayFullBuddishDate(locale: 'th')}',
                ColorTheme().black87),
            const SizedBox(
              height: 30,
            ),
            WaterIntakeChart(
              total: 100,
              isDrink: 60,
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: ColorTheme().GreyBorder),
                color: ColorTheme().grey10,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Edit drink water intake
                            changeWaterIntake(context);
                          },
                          child: Row(
                            children: [
                              textSubtitle2(
                                  'เป้าหมาย', ColorTheme().black87, true),
                              const SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/edit_enable.png',
                                scale: 4,
                              )
                            ],
                          ),
                        ),
                        textBody1('2000 มล.', ColorTheme().black87)
                      ],
                    ),
                    VerticalDivider(
                      color: ColorTheme().GreyBackGround,
                      thickness: 1,
                    ),
                    Column(
                      children: [
                        textSubtitle2(
                            'ปริมาณที่เหลือ', ColorTheme().black87, true),
                        textBody1('1500 มล.', ColorTheme().black87)
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            textSubtitle18Blod('บันทึกการดื่มน้ำ', ColorTheme().black87),
            const SizedBox(
              height: 30,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              mainAxisSpacing: 2, // ช่องว่างแนวนอน
              crossAxisSpacing: 1, // ช่องว่างแนวตั้ง
              crossAxisCount: 4,
              childAspectRatio: 1,
              children: List.generate(
                  state.intakeWaterModel.length < 8
                      ? 8
                      : state.intakeWaterModel.length, (index) {
                String textTitle = '';
                IntakeWaterModel currentIntake = IntakeWaterModel();
                if (index <= state.intakeWaterModel.length - 1) {
                  currentIntake = state.intakeWaterModel[index];
                  textTitle =
                      '${currentIntake.volumeValue} มล. x${currentIntake.volumeQuantity}';
                }
                return InkWell(
                  onTap: () {
                    if (index <= state.intakeWaterModel.length - 1) {
                      addWaterIntake(context,
                          isCreate: false,
                          indexEdit: index,
                          itemEdit: currentIntake);
                    }
                  },
                  child: Column(
                    children: [
                      Image.asset(
                        textTitle.isEmpty
                            ? 'assets/images/empty_water.png'
                            : volumnTypeList
                                .firstWhere(
                                  (element) =>
                                      element.code == currentIntake.volumeName,
                                  orElse: () => VolumnTypeModel(
                                      volumePic:
                                          'assets/images/empty_water.png'),
                                )
                                .volumePic,
                        scale: 4,
                      ),
                      textButton2(textTitle, ColorTheme().black87)
                    ],
                  ),
                );
              }),
            ),
            ButtonOrange(
              btnName: 'เพิ่มรายการใหม่',
              onClick: () {
                addWaterIntake(context, isCreate: true);
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
