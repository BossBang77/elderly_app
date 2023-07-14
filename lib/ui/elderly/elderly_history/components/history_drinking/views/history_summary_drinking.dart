import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/bloc/history_drinking_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/mock_drinking_data.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/views/graph_widget.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class HistorySummaryDrinking extends StatelessWidget {
  const HistorySummaryDrinking({super.key});

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

    return BlocConsumer<HistoryDrinkingBloc, HistoryDrinkingState>(
      listener: (context, state) {},
      builder: (context, state) {
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
                    borderRadius: const BorderRadius.all(Radius.circular(24.0)),
                    child: Row(
                      children: [
                        Container(
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
                          .read<HistoryDrinkingBloc>()
                          .add(OnFrequencyChange(type: frequency[index]));
                    },
                  );
                },
              ),
            ),
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
                textSubtitle16W500('ปริมาณที่ดื่ม (มล.)', color.black87),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 300,
                  child: GraphWidget(
                    data: GraphGenerate.generateGraphData(
                        state.drinkingData.amountToDrink, state.currentRange),
                    leftTitleRange: 400,
                    bottomTitleRange: 1,
                    rangeType: state.currentRange,
                    noDataIcon: 'assets/images/drinking_disable.png',
                    noDataText: 'ไม่มีบันทึกการดื่มน้ำ',
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        );
      },
    );
  }
}
