import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/base/bloc/master_data_bloc.dart';
import 'package:health_application/ui/base/widget/button_gradient.dart';
import 'package:health_application/ui/base/widget/close_button.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_bloc.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_event.dart';
import 'package:health_application/ui/elderly/food_filter/bloc/food_filter/food_filter_state.dart';
import 'package:health_application/ui/elderly/food_filter/view/food_filter_calories_widget.dart';
import 'package:health_application/ui/elderly/food_filter/view/food_filter_type_widget.dart';
import 'package:health_application/ui/elderly/food_filter/view/toggle_filter_item_selectable.dart';
import 'package:health_application/ui/elderly/food_filter/view/toggle_filter_item_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodFilterView extends StatelessWidget {
  const FoodFilterView({
    this.onFilterApplied,
    this.isToggleItemSelectable = false
  });

  final Function()? onFilterApplied;
  final bool isToggleItemSelectable;

  @override
  Widget build(BuildContext context) {
    List<Widget> toggleItems(FoodFilterState state) {
      if (isToggleItemSelectable) {
        return [
          ToggleFilterItemSelectableWidget(
            name: 'โรคประจำตัว',
            description: state.selectedDisease.isEmpty ? 'ยังไม่ระบุ' :
                state.selectedDisease.map((disease) => disease.name).join(', '),
            isChecked: state.isCongentialDeceaseSelected,
            masterData: BlocProvider.of<MasterDataBloc>(context).state.congenitalDiseaseMaster,
            onChanged: (isChecked) {
              context.read<FoodFilterBloc>().add(
                  FoodFilterCongentialDeceaseToggled(
                      isCongentialDeceaseSelected:
                          isChecked));
            },
            onSubmit: (data) {
              context.read<FoodFilterBloc>().add(FoodFilterSetSelectedDisease(diseases: data));
            },
            initialValue: state.selectedDisease,
          ),
          ToggleFilterItemSelectableWidget(
            name: 'แพ้อาหาร',
            description: state.selectedFoodAllergy.isEmpty ? 'ยังไม่ระบุ' :
              state.selectedFoodAllergy.map((food) => food.name).join(', '),
            isChecked: state.isFoodAllergiesSelected,
            masterData: BlocProvider.of<MasterDataBloc>(context).state.allergiesMaster,
            onChanged: (isChecked) {
              context.read<FoodFilterBloc>().add(
                  FoodFilterFoodAllergiesToggled(
                      isFoodAllergiesSelected: isChecked));
            },
            onSubmit: (data) {
              context.read<FoodFilterBloc>().add(FoodFilterSetSelectedFoodAllergy(foodAllergy: data));
            },
            initialValue: state.selectedFoodAllergy,
          ),
        ];
      } else {
        return [
          ToggleFilterItemWidget(
            name: 'โรคประจำตัว',
            description:
                'โรคความดันโลหิตสูง, โรคเบาหวาน\nโรคภูมิคุ้มกันบกพร่อง , โรคอ้วน',
            isChecked: state.isCongentialDeceaseSelected,
            onChanged: (isChecked) {
              context.read<FoodFilterBloc>().add(
                  FoodFilterCongentialDeceaseToggled(
                      isCongentialDeceaseSelected:
                          isChecked));
            },
          ),
          ToggleFilterItemWidget(
            name: 'แพ้อาหาร',
            description: 'นมวัว, แป้งสาลีและกลูเต็น ',
            isChecked: state.isFoodAllergiesSelected,
            onChanged: (isChecked) {
              context.read<FoodFilterBloc>().add(
                  FoodFilterFoodAllergiesToggled(
                      isFoodAllergiesSelected: isChecked));
            },
          ),
        ];
      }
    }


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
              onPressed: () {
                context
                    .read<FoodFilterBloc>()
                    .add(FoodFilterClearButtonTapped());
              },
              child: textSubtitle2('ล้างค่า', ColorTheme().blueText, false))
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
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.only(bottom: 34),
                        child: Column(
                          children: [
                            Column(
                              children: toggleItems(state)
                            ),
                            FoodFilterCaloriesWidget(),
                            FoodFilterTypeWidget<String>(
                              //TODO use list from api
                              items: [],
                              values: [],
                              selectedFoodTypes: state.selectedTypes,
                              onFoodTypeSelected: (value) {
                                context.read<FoodFilterBloc>().add(
                                    FoodFilterFoodTypeSelected(
                                        foodTypes: value));
                              },
                            )
                          ],
                        )),
                  ),
                  Positioned(
                      width: MediaQuery.of(context).size.width,
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
                                  context
                                      .read<FoodFilterBloc>()
                                      .add(FoodFilterSearchButtonTapped());
                                  Navigator.pop(context, true);
                                  onFilterApplied?.call();
                                },
                              ),
                            ],
                          ))),
                ],
              ))),
    );
  }
}
