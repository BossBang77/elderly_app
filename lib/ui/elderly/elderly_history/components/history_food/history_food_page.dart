import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:health_application/ui/base/widget/app_bar_widget.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/bloc/history_food_bloc.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/views/summary_food.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

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
          create: (context) => HistoryFoodBloc(),
          child: BlocConsumer<HistoryFoodBloc, HistoryFoodState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
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
                      // TODO: history food widget
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
