import 'package:flutter/material.dart';
import 'package:health_application/ui/base/model/master_data.dart';
import 'package:health_application/ui/elderly/food_filter/view/food_filter_disease_selection.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class ToggleFilterItemSelectableWidget extends StatelessWidget {
  // bool isSelected = false;
  const ToggleFilterItemSelectableWidget({
    this.name = '', 
    this.description = '', 
    this.onChanged, 
    this.isChecked = false,
    this.onSubmit,
    required this.masterData,
    this.initialValue = const[]
  });
  final String name;
  final String description;
  final Function(bool)? onChanged;
  final bool isChecked;
  final Function(List<SubMenuModel>)? onSubmit;
  final List<SubMenuModel> initialValue;
  final MasterData masterData;

  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 16, top: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 8),
                        Container(
                        child: textBody1(name, ColorTheme().black87),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder:(context) => 
                                FoodFilterMasterDataSelectWidget(
                                  initialValue: initialValue,
                                  masterData: masterData,
                                  onSubmit: (selectedItems) {
                                    onSubmit?.call(selectedItems);
                                    if (!isChecked) {
                                      onChanged?.call(true);
                                    }
                                  },
                                )
                              )
                            );
                          },
                          child: Expanded(child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Flexible(
                                child: textBody2(description, ColorTheme().greyText, false),
                              ),
                              Image.asset('assets/images/chevron_right.png', width: 18, height: 25)
                            ]
                          )
                        ))
                      ],
                    ),
                    ),
                  Container(
                    width: 80,
                    child: Switch.adaptive(
                      value: isChecked, 
                      onChanged: (isChecked){ 
                        // setState(() {
                          // isSelected = !isSelected;
                          if (!isChecked) {
                            onSubmit?.call([]);
                          }
                          onChanged?.call(isChecked);
                        // });
                      }
                    )
                  )
                ],
              ),
            ],
          )
        ),

        Container(height: 1, color: ColorTheme().GreyBorder)
      ],
    );
    
  }
}