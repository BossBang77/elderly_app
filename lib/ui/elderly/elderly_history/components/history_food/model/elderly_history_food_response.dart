import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_food_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_history_food_response.g.dart';

@JsonSerializable()
class ElderlyHistoryModelResponse {
  const ElderlyHistoryModelResponse({
    this.data = const ElderlyFoodModel(),
  });

  ///convert from json
  factory ElderlyHistoryModelResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyHistoryModelResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyHistoryModelResponseToJson(this);

  final ElderlyFoodModel data;

  ElderlyHistoryModelResponse get empty => ElderlyHistoryModelResponse();
}
