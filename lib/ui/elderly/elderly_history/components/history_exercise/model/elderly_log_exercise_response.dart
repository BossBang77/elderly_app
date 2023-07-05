import 'package:health_application/ui/elderly/elderly_history/components/history_exercise/model/elderly_exercise_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_log_exercise_response.g.dart';

@JsonSerializable()
class ElderlyLogExerciseResponse {
  const ElderlyLogExerciseResponse({
    this.data = const [],
  });

  ///convert from json
  factory ElderlyLogExerciseResponse.fromJson(Map<String, dynamic> json) =>
      _$ElderlyLogExerciseResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ElderlyLogExerciseResponseToJson(this);

  final List<ElderlyExerciseModel> data;

  ElderlyLogExerciseResponse get empty => ElderlyLogExerciseResponse();
}
