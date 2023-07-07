import 'package:health_application/ui/elderly/food_search/model/response/food_detail_cooking_method.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_ingredient.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail_nutrition.dart';
import 'package:health_application/ui/register_profile/model/sub_menu_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_detail.g.dart';

@JsonSerializable()
class FoodDetail {
  const FoodDetail(
      {this.code = '',
      this.name = '',
      this.image = '',
      this.description = '',
      this.cookingTime = 0,
      this.nutrition = const FoodDetailNutrition(),
      this.cookingMethods = const [],
      this.ingredients = const [],
      this.types = const <SubMenuModel>[]});
  final String code;
  final String name;
  final String image;
  final String description;
  final double cookingTime;
  final FoodDetailNutrition nutrition;
  final List<FoodDetailCookingMethod> cookingMethods;
  final List<FoodDetailIngredient> ingredients;
  final List<SubMenuModel> types;

  String getTypeList() {
    return types.map((e) => e.name).join(',');
  }

  List<Object?> get props => <Object>[
        code,
        name,
        image,
        description,
        cookingTime,
        cookingMethods,
        nutrition,
        ingredients,
        types
      ];

  factory FoodDetail.fromJson(Map<String, dynamic> json) =>
      _$FoodDetailFromJson(json);
  Map<String, dynamic> toJson() => _$FoodDetailToJson(this);
}
