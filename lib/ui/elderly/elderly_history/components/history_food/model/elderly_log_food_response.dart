import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/elderly_log_food_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_log_food_response.g.dart';

@JsonSerializable()
class ElderlyLogFoodResponse {
  const ElderlyLogFoodResponse({
    this.data = const ElderlyLogFoodModel(),
  });

  ///convert from json
  factory ElderlyLogFoodResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyLogFoodResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyLogFoodResponseToJson(this);

  final ElderlyLogFoodModel data;

  ElderlyLogFoodResponse get empty => ElderlyLogFoodResponse();
}
