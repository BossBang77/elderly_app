import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button_circle.dart';
import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/elderly/food/views/list_section/list_section.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_event.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_state.dart';
import 'package:health_application/ui/elderly/food_detail/model/food_nutrition_fact.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_detail/view/ingredients_list.dart';
import 'package:health_application/ui/elderly/food_detail/view/method_list.dart';
import 'package:health_application/ui/elderly/food_detail/view/nutrition_fact.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_ingredient.dart';
import 'package:health_application/ui/extension/string_extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodDetailView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FoodDetailView();
}

class _FoodDetailView extends State<FoodDetailView> {
  double _scrollOffset = 0;
  int get _alpha => min(
      255,
      max(
          0,
          ((_scrollOffset /
                      (MediaQuery.of(context).padding.top +
                          AppBar().preferredSize.height)) *
                  255)
              .toInt()));

  @override
  Widget build(BuildContext context) {
    return BlocListener<FoodDetailBloc, FoodDetailState>(
        listener: (context, state) {},
        child: BlocBuilder<FoodDetailBloc, FoodDetailState>(
          builder: (context, state) => Scaffold(
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                elevation: 0,
                shadowColor: ColorTheme().white,
                backgroundColor: Colors.white.withAlpha(_alpha),
                leading: BackButtonCircleWidget(onClick: () {
                  Navigator.pop(context, true);
                }),
                title: Opacity(
                  opacity: _alpha / 255,
                  child: textSubtitle1(state.food.name, ColorTheme().black87),
                ),
                actions: [],
              ),
              body: Container(
                  color: ColorTheme().white,
                  child: Stack(children: [
                    state.food.image.isNotEmpty
                        ? Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(state.food.image))),
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
                        // Container(
                        //   color: Colors.transparent,
                        //   height: 200,
                        // ),
                        Expanded(
                            child: NotificationListener<ScrollNotification>(
                          onNotification: (notification) {
                            setState(() {
                              _scrollOffset = notification.metrics.pixels;
                            });
                            return true;
                          },
                          child: SingleChildScrollView(
                              child: Container(
                            margin: EdgeInsets.only(top: 200),
                            padding: EdgeInsets.only(
                                left: 16, right: 16, top: 44, bottom: 34),
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
                                textSubtitle16Blod(state.food.getTypeList(),
                                    ColorTheme().greyText),
                                SizedBox(height: 16),
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                      color: ColorTheme().grey10,
                                      borderRadius: BorderRadius.circular(12)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          textSubtitle2('ระยะเวลา',
                                              ColorTheme().black87, false),
                                          textSubtitle2(
                                              '${state.food.cookingTime} นาที',
                                              ColorTheme().blueText,
                                              false)
                                        ],
                                      ),
                                      Container(
                                        color: ColorTheme().grey50,
                                        width: 1,
                                        height: 40,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          textSubtitle2('แคลอรี่',
                                              ColorTheme().black87, false),
                                          textSubtitle2(
                                              '${state.food.nutrition.calorie} ${UnitEnergy.kilocalories.symbol}/จาน',
                                              ColorTheme().blueText,
                                              false)
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                ListSection(
                                  sectionHeaderTitle: 'คำอธิบาย',
                                  padding: EdgeInsets.only(top: 16, bottom: 16),
                                  children: [
                                    textSubtitle2(state.food.description,
                                        ColorTheme().black87, false),
                                    SizedBox(
                                      height: 16,
                                    )
                                  ],
                                ),
                                NutritionFact(
                                    food: FoodNutritionFact.fromResponse(
                                        state.food.nutrition)),
                                SizedBox(height: 20),
                                IngredientsList(
                                  ingredients: state.food.ingredients,
                                  numberOfPlates: state.ingredientNumberOfPlate,
                                  onAddButtonTap: () {
                                    context.read<FoodDetailBloc>().add(
                                        FoodDetailIngredientAddMorePlate());
                                  },
                                  onMinusButtonTap: () {
                                    context
                                        .read<FoodDetailBloc>()
                                        .add(FoodDetailIngredientRemovePlate());
                                  },
                                ),
                                SizedBox(height: 20),
                                MethodList(methods: state.food.cookingMethods)
                              ],
                            ),
                          )),
                        )),
                      ],
                    ))
                  ]))),
        ));
  }
}
