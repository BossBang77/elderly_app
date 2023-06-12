import 'package:json_annotation/json_annotation.dart';

part 'food_search_item.g.dart';

@JsonSerializable()
class FoodSearchItem {
  const FoodSearchItem({
    this.name = '',
    this.code = '',
    this.calorie = 0,
    this.image = ''
  });

  final String name;
  final String code;
  final double calorie;
  final String image;

  factory FoodSearchItem.fromJson(Map<String, dynamic> json) =>
      _$FoodSearchItemFromJson(json);
  Map<String, dynamic> toJson() => _$FoodSearchItemToJson(this);

  List<Object?> get props => <Object>[
    name,
    code,
    calorie
  ];
}