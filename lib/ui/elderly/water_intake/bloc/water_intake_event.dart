part of 'water_intake_bloc.dart';

abstract class WaterIntakeEvent extends Equatable {
  const WaterIntakeEvent();

  @override
  List<Object> get props => [];
}

class AddIntakeWater extends WaterIntakeEvent {
  final IntakeWaterModel intakeWater;
  const AddIntakeWater({required this.intakeWater});
}

class EditIntakeWater extends WaterIntakeEvent {
  final IntakeWaterModel intakeWater;
  final int index;
  const EditIntakeWater({required this.intakeWater, required this.index});
}

class RemoveIntakeWater extends WaterIntakeEvent {
  final int index;
  const RemoveIntakeWater({required this.index});
}
