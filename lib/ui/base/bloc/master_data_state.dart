part of 'master_data_bloc.dart';

class MasterDataState extends Equatable {
  const MasterDataState(
      {this.congenitalDiseaseMaster = const MasterData(),
      this.allergiesMaster = const MasterData(),
      this.exerciseTypeMaster = const MasterData()});
  final MasterData congenitalDiseaseMaster;
  final MasterData allergiesMaster;
  final MasterData exerciseTypeMaster;

  MasterDataState copyWith(
      {MasterData? congenitalDiseaseMaster,
      MasterData? allergiesMaster,
      MasterData? exerciseTypeMaster}) {
    return MasterDataState(
        congenitalDiseaseMaster:
            congenitalDiseaseMaster ?? this.congenitalDiseaseMaster,
        allergiesMaster: allergiesMaster ?? this.allergiesMaster,
        exerciseTypeMaster: exerciseTypeMaster ?? this.exerciseTypeMaster);
  }

  @override
  List<Object> get props =>
      [congenitalDiseaseMaster, allergiesMaster, exerciseTypeMaster];
}

class MasterDataInitial extends MasterDataState {}

class MasterCategory {
  String get congenitalDisease => 'congenitalDisease';
  String get allergies => 'allergies';
  String get exerciseType => 'exercise_type';
}
