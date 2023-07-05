import 'package:json_annotation/json_annotation.dart';

import 'elderly_history_drinking_model.dart';

part 'elderly_history_drinking_response.g.dart';

@JsonSerializable()
class ElderlyHistoryDrinkingResponse {
  const ElderlyHistoryDrinkingResponse({
    this.data = const ElderlyHistoryDrinkingModel(),
  });

  ///convert from json
  factory ElderlyHistoryDrinkingResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyHistoryDrinkingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyHistoryDrinkingResponseToJson(this);

  final ElderlyHistoryDrinkingModel data;

  ElderlyHistoryDrinkingResponse get empty => ElderlyHistoryDrinkingResponse();
}
