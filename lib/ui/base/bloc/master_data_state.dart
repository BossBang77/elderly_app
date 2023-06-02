part of 'master_data_bloc.dart';

class MasterDataState extends Equatable {
  const MasterDataState(
      {this.congenitalDiseaseMaster = const MasterData(),
      this.allergiesMaster = const MasterData()});
  final MasterData congenitalDiseaseMaster;
  final MasterData allergiesMaster;

  MasterDataState copyWith(
      {MasterData? congenitalDiseaseMaster, MasterData? allergiesMaster}) {
    return MasterDataState(
        congenitalDiseaseMaster:
            congenitalDiseaseMaster ?? this.congenitalDiseaseMaster,
        allergiesMaster: allergiesMaster ?? this.allergiesMaster);
  }

  @override
  List<Object> get props => [congenitalDiseaseMaster, allergiesMaster];
}

class MasterDataInitial extends MasterDataState {}

class MasterCategory {
  String get congenitalDisease => 'congenitalDisease';
  String get allergies => 'allergies';
}
