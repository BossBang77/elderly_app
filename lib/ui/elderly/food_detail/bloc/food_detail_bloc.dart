import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/food/model/food/food.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_event.dart';
import 'package:health_application/ui/elderly/food_detail/bloc/food_detail_state.dart';
import 'package:health_application/ui/elderly/food_search/model/response/food_detail.dart';
import 'package:health_application/ui/elderly/food_search/repository/food_detail_repository.dart';

class FoodDetailBloc extends Bloc<FoodDetailEvent, FoodDetailState> {
  FoodDetailBloc(
      String foodCode, FoodDetailRepositoryProtocol foodDetailRepository)
      : _foodCode = foodCode,
        _foodDetailRepository = foodDetailRepository,
        super(FoodDetailState()) {
    on<FoodDetailFetched>(_onFoodDetailFetched);
    on<FoodDetailIngredientAddMorePlate>(_onIngredientAddMorePlate);
    on<FoodDetailIngredientRemovePlate>(_onIngredientRemovePlate);

    on<LoadFoodDetail>(_fetchFoodDetail);
  }

  String _foodCode;
  FoodDetailRepositoryProtocol _foodDetailRepository;

  void _fetchFoodDetail(
      LoadFoodDetail event, Emitter<FoodDetailState> emit) async {
    emit(state.copyWith(isLoading: true));
    final response = await _foodDetailRepository.getFoodDetaiByCodel(_foodCode);
    response.fold((error) {
      emit(state.copyWith(food: FoodDetail(), isLoading: false));
    }, (response) {
      add(FoodDetailFetched(
        foodDetail: response.data,
      ));
    });
  }

  void _onFoodDetailFetched(
      FoodDetailFetched event, Emitter<FoodDetailState> emit) {
    emit(state.copyWith(food: event.foodDetail, isLoading: false));
  }

  void _onIngredientAddMorePlate(
      FoodDetailIngredientAddMorePlate event, Emitter<FoodDetailState> emit) {
    emit(state.copyWith(
        ingredientNumberOfPlate: state.ingredientNumberOfPlate + 1));
  }

  void _onIngredientRemovePlate(
      FoodDetailIngredientRemovePlate event, Emitter<FoodDetailState> emit) {
    if (state.ingredientNumberOfPlate == 1) {
      return;
    }
    emit(state.copyWith(
        ingredientNumberOfPlate: state.ingredientNumberOfPlate - 1));
  }
}
