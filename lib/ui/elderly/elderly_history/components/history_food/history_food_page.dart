import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

import 'bloc/history_food_bloc.dart';
import 'common/item_constant.dart';
import 'views/history_food_log_widget.dart';
import 'views/summary_food.dart';

class HistoryFoodPage extends StatelessWidget {
  const HistoryFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.white,
      appBar: appBar(
          onBack: () {
            Navigator.pop(context);
          },
          title: 'บันทึกมื้ออาหาร'),
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (_) => HistoryFoodBloc()..add(InitialData()),
          child: BlocConsumer<HistoryFoodBloc, HistoryFoodState>(
            listener: (BuildContext context, HistoryFoodState state) {
              // TODO: implement listener
            },
            builder: (BuildContext context, HistoryFoodState state) {
              return Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    FlutterToggleTab(
                      width: 90,
                      borderRadius: 30,
                      height: 50,
                      selectedIndex:
                          state.currentTab == HistoryFoodTab.summary ? 0 : 1,
                      selectedBackgroundColors: [
                        color.Primary,
                        color.BlueFade2
                      ],
                      unSelectedBackgroundColors: [color.blueFade3],
                      selectedTextStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w700),
                      unSelectedTextStyle: TextStyle(
                          color: Colors.black87,
                          fontSize: 16,
                          fontFamily: fontFamily,
                          fontWeight: FontWeight.w500),
                      labels: ['สถิติ', 'ข้อมูลการบันทึก'],
                      selectedLabelIndex: (index) {
                        context
                            .read<HistoryFoodBloc>()
                            .add(onTabChange(tabIndex: index));
                      },
                      isScroll: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (state.currentTab == HistoryFoodTab.summary) ...{
                      SummaryFoodWidget()
                    } else ...{
                      HistoryFoodLogWidget()
                    }
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
