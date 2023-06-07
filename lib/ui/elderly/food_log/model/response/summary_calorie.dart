import 'package:json_annotation/json_annotation.dart';

part 'summary_calorie.g.dart';

@JsonSerializable()
class SummaryCalorie {
  const SummaryCalorie({this.breakfast = 0, this.lunch = 0, this.snack = 0, this.dinner = 0});
  final double breakfast;
  final double lunch;
  final double snack;
  final double dinner;
  
  factory SummaryCalorie.fromJson(Map<String, dynamic> json) =>
      _$SummaryCalorieFromJson(json);
  Map<String, dynamic> toJson() => _$SummaryCalorieToJson(this);

  List<Object?> get props => <Object>[
    breakfast,
    lunch,
    snack,
    dinner
  ];
}