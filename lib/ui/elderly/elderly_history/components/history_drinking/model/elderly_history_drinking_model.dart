import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_history_drinking_model.g.dart';

@JsonSerializable()
class ElderlyHistoryDrinkingModel {
  const ElderlyHistoryDrinkingModel({
    this.amountToDrink = const [],
  });

  ///convert from json
  factory ElderlyHistoryDrinkingModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyHistoryDrinkingModelFromJson(json);

  final List<GraphModel> amountToDrink;
}
