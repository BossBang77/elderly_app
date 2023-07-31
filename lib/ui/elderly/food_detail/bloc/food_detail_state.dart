import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';

class FoodDetailState extends Equatable {
  const FoodDetailState(
      {this.food = const FoodDetail(),
      this.ingredientNumberOfPlate = 1,
      this.isLoading = false});

  final FoodDetail food;
  final int ingredientNumberOfPlate;
  final bool isLoading;

  @override
  List<Object?> get props => [food, ingredientNumberOfPlate, isLoading];

  FoodDetailState copyWith(
      {FoodDetail? food, int? ingredientNumberOfPlate, bool? isLoading}) {
    return FoodDetailState(
        food: food ?? this.food,
        ingredientNumberOfPlate:
            ingredientNumberOfPlate ?? this.ingredientNumberOfPlate,
        isLoading: isLoading ?? this.isLoading);
  }
}
