
import 'package:health_application/ui/elderly/food_log/model/response/meal_record_item.dart';
import 'package:health_application/ui/elderly/food_log/model/response/nutrition_fact_summary.dart';
import 'package:health_application/ui/elderly/food_log/model/response/summary_calorie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_record.g.dart';

@JsonSerializable()
class MealRecord {
  const MealRecord({
    this.nutritionFactSummary = const NutritionFactSummary(),
    this.summaryCalorie = const SummaryCalorie(),
    this.breakfast = const[],
    this.lunch = const[],
    this.snack = const[],
    this.dinner = const[]
  });
  final NutritionFactSummary nutritionFactSummary;
  final SummaryCalorie summaryCalorie;
  final List<MealRecordResponseItem> breakfast;
  final List<MealRecordResponseItem> lunch;
  final List<MealRecordResponseItem> snack;
  final List<MealRecordResponseItem> dinner;

  factory MealRecord.fromJson(Map<String, dynamic> json) =>
      _$MealRecordFromJson(json);
  Map<String, dynamic> toJson() => _$MealRecordToJson(this);

  List<Object?> get props => <Object>[
    nutritionFactSummary,
    summaryCalorie,
    breakfast,
    lunch,
    snack,
    dinner
  ];
}