import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';
import 'package:pie_chart/pie_chart.dart';

class WaterIntakeChart extends StatelessWidget {
  const WaterIntakeChart(
      {super.key, required this.total, required this.isDrink});
  final double total;
  final double isDrink;

  @override
  Widget build(BuildContext context) {
    // TODO recive frome api
    Map<String, double> dataMap = {
      "drink": isDrink,
    };

    final gradientList = <List<Color>>[
      [
        ColorTheme().BlueDark,
        ColorTheme().Blue,
      ],
      [
        ColorTheme().GreyBackGround,
        ColorTheme().GreyBackGround,
      ],
    ];
    return AspectRatio(
      aspectRatio: 1.7,
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Center(
              child: PieChart(
                dataMap: dataMap,
                initialAngleInDegree: -90,
                totalValue: total,
                chartRadius: MediaQuery.of(context).size.width / 2.5,
                chartType: ChartType.ring,
                ringStrokeWidth: 24,
                baseChartColor: ColorTheme().GreyBackGround,
                animationDuration: const Duration(seconds: 3),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: false,
                    showChartValuesOutside: false,
                    showChartValuesInPercentage: false,
                    showChartValueBackground: false),
                legendOptions: const LegendOptions(
                    showLegends: false, showLegendsInRow: false),
                gradientList: gradientList,
              ),
            ),
          ),
          Positioned(
            top: 58,
            left: MediaQuery.of(context).size.width / 2.8,
            child: Column(children: [
              textSubtitle24W700('500 มล.', ColorTheme().black87),
              textSubtitle2('ปริมาณที่ดื่ม', ColorTheme().black87, true),
            ]),
          )
        ],
      ),
    );
  }
}
