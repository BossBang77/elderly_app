
import 'package:equatable/equatable.dart';

abstract class FoodLogDetailEvent extends Equatable {
  const FoodLogDetailEvent();

  @override
  List<Object> get props => [];
}

class FoodLogDetailConsumeUnitAdded extends FoodLogDetailEvent {}

class FoodLogDetailConsumeUnitSubstracted extends FoodLogDetailEvent {}

class FoodLogDetailSubmitted extends FoodLogDetailEvent {}

class FoodLogDetailPageInitialized extends FoodLogDetailEvent {}