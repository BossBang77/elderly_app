part of 'master_data_bloc.dart';

class MasterDataState extends Equatable {
  const MasterDataState({
    this.congenitalDiseaseMaster = const MasterData(),
    this.allergiesMaster = const MasterData(),
    this.exerciseTypeMaster = const MasterData(),
    this.appointmentTime = const MasterData(),
    this.appointmentType = const MasterData(),
  });
  final MasterData congenitalDiseaseMaster;
  final MasterData allergiesMaster;
  final MasterData exerciseTypeMaster;
  final MasterData appointmentTime;
  final MasterData appointmentType;

  MasterDataState copyWith(
      {MasterData? congenitalDiseaseMaster,
      MasterData? allergiesMaster,
      MasterData? exerciseTypeMaster,
      MasterData? appointmentTime,
      MasterData? appointmentType}) {
    return MasterDataState(
        congenitalDiseaseMaster:
            congenitalDiseaseMaster ?? this.congenitalDiseaseMaster,
        allergiesMaster: allergiesMaster ?? this.allergiesMaster,
        exerciseTypeMaster: exerciseTypeMaster ?? this.exerciseTypeMaster,
        appointmentTime: appointmentTime ?? this.appointmentTime,
        appointmentType: appointmentType ?? this.appointmentType);
  }

  @override
  List<Object> get props => [
        congenitalDiseaseMaster,
        allergiesMaster,
        exerciseTypeMaster,
        appointmentTime,
        appointmentType
      ];
}

class MasterDataInitial extends MasterDataState {}

class MasterCategory {
  String get congenitalDisease => 'congenitalDisease';
  String get allergies => 'allergies';
  String get exerciseType => 'exercise_type';
  String get appointmentTime => 'appointment_time';
  String get appointmentType => 'appointment_type';
}
