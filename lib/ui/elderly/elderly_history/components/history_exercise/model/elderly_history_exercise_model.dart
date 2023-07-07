import 'package:health_application/ui/elderly/elderly_history/components/history_food/model/graph_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'elderly_history_exercise_model.g.dart';

@JsonSerializable()
class ElderlyHistoryExerciseModel {
  const ElderlyHistoryExerciseModel({
    this.burnCalories = const [],
    this.timePoints = const [],
  });

  ///convert from json
  factory ElderlyHistoryExerciseModel.fromJson(Map<String, dynamic> json) =>
      _$ElderlyHistoryExerciseModelFromJson(json);

  final List<GraphModel> burnCalories;
  final List<GraphModel> timePoints;
}
