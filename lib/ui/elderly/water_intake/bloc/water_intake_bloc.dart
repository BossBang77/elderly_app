import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/gestures.dart';
import 'package:health_application/repository/water_intake_repos.dart';
import 'package:health_application/ui/base/model/failure.dart';
import 'package:health_application/ui/elderly/water_intake/model/daily_drinking.dart';
import 'package:health_application/ui/elderly/water_intake/model/daily_drinking_list.dart';
import 'package:health_application/ui/elderly/water_intake/model/intake_water_model.dart';
import 'package:health_application/ui/elderly/water_intake/model/volumn_type.dart';
import 'package:health_application/ui/elderly/water_intake/model/water_intake_goal.dart';

part 'water_intake_event.dart';
part 'water_intake_state.dart';

class WaterIntakeBloc extends Bloc<WaterIntakeEvent, WaterIntakeState> {
  WaterIntakeBloc() : super(WaterIntakeInitial()) {}
  WaterIntakeRepository _waterIntakeRepository = WaterIntakeRepository();

  @override
  Stream<WaterIntakeState> mapEventToState(WaterIntakeEvent event) async* {
    if (event is AddIntakeWater) {
      var res = await _waterIntakeRepository.addDailyWater(event.intakeWater);

      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmitIntake.addDailyWaterFail);
      }, (String res) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmitIntake.addDailyWaterSuccess);
        add(GetDrinkingWaterGoal());
        add(GetDailyDrinkingList());
      });
    }

    if (event is EditIntakeWater) {
      var res =
          await _waterIntakeRepository.updateDailyWater(event.intakeWater);

      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmitIntake.addDailyWaterFail);
      }, (String res) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmitIntake.addDailyWaterSuccess);
        add(GetDrinkingWaterGoal());
        add(GetDailyDrinkingList());
      });
    }

    if (event is RemoveIntakeWater) {
      var res = await _waterIntakeRepository.removeDailyWater(event.id);

      yield* res.fold((Failure err) async* {
        yield state.copyWith(statusSubmit: StatusSubmitIntake.removeFail);
      }, (String res) async* {
        yield state.copyWith(statusSubmit: StatusSubmitIntake.removeSuccess);
        add(GetDrinkingWaterGoal());
        add(GetDailyDrinkingList());
      });
    }
    if (event is Initial) {
      add(GetDrinkingWaterGoal());
      add(GetDailyDrinkingList());
    }

    if (event is GetDrinkingWaterGoal) {
      var res = await _waterIntakeRepository.getWaterdrinkingGoal();
      yield* res.fold((Failure err) async* {
        yield state.copyWith(
            waterIntakeGoal: WaterIntakeGoalModel(),
            masterWaterIntakeGoal: WaterIntakeGoalModel());
      }, (WaterIntakeGoalModel res) async* {
        yield state.copyWith(waterIntakeGoal: res, masterWaterIntakeGoal: res);
      });
    }

    if (event is ChangeGoalDrinking) {
      var masterWaterGoal = state.waterIntakeGoal;
      masterWaterGoal = masterWaterGoal.copyWith(target: event.newGoal);
      yield state.copyWith(waterIntakeGoal: masterWaterGoal);
    }

    if (event is SubmitUpdateGoalDrinking) {
      var res = await _waterIntakeRepository
          .updateWaterdrinkingGoal(state.waterIntakeGoal.target.toInt());
      yield* res.fold((Failure err) async* {
        yield state.copyWith(statusSubmit: StatusSubmitIntake.updateGoalFail);
      }, (String res) async* {
        yield state.copyWith(
            statusSubmit: StatusSubmitIntake.updateGoalSuccess);
        add(GetDrinkingWaterGoal());
      });
    }

    if (event is SetStatusSubmit) {
      yield state.copyWith(statusSubmit: event.statusSubmitIntake);
    }

    if (event is ResetGoalToMaster) {
      var masterWaterGoal = state.waterIntakeGoal;
      masterWaterGoal =
          masterWaterGoal.copyWith(target: state.masterWaterIntakeGoal.target);
      yield state.copyWith(waterIntakeGoal: masterWaterGoal);
    }

    if (event is GetDailyDrinkingList) {
      var res = await _waterIntakeRepository.getDailyWaterList();

      yield* res.fold((Failure err) async* {
        var dailyWater = state.dailyWaterList;
        dailyWater = dailyWater.copyWith(data: []);
        yield state.copyWith(dailyWaterList: dailyWater);
      }, (DailyWaterListModel res) async* {
        yield state.copyWith(dailyWaterList: res);
      });
    }

    if (event is CalculateDrinking) {
      //  '[น้ำหนัก x 2.2 x 30/2] /1000 = ปริมาณน้ำ (ลิตร)',
      double weight = event.weight;
      int water = (((weight * 2.2 * (30 / 2)) / 1000) * 1000).ceil();
      var masterWaterGoal = state.waterIntakeGoal;
      masterWaterGoal = masterWaterGoal.copyWith(target: water);
      yield state.copyWith(waterIntakeGoal: masterWaterGoal);
    }
  }
}
