import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/food/model/nutrition_unit/nutrient_unit.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class FoodFilterCaloriesWidget extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 25, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textBody1('แคลอรี่', ColorTheme().black87),
              textBody2('ระบุแคลอรี่ที่ต้องการรับประทานต่อมื้อ', ColorTheme().black87, false),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          suffixText: UnitEnergy.kilocalories.symbol,
                        ),
                    ),
                  ),
                  Container(
                    width: 7,
                    height: 2,
                    color: Colors.black,
                    margin: EdgeInsets.only(left: 20, right: 20),
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: ColorTheme().GreyBackGround)
                          ),
                          suffixText: UnitEnergy.kilocalories.symbol,
                        ),
                    ),
                  ),
                  // TextField()
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