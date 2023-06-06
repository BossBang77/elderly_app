import 'package:json_annotation/json_annotation.dart';

part 'meal_record_item.g.dart';

@JsonSerializable()
class MealRecordResponseItem {
  const MealRecordResponseItem({
    this.id = '',
    this.code = '',
    this.unit = 0,
    this.calorie = 0,
    this.mame = ''
  });
  final String id;
  final String code;
  final int unit;
  final double calorie;
  final String mame;

  factory MealRecordResponseItem.fromJson(Map<String, dynamic> json) =>
      _$MealRecordResponseItemFromJson(json);
  Map<String, dynamic> toJson() => _$MealRecordResponseItemToJson(this);

  List<Object?> get props => <Object>[
    id,
    code,
    unit,
    calorie,
    mame
  ];
}