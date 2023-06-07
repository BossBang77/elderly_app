part of 'water_intake_bloc.dart';

class WaterIntakeState extends Equatable {
  const WaterIntakeState(
      {this.intakeWaterModel = const <IntakeWaterModel>[],
      this.waterIntakeGoal = const WaterIntakeGoalModel(),
      this.statusSubmit = StatusSubmitIntake.initial,
      this.masterWaterIntakeGoal = const WaterIntakeGoalModel(),
      this.dailyWaterList = const DailyWaterListModel()});
  final List<IntakeWaterModel> intakeWaterModel;
  final WaterIntakeGoalModel waterIntakeGoal;
  final WaterIntakeGoalModel masterWaterIntakeGoal;
  final StatusSubmitIntake statusSubmit;
  final DailyWaterListModel dailyWaterList;

  WaterIntakeState copyWith(
      {List<IntakeWaterModel>? intakeWaterModel,
      WaterIntakeGoalModel? waterIntakeGoal,
      WaterIntakeGoalModel? masterWaterIntakeGoal,
      StatusSubmitIntake? statusSubmit,
      DailyWaterListModel? dailyWaterList}) {
    return WaterIntakeState(
        intakeWaterModel: intakeWaterModel ?? this.intakeWaterModel,
        waterIntakeGoal: waterIntakeGoal ?? this.waterIntakeGoal,
        statusSubmit: statusSubmit ?? this.statusSubmit,
        masterWaterIntakeGoal:
            masterWaterIntakeGoal ?? this.masterWaterIntakeGoal,
        dailyWaterList: dailyWaterList ?? this.dailyWaterList);
  }

  @override
  List<Object> get props => [
        intakeWaterModel,
        waterIntakeGoal,
        statusSubmit,
        masterWaterIntakeGoal,
        dailyWaterList
      ];
}

class WaterIntakeInitial extends WaterIntakeState {}

var volumnTypeList = [
  VolumnTypeModel(
      code: '250', volumePic: 'assets/images/250ml.png', volumeQuantity: 250),
  VolumnTypeModel(
      code: '500', volumePic: 'assets/images/500ml.png', volumeQuantity: 500),
  VolumnTypeModel(
      code: '600', volumePic: 'assets/images/600ml.png', volumeQuantity: 600),
  VolumnTypeModel(
      code: '900', volumePic: 'assets/images/900ml.png', volumeQuantity: 900),
  VolumnTypeModel(
      code: '1500',
      volumePic: 'assets/images/1500ml.png',
      volumeQuantity: 1500),
  VolumnTypeModel(code: 'custom', volumePic: 'assets/images/customize.png')
];

enum StatusSubmitIntake {
  initial,
  updateGoalSuccess,
  updateGoalFail,
  addDailyWaterSuccess,
  addDailyWaterFail,
  removeFail,
  removeSuccess
}
