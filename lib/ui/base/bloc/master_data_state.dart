part of 'master_data_bloc.dart';

class MasterDataState extends Equatable {
  const MasterDataState(
      {this.congenitalDiseaseMaster = const MasterData(),
      this.allergiesMaster = const MasterData(),
      this.exerciseTypeMaster = const MasterData(),
      this.appointmentTime = const MasterData(),
      this.appointmentType = const MasterData(),
      this.medicationIntakeTime = const MasterData(),
      this.notificationEveryHour = const MasterData(),
      this.foodType = const MasterData()});
  final MasterData congenitalDiseaseMaster;
  final MasterData allergiesMaster;
  final MasterData exerciseTypeMaster;
  final MasterData appointmentTime;
  final MasterData appointmentType;
  final MasterData medicationIntakeTime;
  final MasterData notificationEveryHour;
  final MasterData foodType;

  MasterDataState copyWith(
      {MasterData? congenitalDiseaseMaster,
      MasterData? allergiesMaster,
      MasterData? exerciseTypeMaster,
      MasterData? appointmentTime,
      MasterData? appointmentType,
      MasterData? medicationIntakeTime,
      MasterData? notificationEveryHour,
      MasterData? foodType}) {
    return MasterDataState(
        congenitalDiseaseMaster:
            congenitalDiseaseMaster ?? this.congenitalDiseaseMaster,
        allergiesMaster: allergiesMaster ?? this.allergiesMaster,
        exerciseTypeMaster: exerciseTypeMaster ?? this.exerciseTypeMaster,
        appointmentTime: appointmentTime ?? this.appointmentTime,
        appointmentType: appointmentType ?? this.appointmentType,
        medicationIntakeTime: medicationIntakeTime ?? this.medicationIntakeTime,
        notificationEveryHour:
            notificationEveryHour ?? this.notificationEveryHour,
        foodType: foodType ?? this.foodType);
  }

  @override
  List<Object> get props => [
        congenitalDiseaseMaster,
        allergiesMaster,
        exerciseTypeMaster,
        appointmentTime,
        appointmentType,
        medicationIntakeTime,
        notificationEveryHour,
        foodType
      ];
}

class MasterDataInitial extends MasterDataState {}

class MasterCategory {
  String get congenitalDisease => 'congenitalDisease';
  String get allergies => 'allergies';
  String get exerciseType => 'exercise_type';
  String get appointmentTime => 'appointment_time';
  String get appointmentType => 'appointment_type';
  String get medicationIntakeTime => 'medication_intake_time';
  String get notificationEveryHour => 'notification_every_hour';
  String get foodType => 'food_type';
}
