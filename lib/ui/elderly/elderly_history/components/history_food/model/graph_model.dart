import 'package:health_application/ui/elderly/elderly_history/components/history_food/common/item_constant.dart';
import 'package:health_application/ui/extension/extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'graph_model.g.dart';

@JsonSerializable()
class GraphModel {
  const GraphModel({this.date = '', this.value = 0});

  ///convert from json
  factory GraphModel.fromJson(Map<String, dynamic> json) =>
      _$GraphModelFromJson(json);

  final String date;
  final double value;
}

class GraphGenerate extends GraphModel {
  static List<GraphModel> generateGraphData(
      List<GraphModel> data, GraphRangeType type) {
    if (data.isEmpty) {
      return data;
    }
    List<GraphModel> listDate = [];
    var today = DateTime.now();
    var lastDate;
    if (type == GraphRangeType.oneWeek) {
      lastDate = DateTime(today.year, today.month, today.day - 7);
    } else {
      lastDate = DateTime(today.year, today.month - 1, today.day);
    }

    while (today.isAfter(lastDate)) {
      var day = today.toDisplayApiFormat();
      var findDate =
          data.firstWhere((el) => el.date == day, orElse: () => GraphModel());
      if (findDate.date.isNotEmpty) {
        listDate.add(findDate);
      } else {
        listDate.add(GraphModel(date: day, value: 0));
      }
      today = DateTime(today.year, today.month, today.day - 1);
    }
    return listDate;
  }
}
