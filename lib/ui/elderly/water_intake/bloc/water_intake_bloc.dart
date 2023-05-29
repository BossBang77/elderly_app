import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/water_intake/model/intake_water_model.dart';
import 'package:health_application/ui/elderly/water_intake/model/volumn_type.dart';

part 'water_intake_event.dart';
part 'water_intake_state.dart';

class WaterIntakeBloc extends Bloc<WaterIntakeEvent, WaterIntakeState> {
  WaterIntakeBloc() : super(WaterIntakeInitial()) {}
  @override
  Stream<WaterIntakeState> mapEventToState(WaterIntakeEvent event) async* {
    if (event is AddIntakeWater) {
      List<IntakeWaterModel> oldList = [...state.intakeWaterModel];
      oldList.add(event.intakeWater);

      yield state.copyWith(intakeWaterModel: oldList);
    }

    if (event is EditIntakeWater) {
      List<IntakeWaterModel> oldList = [...state.intakeWaterModel];
      oldList[event.index] = oldList[event.index].copyWith(
          volumeName: event.intakeWater.volumeName,
          volumeQuantity: event.intakeWater.volumeQuantity,
          volumeValue: event.intakeWater.volumeValue);
      yield state.copyWith(intakeWaterModel: oldList);
    }

    if (event is RemoveIntakeWater) {
      List<IntakeWaterModel> oldList = [...state.intakeWaterModel];
      oldList.removeAt(event.index);
      yield state.copyWith(intakeWaterModel: oldList);
    }
  }
}
