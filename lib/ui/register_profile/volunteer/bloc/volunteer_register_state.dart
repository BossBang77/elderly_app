part of 'volunteer_register_bloc.dart';

enum RegisterStatus { initial, loading, success }

enum FormFieldType {
  name,
  cid,
  birthDate,
  sex,
}

enum SexType {
  MALE,
  FEMALE,
}

class VolunteerRegisterState extends Equatable {
  const VolunteerRegisterState({
    this.name = '',
    this.cid = '',
    this.birthDate = '',
    this.sex = '',
  });

  ///initial
  const VolunteerRegisterState.initial() : this();

  final String name;
  final String cid;
  final String birthDate;
  final String sex;

  VolunteerRegisterState copyWth({
    String? name,
    String? cid,
    String? birthDate,
    String? sex,
  }) {
    return VolunteerRegisterState(
      name: name ?? this.name,
      cid: cid ?? this.cid,
      birthDate: birthDate ?? this.birthDate,
      sex: sex ?? this.sex,
    );
  }

  @override
  List<Object> get props => [
        name,
        cid,
        birthDate,
        sex,
      ];
}
