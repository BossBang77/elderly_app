import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';

class FoodDetailState extends Equatable {
  const FoodDetailState({
    this.food = const FoodDetail(),
    this.ingredientNumberOfPlate = 1
  });
  
  final FoodDetail food;
  final int ingredientNumberOfPlate;

  @override
  List<Object?> get props => [food, ingredientNumberOfPlate];

  FoodDetailState copyWith({
    FoodDetail? food,
    int? ingredientNumberOfPlate
  }) {
    return FoodDetailState(
      food: food ?? this.food,
      ingredientNumberOfPlate: ingredientNumberOfPlate ?? this.ingredientNumberOfPlate
    );
  }
}