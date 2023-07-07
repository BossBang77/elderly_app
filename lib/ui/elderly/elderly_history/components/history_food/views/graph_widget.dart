import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:health_application/ui/ui-extensions/color.dart';
import 'package:health_application/ui/ui-extensions/font.dart';

class GraphWidget extends StatefulWidget {
  const GraphWidget(
      {super.key,
      required this.data,
      required this.leftTitleRange,
      required this.bottomTitleRange,
      required this.rangeType,
      required this.noDataIcon,
      required this.noDataText});

  final List<GraphModel> data;
  final double leftTitleRange;
  final double bottomTitleRange;
  final GraphRangeType rangeType;
  final String noDataIcon;
  final String noDataText;

  @override
  State<GraphWidget> createState() => _GraphWidgetState();
}

class _GraphWidgetState extends State<GraphWidget> {
  List<Color> gradientColors = [
    Color.fromRGBO(248, 118, 62, 1),
    Color.fromRGBO(255, 255, 255, 1),
  ];
  @override
  Widget build(BuildContext context) {
    int roundDown(int number, int factor) {
      if (factor < 1) throw RangeError.range(factor, 1, null, "factor");
      return number - (number % factor);
    }

    int roundUp(int number, int factor) =>
        roundDown(number + (factor - 1), factor);

    double getMaxValue() {
      if (widget.data.isNotEmpty) {
        GraphModel maxData =
            widget.data.reduce((a, b) => a.value > b.value ? a : b);
        int round = roundUp(maxData.value.ceil(), 50);
        return round.toDouble();
      } else {
        return 100;
      }
    }

    double getMinValue() {
      if (widget.data.isNotEmpty) {
        GraphModel minData =
            widget.data.reduce((a, b) => a.value < b.value ? a : b);
        int round = roundDown(minData.value.ceil(), 50);
        return round.toDouble();
      } else {
        return 0;
      }
    }

    double getMaxX() {
      if (widget.data.isNotEmpty) {
        return (widget.data.length - 1).toDouble();
      } else {
        return 0;
      }
    }

    List<GraphModel> getNewListFromLastDateToCurrentDate(
        List<GraphModel> list) {
      List<GraphModel> newTradeList = [...list];
      // Sorting date
      newTradeList.sort((a, b) => a.date.compareTo(b.date));
      return newTradeList;
    }

    Widget leftTitleWidgets(double value, TitleMeta meta) {
      String text;
      text = value.toInt().toString();
      return text12(text, color.black87);
    }

    Widget bottomTitleWidgets(double index, TitleMeta meta) {
      String text = '';
      if (widget.data.isNotEmpty) {
        if (widget.rangeType == GraphRangeType.oneWeek) {
          var item = widget.data[index.toInt()];
          text = item.date.isNotEmpty
              ? DateTime.parse(item.date).toDisplayShortDate(locale: 'th')
              : '';
        } else {
          var average = (widget.data.length / 2).ceil();
          var listIndDisplay = [0, average, widget.data.length - 1];
          if (listIndDisplay.contains(index)) {
            var item = widget.data[index.toInt()];
            text = item.date.isNotEmpty
                ? DateTime.parse(item.date).toDisplayShortDate(locale: 'th')
                : '';
          }
        }
      } else {
        text = DateTime.now().toDisplayShortDate(locale: 'th');
      }

      return Container(width: 25, child: text12(text, color.black87));
    }

    List<FlSpot> generateSpotData() {
      if (widget.data.isNotEmpty) {
        List<GraphModel> newTradeList =
            getNewListFromLastDateToCurrentDate(widget.data);
        List<FlSpot> data = [];

        data = newTradeList.map((item) {
          var index = newTradeList.indexWhere((ele) => ele == item);
          return FlSpot(index.toDouble(), item.value);
        }).toList();

        return data;
      } else {
        return [];
      }
    }

    LineTouchTooltipData generateTooltipData() {
      return LineTouchTooltipData(
          tooltipBgColor: color.Blue2,
          getTooltipItems: (List<LineBarSpot> touchedBarSpots) {
            return touchedBarSpots.map((barSpot) {
              List<GraphModel> newTradeList =
                  getNewListFromLastDateToCurrentDate(widget.data);
              var item = newTradeList[barSpot.x.toInt()];

              return LineTooltipItem(
                  '${item.value} \n',
                  TextStyle(
                      color: color.white,
                      fontSize: 15.sp,
                      fontFamily: fontFamily,
                      fontWeight: FontWeight.w300),
                  textAlign: TextAlign.center,
                  children: [
                    TextSpan(
                        text: DateTime.parse(item.date).toDisplayBuddhistDate(),
                        style: TextStyle(
                            color: color.white,
                            fontSize: 15.sp,
                            fontFamily: fontFamily,
                            fontWeight: FontWeight.w300))
                  ]);
            }).toList();
          });
    }

    LineChartData lineData() {
      return LineChartData(
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 50,
              showTitles: true,
              interval: widget.leftTitleRange,
              getTitlesWidget: leftTitleWidgets,
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              interval: widget.bottomTitleRange,
              getTitlesWidget: bottomTitleWidgets,
            ),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
          topTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: false,
            ),
          ),
        ),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: color.grey50,
              strokeWidth: 1,
            );
          },
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: const Color(0xff37434d),
              strokeWidth: 1,
            );
          },
        ),
        lineTouchData: LineTouchData(touchTooltipData: generateTooltipData()),
        borderData: FlBorderData(
          show: false,
        ),
        minX: 0,
        maxX: getMaxX(),
        minY: 0,
        maxY: getMaxValue(),
        lineBarsData: [
          LineChartBarData(
            spots: generateSpotData(),
            isCurved: true,
            color: Color.fromRGBO(248, 118, 62, 1),
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: false,
            ),
            belowBarData: BarAreaData(
              show: true,
              gradient: LinearGradient(
                colors: gradientColors
                    .map((color) => color.withOpacity(0.2))
                    .toList(),
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
        ],
      );
    }

    return Column(
      children: [
        Flexible(
          flex: 8,
          child: widget.data.isNotEmpty
              ? LineChart(
                  lineData(),
                  swapAnimationDuration: const Duration(milliseconds: 150),
                  swapAnimationCurve: Curves.linear,
                )
              : Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        widget.noDataIcon,
                        scale: 4,
                      ),
                      textSubtitle16W500(widget.noDataText, color.greyText),
                    ],
                  ),
                ),
        ),
      ],
    );
  }
}
