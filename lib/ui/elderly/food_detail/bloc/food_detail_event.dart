import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';

abstract class FoodDetailEvent extends Equatable {
  const FoodDetailEvent();
  @override
  List<Object?> get props => [];
}

class FoodDetailFetched extends FoodDetailEvent {
  const FoodDetailFetched({required this.foodDetail});

  final FoodDetail foodDetail;

  @override
  List<Object?> get props => [foodDetail];
}

class FoodDetailIngredientAddMorePlate extends FoodDetailEvent {}

class FoodDetailIngredientRemovePlate extends FoodDetailEvent {}