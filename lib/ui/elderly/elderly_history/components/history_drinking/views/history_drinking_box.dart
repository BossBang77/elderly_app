import 'package:flutter/material.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/elderly_drinking_model.dart';
import 'package:health_application/ui/elderly/water_intake/bloc/water_intake_bloc.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class HistoryDrinkingBox extends StatelessWidget {
  const HistoryDrinkingBox({super.key, required this.waters});

  final List<ElderlyDrinkingModel> waters;

  @override
  Widget build(BuildContext context) {
    String getImageBottle(String size) {
      switch (size) {
        case '250':
          return 'assets/images/250ml.png';
        case '500':
          return 'assets/images/500ml.png';
        case '600':
          return 'assets/images/600ml.png';
        case '900':
          return 'assets/images/90ml.png';
        case '1500':
          return 'assets/images/1500ml.png';
        default:
          return 'assets/images/250ml.png';
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
        children: [
          if (waters.isNotEmpty) ...{
            ListView.builder(
              itemCount: waters.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var water = waters[index];
                var bottle = volumnTypeList
                    .firstWhere((el) => el.code == water.containerCode);
                return Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          bottle.volumePic,
                          fit: BoxFit.contain,
                          scale: 4,
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            textSubtitle16W500(
                                'ภาชนะ ${bottle.volumeQuantity} มล.',
                                color.black87),
                            textSubtitle15w400(
                                '${water.numberOfDrink.toString()} แก้ว',
                                color.black87),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                );
              },
            ),
          } else ...{
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/drinking_disable.png',
                  scale: 2,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: textSubtitle16Blod(
                      'ไม่มีบันทึกการดื่มน้ำ', color.greyText),
                ),
              ],
            )
          },
        ],
      ),
    );
  }
}
