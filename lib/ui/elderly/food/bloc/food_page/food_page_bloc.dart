import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_event.dart';
import 'package:health_application/ui/elderly/food/bloc/food_page/food_page_state.dart';

class FoodPageBloc extends Bloc<FoodPageEvent, FoodPageState> {
  FoodPageBloc(): super(FoodPageState());
}