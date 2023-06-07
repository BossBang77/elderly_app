import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/water_intake/bloc/water_intake_bloc.dart';

import '../../../base/widget/back_button.dart';
import '../../../base/widget/button_gradient.dart';
import '../../../base/widget/text_field_line.dart';
import '../../../ui-extensions/color.dart';
import '../../../ui-extensions/font.dart';

void changeWaterIntake(BuildContext ctx) {
  initialValue() {
    ctx.read<WaterIntakeBloc>().add(ResetGoalToMaster());
  }

  Future<void> newGoal = showModalBottomSheet<void>(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: ColorTheme().white,
      context: ctx,
      builder: (BuildContext context) =>
          BlocBuilder<WaterIntakeBloc, WaterIntakeState>(
            builder: (BuildContext parent, WaterIntakeState state) {
              var goalDrinking = state.waterIntakeGoal;
              return Container(
                  padding: MediaQuery.of(context).viewInsets,
                  height: MediaQuery.of(context).size.height / 1.5,
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          height: 10,
                          width: 80,
                          decoration: BoxDecoration(
                              color: ColorTheme().GreyBackGround,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BackButtonWidget(onClick: () {
                                Navigator.pop(ctx, true);
                              }),
                              textSubtitle18Blod(
                                  'เป้่าหมายการดื่มน้ำ', ColorTheme().black87),
                              Container()
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorTheme().GreyBorder),
                            color: ColorTheme().grey10,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/water_drop.png',
                                scale: 4,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textH7('ทริคคำนวณดื่มน้ำตามน้ำหนักตัว',
                                      ColorTheme().black87),
                                  textH7(
                                      '[น้ำหนัก x 2.2 x 30/2] /1000 = ปริมาณน้ำ (ลิตร)',
                                      ColorTheme().black87),
                                  textBody2(
                                      'คำนวณ', ColorTheme().BlueDark2, true)
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        textSubtitle18Blod(
                            'ปริมาณการดื่มน้ำต่อวัน', ColorTheme().black87),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 50, right: 50),
                            child: TextFieldLine(
                              controller: TextEditingController(
                                  text: goalDrinking.target != 0
                                      ? goalDrinking.target.toInt().toString()
                                      : ''),
                              textNumberType: true,
                              onChange: (value) {
                                context.read<WaterIntakeBloc>().add(
                                    ChangeGoalDrinking(
                                        newGoal: int.tryParse(value) ?? 0));
                              },
                            )),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ButtonGradient(
                            btnName: 'บึนทึก',
                            onClick: () {
                              Navigator.pop(ctx, true);
                              context
                                  .read<WaterIntakeBloc>()
                                  .add(SubmitUpdateGoalDrinking());
                            },
                          ),
                        )
                      ],
                    ),
                  ));
            },
          ));
  newGoal.then((value) => initialValue());
}
