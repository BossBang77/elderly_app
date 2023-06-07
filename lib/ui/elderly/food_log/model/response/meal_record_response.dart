import 'package:health_application/ui/elderly/food_log/model/response/meal_record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_record_response.g.dart';

@JsonSerializable()
class MealRecordResponse {
  const MealRecordResponse({this.data = const MealRecord()});

  final MealRecord data;

  factory MealRecordResponse.fromJson(Map<String, dynamic> json) =>
      _$MealRecordResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MealRecordResponseToJson(this);

  List<Object?> get props => <Object>[data];
}
