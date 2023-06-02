import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_event.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_state.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  FoodDetailBloc(Food food): food = food, super(FoodDetailState(food: food));

  Food food;
}