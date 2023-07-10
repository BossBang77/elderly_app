import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/back_button_circle.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/views/list_section/list_section.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_event.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_state.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodLogDetailView extends StatelessWidget {
  const FoodLogDetailView({this.onSubmitted});

  final Function(MealRecordItem)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          shadowColor: ColorTheme().white,
          backgroundColor: Colors.transparent,
          leading: BackButtonCircleWidget(onClick: () {
            Navigator.pop(context, true);
          }),
          actions: [],
        ),
        body: BlocListener<FoodLogDetailBloc, FoodLogDetailState>(
          listenWhen: (previous, current) {
            if (previous.food != current.food) {
              onSubmitted?.call(current.food);

              Navigator.of(context).popUntil(((route) {
                return (route.settings.name == 'FoodLogPage');
              }));
            }
            return true;
          },
          listener: (context, state) {},
          child: BlocBuilder<FoodLogDetailBloc, FoodLogDetailState>(
              builder: (context, state) => Container(
                  color: ColorTheme().white,
                  child: Stack(children: [
                    state.food.image.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(state.food.image),
                                    fit: BoxFit.cover)),
                            height: 300,
                          )
                        : Container(
                            width: MediaQuery.of(context).size.width,
                            height: 300,
                            alignment: Alignment.topCenter,
                            child: Center(
                                child: textOverline2(
                                    'Image NotFound', color.greyText)),
                          ),
                    Container(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          color: Colors.transparent,
                          height: 200,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                              child: Container(
                            padding:
                                EdgeInsets.only(left: 16, right: 16, top: 44),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                textH6(state.food.name, ColorTheme().black87,
                                    false),
                                textSubtitle16Blod(
                                    state.foodDetail.getTypeList(),
                                    ColorTheme().greyText),
                                SizedBox(height: 40),
                                ListSection(
                                  sectionHeaderTitle: 'จำนวนหน่วยบริโภค :',
                                  children: [
                                    Container(
                                      height: 48,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Container(
                                                height: 48,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: ColorTheme()
                                                          .GreyBorder),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                child: Center(
                                                    child: textBody1(
                                                        '${state.consumeUnit} จาน',
                                                        ColorTheme()
                                                            .blueText))),
                                          ),
                                          SizedBox(width: 16),
                                          GestureDetector(
                                            onTap: () {
                                              context.read<FoodLogDetailBloc>().add(
                                                  FoodLogDetailConsumeUnitSubstracted());
                                            },
                                            child: Container(
                                              width: 57,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: ColorTheme().grey10,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: textBody1('-',
                                                      ColorTheme().grey50)),
                                            ),
                                          ),
                                          SizedBox(width: 16),
                                          GestureDetector(
                                            onTap: () {
                                              context.read<FoodLogDetailBloc>().add(
                                                  FoodLogDetailConsumeUnitAdded());
                                            },
                                            child: Container(
                                              width: 57,
                                              height: 48,
                                              decoration: BoxDecoration(
                                                  color: ColorTheme().blueText,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Center(
                                                  child: textBody1(
                                                      '+', ColorTheme().white)),
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                ListSection(
                                  sectionHeaderTitle: 'คุณค่าทางโภชนาการ',
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(16),
                                      decoration: BoxDecoration(
                                          color: ColorTheme().grey10,
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 40,
                                            height: 40,
                                            child: Image.asset(
                                                'assets/images/calories_icon_blue.png'),
                                          ),
                                          SizedBox(width: 16),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              textSubtitle2('แคลอรี่ทั้งหมด',
                                                  ColorTheme().black87, false),
                                              Row(
                                                children: [
                                                  textSubtitle2(
                                                      state.calories
                                                              .toString() +
                                                          ' ',
                                                      ColorTheme().blueText,
                                                      false),
                                                  textSubtitle2(
                                                      UnitEnergy
                                                          .kilocalories.symbol,
                                                      ColorTheme().black87,
                                                      false)
                                                ],
                                              )
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 34),
                            child: ButtonGradient(
                              btnName: 'ยืนยัน',
                              onClick: () {
                                context
                                    .read<FoodLogDetailBloc>()
                                    .add(FoodLogDetailSubmitted());
                              },
                            ))
                      ],
                    ))
                  ]))),
        ));
  }
}
