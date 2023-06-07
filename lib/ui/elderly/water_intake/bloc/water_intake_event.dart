part of 'water_intake_bloc.dart';

abstract class WaterIntakeEvent extends Equatable {
  const WaterIntakeEvent();

  @override
  List<Object> get props => [];
}

class AddIntakeWater extends WaterIntakeEvent {
  final DailyWaterModel intakeWater;
  const AddIntakeWater({required this.intakeWater});
}

class EditIntakeWater extends WaterIntakeEvent {
  final DailyWaterModel intakeWater;

  const EditIntakeWater({
    required this.intakeWater,
  });
}

class RemoveIntakeWater extends WaterIntakeEvent {
  final String id;
  const RemoveIntakeWater({required this.id});
}

class GetDrinkingWaterGoal extends WaterIntakeEvent {
  const GetDrinkingWaterGoal();
}

class Initial extends WaterIntakeEvent {
  const Initial();
}

class ChangeGoalDrinking extends WaterIntakeEvent {
  final int newGoal;
  const ChangeGoalDrinking({required this.newGoal});
  @override
  List<Object> get props => [newGoal];
}

class SubmitUpdateGoalDrinking extends WaterIntakeEvent {
  const SubmitUpdateGoalDrinking();
  @override
  List<Object> get props => [];
}

class SetStatusSubmit extends WaterIntakeEvent {
  final StatusSubmitIntake statusSubmitIntake;
  const SetStatusSubmit({required this.statusSubmitIntake});
  @override
  List<Object> get props => [statusSubmitIntake];
}

class ResetGoalToMaster extends WaterIntakeEvent {
  const ResetGoalToMaster();
}

class GetDailyDrinkingList extends WaterIntakeEvent {
  const GetDailyDrinkingList();
}
