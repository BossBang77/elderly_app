import 'package:json_annotation/json_annotation.dart';

import 'elderly_history_exercise_model.dart';

part 'elderly_history_exercise_response.g.dart';

@JsonSerializable()
class ElderlyHistoryExerciseResponse {
  const ElderlyHistoryExerciseResponse({
    this.data = const ElderlyHistoryExerciseModel(),
  });

  ///convert from json
  factory ElderlyHistoryExerciseResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyHistoryExerciseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyHistoryExerciseResponseToJson(this);

  final ElderlyHistoryExerciseModel data;

  ElderlyHistoryExerciseResponse get empty => ElderlyHistoryExerciseResponse();
}
