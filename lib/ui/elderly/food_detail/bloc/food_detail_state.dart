import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';

class FoodDetailState extends Equatable {
  const FoodDetailState({required this.food});
  
  final Food food;

  @override
  List<Object?> get props => [food];
}