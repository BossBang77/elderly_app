import 'package:health_application/ui/elderly/elderly_history/components/history_drinking/model/elderly_drinking_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_log_drinking_response.g.dart';

@JsonSerializable()
class ElderlyLogDrinkingResponse {
  const ElderlyLogDrinkingResponse({
    this.data = const [],
  });

  ///convert from json
  factory ElderlyLogDrinkingResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyLogDrinkingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyLogDrinkingResponseToJson(this);

  final List<ElderlyDrinkingModel> data;

  ElderlyLogDrinkingResponse get empty => ElderlyLogDrinkingResponse();
}
