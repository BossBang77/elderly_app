import 'package:health_application/ui/elderly/food_log/model/request/meal_record_request_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_record_request.g.dart';

@JsonSerializable()
class SaveMealRecordRequest {
  const SaveMealRecordRequest({
    this.breakfast = const[],
    this.lunch = const[],
    this.snack = const[],
    this.dinner = const[]
  });
  factory SaveMealRecordRequest.fromJson(Map<String, dynamic> json) =>
      _$SaveMealRecordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SaveMealRecordRequestToJson(this);

  final List<MealRecordRequestItem> breakfast;
  final List<MealRecordRequestItem> lunch;
  final List<MealRecordRequestItem> snack;
  final List<MealRecordRequestItem> dinner;

  List<Object?> get props => <Object>[breakfast, lunch, snack, dinner];
}