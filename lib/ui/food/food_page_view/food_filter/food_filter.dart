import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/widget/back_button.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/close_button.dart';
import 'package:health_application/ui/food/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/food/bloc/food_filter/food_filter_event.dart';
import 'package:health_application/ui/food/bloc/food_filter/food_filter_state.dart';
import 'package:health_application/ui/food/food_page_view/food_filter/food_filter_calories_widget.dart';
import 'package:health_application/ui/food/food_page_view/food_filter/food_filter_type_widget.dart';
import 'package:health_application/ui/food/food_page_view/food_filter/toggle_filter_item_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodFilterView extends StatelessWidget {
  const FoodFilterView({this.onFilterApplied});

  final Function()? onFilterApplied;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: ColorTheme().white,
        backgroundColor: ColorTheme().white,
        leading: CloseButtonWidget(onClick: () {
          context.read<FoodFilterBloc>().add(FoodFilterStateRestored());
          Navigator.pop(context, true);
        }),
        title: textSubtitle2('ตัวกรอง', ColorTheme().black87, false),
        actions: [
          TextButton(
            onPressed: (){
              context.read<FoodFilterBloc>().add(FoodFilterClearButtonTapped());
            }, 
            child: textSubtitle2('ล้างค่า', ColorTheme().blueText, false)
          )
        ],
      ),
      body: BlocBuilder<FoodFilterBloc, FoodFilterState>(
        builder: (context, state) => Container(
          color: ColorTheme().white,
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                height: double.infinity,
                child: SingleChildScrollView(
                  keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.only(bottom: 34),
                  child: Column(
                    children: [
                      ToggleFilterItemWidget(
                        name: 'โรคประจำตัว',
                        description: 'โรคความดันโลหิตสูง, โรคเบาหวาน\nโรคภูมิคุ้มกันบกพร่อง , โรคอ้วน',
                        isChecked: state.isCongentialDeceaseSelected,
                        onChanged: (isChecked){
                          context.read<FoodFilterBloc>().add(FoodFilterCongentialDeceaseToggled(isCongentialDeceaseSelected: isChecked));
                        },
                      ),
                      ToggleFilterItemWidget(
                        name: 'แพ้อาหาร',
                        description: 'นมวัว, แป้งสาลีและกลูเต็น ',
                        isChecked: state.isFoodAllergiesSelected,
                        onChanged: (isChecked){
                          context.read<FoodFilterBloc>().add(FoodFilterFoodAllergiesToggled(isFoodAllergiesSelected: isChecked));
                        },
                      ),
                      FoodFilterCaloriesWidget(),
                      FoodFilterTypeWidget<String>(
                        //TODO use list from api
                        items: [],
                        values: [],
                        selectedFoodTypes: state.selectedTypes,
                        onFoodTypeSelected: (value) {
                          context.read<FoodFilterBloc>().add(FoodFilterFoodTypeSelected(foodTypes: value));
                        },
                      )
                    ],
                  )
                ),
              ),
              Positioned(
                width: MediaQuery.of(context).size.width ,
                bottom: 0,
                child: Container(
                  height: 97,
                  color: Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      ButtonGradient(
                        btnName: 'ค้นหา',
                        onClick: () {
                          context.read<FoodFilterBloc>().add(FoodFilterSearchButtonTapped());
                          Navigator.pop(context, true);
                          onFilterApplied?.call();
                        },
                      ),
                    ],
                  )
                )
              ),
            ],
          )
        )
      ),
    );
  }
}