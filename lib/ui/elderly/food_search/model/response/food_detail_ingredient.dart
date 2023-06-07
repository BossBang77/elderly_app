
import 'package:json_annotation/json_annotation.dart';

part 'food_detail_ingredient.g.dart';

@JsonSerializable()
class FoodDetailIngredient {
  const FoodDetailIngredient({
    this.name = '',
    this.image = '',
    this.unit = 0,
    this.unitName = ''
  });
  final String name;
  final String image;
  final int unit;
  final String unitName;

  List<Object?> get props => <Object>[
    name,
    image,
    unit,
    unitName
  ];

  factory FoodDetailIngredient.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailIngredientFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDetailIngredientToJson(this);
}