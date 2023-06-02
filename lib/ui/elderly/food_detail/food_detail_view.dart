import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button_circle.dart';
import 'package:health_application/ui/elderly/food/views/list_section/list_section.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_state.dart';
import 'package:health_application/ui/elderly/food_detail/view/collapsable_section.dart';
import 'package:health_application/ui/elderly/food_detail/view/ingredients_list.dart';
import 'package:health_application/ui/elderly/food_detail/view/method_list.dart';
import 'package:health_application/ui/elderly/food_detail/view/nutrition_fact.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodDetailView extends StatelessWidget {

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
      body: BlocListener<FoodDetailBloc, FoodDetailState>(
        
        listener: (context, state) {
          
        },
        child: BlocBuilder<FoodDetailBloc, FoodDetailState>(
          builder: (context, state) => Container(
            color: ColorTheme().white,
            child: Stack(
              children: [
                Container(
                  //TODO to integrate image with api
                  // decoration: BoxDecoration(
                  //   image: Image.network(src)
                  // ),
                  height: 300,
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
                            padding: EdgeInsets.only(left: 16, right: 16, top: 44, bottom: 34),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
                            ),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  textH6(state.food.name, ColorTheme().black87, false),
                                  textSubtitle16Blod(state.food.categories.join(','), ColorTheme().grey10),
                                  SizedBox(height: 40),
                                  ListSection(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.all(16),
                                        decoration: BoxDecoration(
                                          color: ColorTheme().grey10,
                                          borderRadius: BorderRadius.circular(12)
                                        ),
                                        child: Row(
                                          children: [
                                            SizedBox(
                                              width: 40,
                                              height: 40,
                                              child: Image.asset('assets/images/calories_icon_blue.png'),
                                            ),
                                            SizedBox(width: 16),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                textSubtitle2('แคลอรี่ทั้งหมด', ColorTheme().black87, false),
                                                Row(
                                                  children: [
                                                    // textSubtitle2(state.calories.toString() + ' ', ColorTheme().blueText, false),
                                                    // textSubtitle2(UnitEnergy.kilocalories.symbol, ColorTheme().black87, false)
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  ListSection(
                                    sectionHeaderTitle: 'คำอธิบาย',
                                    children: [
                                      textSubtitle2(state.food.description, ColorTheme().black87, false)
                                    ],
                                  ),
                                  NutritionFact(food: state.food),
                                  SizedBox(height: 20),
                                  IngredientsList(),
                                  SizedBox(height: 20),
                                  MethodList(methods: [],)
                                ],
                              ),
                          )
                        ),
                      ),
                    ],
                  )
                )
              ]
            )
          )
        ),
      )
    );
  }
}