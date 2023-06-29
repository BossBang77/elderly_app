import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/food_model.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class HistoryFoodBox extends StatelessWidget {
  const HistoryFoodBox(
      {super.key,
      required this.title,
      required this.foods,
      required this.type});

  final String title;
  final List<FoodModel> foods;
  final LunchIcon type;

  @override
  Widget build(BuildContext context) {
    String foodIcon(LunchIcon type) {
      switch (type) {
        case LunchIcon.breakfast:
          return 'assets/images/no_bf_icon.png';
        case LunchIcon.lunch:
          return 'assets/images/no_lunch_icon.png';
        case LunchIcon.snack:
          return 'assets/images/no_snack_icon.png';
        case LunchIcon.lunch:
          return 'assets/images/no_dinner_icon.png';
        default:
          return 'assets/images/no_bf_icon.png';
      }
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      margin: const EdgeInsets.only(bottom: 15),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: color.grey10, width: 0.7),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: color.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              textSubtitle16Blod(title, color.black87),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          if (foods.isNotEmpty) ...{
            for (var food in foods) ...{
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      'assets/images/food_1.png',
                      fit: BoxFit.contain,
                      scale: 3,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      textSubtitle16W500(food.foodName, color.black87),
                      textSubtitle15w400(
                          '${food.size} ${food.unit} : ${food.calories} kcal ',
                          color.black87),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            },
          } else ...{
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  foodIcon(type),
                  scale: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: textSubtitle16Blod(
                      'ไม่ได้เพิ่มมื้ออาหารของคุณ', color.greyText),
                ),
              ],
            )
          }
        ],
      ),
    );
  }
}
