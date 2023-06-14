import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/button_orange.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/calories.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_bloc.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_event.dart';
import 'package:health_application/ui/elderly/food_log/bloc/food_log_state.dart';
import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log_detail/bloc/food_log_detail_bloc.dart';
import 'package:health_application/ui/elderly/food_log_detail/food_log_detail_page.dart';
import 'package:health_application/ui/elderly/food_search/food_search_page.dart';
import 'package:health_application/ui/elderly/food_search/view/search_result_view.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodLogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: ColorTheme().white,
        backgroundColor: ColorTheme().white,
        leading: BackButtonWidget(onClick: () {
          Navigator.pop(context, true);
          context.read<FoodLogBloc>().add(FoodLogBackButtonTapped());
        }),
        title: textSubtitle2('ตัวกรอง', ColorTheme().black87, false),
        actions: [],
      ),
      body: BlocListener<FoodLogBloc, FoodLogState>(
        listener: (context, state) {
          if (state.isSavedCompleted == true) {
            Navigator.of(context).pop();
          }
        },
        child: BlocBuilder<FoodLogBloc, FoodLogState>(
          builder: (foodLogContext, state) => Container(
            color: ColorTheme().white,
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: textSubtitle1('วันนี้, 17 ตุลาคม 2565', ColorTheme().black87),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
                    child: ButtonOrange(
                      btnName: 'เพิ่มรายการใหม่',
                      onClick: () {
                        context.read<FoodLogBloc>().add(FoodLogAddMoreFoodButtonTapped());
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => FoodSearchPage(
                              onFoodSelected: (foodSearchItem) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => FoodLogDetailPage(
                                      food: MealRecordItem.fromSearch(foodSearchItem),
                                      mealType: state.mealType,
                                      onSubmitted: (food) {
                                        // print('onSubmitted');
                                        // foodLogContext.read<FoodLogBloc>().add(FoodLogListUpdated(newItem: food));
                                      },
                                    )
                                  )
                                );
                              },
                              onItemTrailingIconTap: (selectedFood) {

                              },
                            )
                          )
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemCount: state.foods.length,
                      separatorBuilder: (context, index) => Container(height: 1, color: ColorTheme().GreyBorder),
                      itemBuilder:(context, index) => 
                        FoodListItemView(
                          name: state.foods[index].name,
                          image: state.foods[index].image,
                          calories: Calories(value: state.foods[index].calorie * state.foods[index].unit),
                          trailingIcon: FoodListItemViewTrailingIcon.close,
                          onTap: () {
                            //TODO: handle on food selected
                          },
                          onTrailingIconTap: () {
                            print('tapped');
                            context.read<FoodLogBloc>().add(FoodLogMealItemRemoved(index: index));
                          },
                        )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: ButtonGradient(
                      btnName: 'บันทึกข้อมูล',
                      onClick: () {
                        context.read<FoodLogBloc>().add(FoodLogSaveButtonTapped());
                      },
                    ),
                  )
                ],
              )
            )
          )
        ),
      )
    );
  }
}