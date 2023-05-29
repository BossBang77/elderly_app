import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/button_blue_fade.dart';
import 'package:health_application/ui/base/widget/text_field_widget.dart';
import 'package:health_application/ui/elderly/water_intake/model/intake_water_model.dart';
import 'package:health_application/ui/elderly/water_intake/model/volumn_type.dart';

import '../../../base/widget/back_button.dart';
import '../../../base/widget/button_gradient.dart';
import '../../../base/widget/text_field_line.dart';
import '../../../ui-extensions/color.dart';
import '../../../ui-extensions/font.dart';
import '../bloc/water_intake_bloc.dart';

void addWaterIntake(BuildContext ctx,
    {bool isCreate = true,
    IntakeWaterModel itemEdit = const IntakeWaterModel(),
    int indexEdit = 0}) {
  int index = 0;
  TextEditingController volumeQuantity = TextEditingController();
  TextEditingController volumeValue = TextEditingController();
  int? current = volumnTypeList
      .indexWhere((element) => element.code == itemEdit.volumeName);
  if (!isCreate) {
    index = current;
    volumeQuantity.text = itemEdit.volumeQuantity.toString();
    volumeValue.text = itemEdit.volumeValue.toString();
  }

  showModalBottomSheet(
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      backgroundColor: ColorTheme().white,
      context: ctx,
      builder: (context) {
        return StatefulBuilder(builder: (context, setState) {
          return Builder(builder: (context) {
            void forward() {
              if ((index) < volumnTypeList.length - 1) {
                setState(
                  () {
                    index++;
                  },
                );
              }
            }

            void backward() {
              if (index > 0) {
                setState(() {
                  index--;
                });
              }
            }

            return Container(
                height: MediaQuery.of(context).size.height / 1.2,
                padding: MediaQuery.of(context).viewInsets,
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
                                'บันทึกการดื่มน้ำ', ColorTheme().black87),
                            Container()
                          ],
                        ),
                      ),
                      textSubtitle18Blod('ภาชนะ', ColorTheme().black87),
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () => backward(),
                              child: Image.asset(
                                'assets/images/icon_back_enable.png',
                                scale: 4,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.only(
                                  left: 50, right: 50, top: 20, bottom: 20),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: ColorTheme().GreyBorder),
                                color: ColorTheme().grey10.withOpacity(0.07),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Image.asset(
                                    volumnTypeList[index].volumePic,
                                    scale: 4,
                                  ),
                                  if (index != volumnTypeList.length - 1) ...{
                                    textSubtitle2(
                                        '${volumnTypeList[index].volumeQuantity} มล.',
                                        ColorTheme().black87,
                                        true),
                                  }
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () => forward(),
                              child: Image.asset(
                                'assets/images/icon_next_enable.png',
                                scale: 4,
                              ),
                            )
                          ],
                        ),
                      ),
                      if (index == volumnTypeList.length - 1) ...{
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            textSubtitle18Blod('ปริมาตร', ColorTheme().black87),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: 70, right: 70),
                                child: TextFieldLine(
                                  maxLength: 100,
                                  controller: volumeValue,
                                  textNumberType: true,
                                  onChange: ((value) {}),
                                )),
                          ],
                        )
                      },
                      const SizedBox(
                        height: 10,
                      ),
                      textSubtitle18Blod('จำนวน', ColorTheme().black87),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                          padding: EdgeInsets.only(left: 70, right: 70),
                          child: TextFieldLine(
                            controller: volumeQuantity,
                            textNumberType: true,
                            maxLength: 100,
                            onChange: (value) {},
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.all(10),
                        child: ButtonGradient(
                          btnName: 'บึนทึก',
                          onClick: () {
                            var intakeModel = IntakeWaterModel(
                                volumeName: volumnTypeList[index].code,
                                volumeQuantity:
                                    int.tryParse(volumeQuantity.text) ?? 0,
                                volumeValue: index == volumnTypeList.length - 1
                                    ? int.tryParse(volumeValue.text) ?? 0
                                    : volumnTypeList[index].volumeQuantity);
                            Navigator.pop(ctx, true);
                            if (isCreate) {
                              ctx.read<WaterIntakeBloc>().add(
                                  AddIntakeWater(intakeWater: intakeModel));
                            } else {
                              ctx.read<WaterIntakeBloc>().add(EditIntakeWater(
                                  intakeWater: intakeModel, index: indexEdit));
                            }
                          },
                        ),
                      ),
                      if (!isCreate)
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: ButtonBlueFade(
                            btnName: 'ลบรายการ',
                            onClick: () {
                              Navigator.pop(ctx, true);
                              ctx
                                  .read<WaterIntakeBloc>()
                                  .add(RemoveIntakeWater(index: indexEdit));
                            },
                          ),
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ));
          });
        });
      });
}
