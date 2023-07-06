import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/bloc/history_food_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_food_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/mock_graph_data.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/views/graph_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/register_profile/volunteer/views/address/dropdown_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class SummaryFoodWidget extends StatelessWidget {
  const SummaryFoodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<GraphRangeType> frequency = [
      GraphRangeType.oneWeek,
      GraphRangeType.oneMonth,
    ];
    String getFrequencyName(GraphRangeType type) {
      switch (type) {
        case GraphRangeType.oneWeek:
          return '1 สัปดาห์';
        case GraphRangeType.oneMonth:
          return '1 เดือน';
        default:
          return '';
      }
    }

    String getDisplayDateRange(GraphRangeType type) {
      switch (type) {
        case GraphRangeType.oneWeek:
          return DateTime.now().toDisplayDateByWeek(locale: 'th');
        case GraphRangeType.oneMonth:
          return DateTime.now().toDisplayDateByMonth(locale: 'th');
        default:
          return '';
      }
    }

    List<GraphModel> getNutrientsData(String type, ElderlyFoodModel data) {
      if (type == NutrientsEnum.Protein.name) {
        return data.protein;
      } else if (type == NutrientsEnum.Carb.name) {
        return data.carb;
      } else if (type == NutrientsEnum.Fat.name) {
        return data.fat;
      } else if (type == NutrientsEnum.Sugar.name) {
        return data.sugar;
      } else {
        return [];
      }
    }

    return BlocConsumer<HistoryFoodBloc, HistoryFoodState>(
      listener: (BuildContext context, HistoryFoodState state) {},
      builder: (BuildContext context, HistoryFoodState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                constraints: const BoxConstraints(maxHeight: 60),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: frequency.length,
                  itemBuilder: (BuildContext context, index) {
                    return InkWell(
                      splashColor: color.lightBlue,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(24.0)),
                      child: Row(
                        children: [
                          Container(
                              constraints: const BoxConstraints(maxHeight: 40),
                              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
                              child: textSubtitle16W500(
                                  getFrequencyName(frequency[index]),
                                  state.currentRange == frequency[index]
                                      ? color.Blue2
                                      : color.grey50)),
                          if (frequency.length != (index + 1))
                            VerticalDivider(
                              color: ColorTheme().GreyBackGround,
                              thickness: 1,
                            )
                        ],
                      ),
                      onTap: () {
                        context
                            .read<HistoryFoodBloc>()
                            .add(onFrequencyChange(type: frequency[index]));
                      },
                    );
                  },
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: textSubtitle16W500(
                  getDisplayDateRange(state.currentRange), color.black87),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textSubtitle16W500('แคลอรี่ (kcal)', color.black87),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: GraphWidget(
                    data: state.foodData.calories,
                    leftTitleRange: 200,
                    bottomTitleRange: 1,
                    rangeType: state.currentRange,
                    noDataIcon: 'assets/images/calories_icon_disable.png',
                    noDataText: 'ไมมีบันทึกแคลอรี่',
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 20, 30),
              child: textSubtitle16W500('ข้อมูลโภชนาการ', color.black87),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: DropdownWidget(
                    value: getNutrientDesc(state.currentNutrient),
                    items: selectNutrients
                        .map((e) => DropdownMenuItem<String>(
                            value: e.desc,
                            child: textH7(e.desc, color.black87)))
                        .toList(),
                    onChanged: (value) {
                      var getCode =
                          selectNutrients.firstWhere((e) => e.desc == value);
                      print('code = ${getCode.code}');
                      context
                          .read<HistoryFoodBloc>()
                          .add(onNutrientsChange(code: getCode.code));
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: GraphWidget(
                    data:
                        getNutrientsData(state.currentNutrient, state.foodData),
                    leftTitleRange: 20,
                    bottomTitleRange: 1,
                    rangeType: state.currentRange,
                    noDataIcon: 'assets/images/nutrient_icon.png',
                    noDataText: 'ไมมีบันทึกโภชนาการ',
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
