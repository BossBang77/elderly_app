import 'package:json_annotation/json_annotation.dart';

part 'food_detail_cooking_method.g.dart';

@JsonSerializable()
class FoodDetailCookingMethod {
  const FoodDetailCookingMethod({
    this.description = '',
    this.image = '',
    this.order = 0
  });
  final String description;
  final String image;
  final int order;

  List<Object?> get props => <Object>[
    description,
    image,
    order
  ];

  factory FoodDetailCookingMethod.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailCookingMethodFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDetailCookingMethodToJson(this);
}