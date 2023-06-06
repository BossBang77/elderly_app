import 'package:health_application/ui/elderly/food_log/repository/meal_record_item.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meal_record_request_item.g.dart';

@JsonSerializable()
class MealRecordRequestItem {
  const MealRecordRequestItem({this.code = '' , this.unit = 0, this.name = ''});
  factory MealRecordRequestItem.fromJson(Map<String, dynamic> json) =>
      _$MealRecordRequestItemFromJson(json);
  Map<String, dynamic> toJson() => _$MealRecordRequestItemToJson(this);

  final String code;
  final int unit;
  final String name;

  List<Object?> get props => <Object>[code, unit, name];

  factory MealRecordRequestItem.fromMealRecordItem(MealRecordItem item) {
    return MealRecordRequestItem(
      code: item.code,
      unit: item.unit,
      name: item.name
    );
  }
}