import 'package:flutter/material.dart';
import 'package:health_application/ui/extension/object_extension.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient.dart';
import 'package:health_application/ui/elderly/food/model/nutritions/nutrient_widget_background_provider.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class NutritionWidget extends StatelessWidget {
  const NutritionWidget({required this.nutrient});

  final Nutrient nutrient;

  @override
  Widget build(BuildContext context) {
    final nutrientWidgetImageProvider = nutrient.optionalCast();
    final double width = MediaQuery.of(context).size.width;
    final double displayableItem = 2.5;
    final double spaceBetweenItem = 10;
    final double ratio = 148 / 126;
    final double itemWidth =
        (width / displayableItem) - (1.5 * spaceBetweenItem);
    final double itemHeight = itemWidth * ratio;

    return Container(
      width: itemWidth,
      height: itemHeight,
      padding: EdgeInsets.fromLTRB(18, 18, 18, 23),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.all(Radius.circular(12)),
          image: DecorationImage(
              image: AssetImage(nutrientWidgetImageProvider?.backgroundImage ??
                  'assets/images/back_arrow.png'),
              fit: BoxFit.cover)),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image(
                  image: AssetImage(nutrientWidgetImageProvider?.iconImage ??
                      'assets/images/back_arrow.png')),
            ),
            textSubtitle2(nutrient.name, ColorTheme().white, false),
            textSubtitle18Blod(
                nutrient.value.toString() + ' ' + nutrient.unit.symbol,
                ColorTheme().white)
          ]),
    );
  }
}
