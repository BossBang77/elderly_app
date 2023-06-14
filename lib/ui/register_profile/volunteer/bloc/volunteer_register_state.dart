part of 'volunteer_register_bloc.dart';

enum RegisterStatus { initial, loading, success, fail }

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
    this.status = RegisterStatus.initial,
    this.name = '',
    this.cid = '',
    this.birthDate = '',
    this.sex = '',
    this.registerData = const RegisterModel(),
  });

  ///initial
  const VolunteerRegisterState.initial() : this();

  final RegisterStatus status;
  final String name;
  final String cid;
  final String birthDate;
  final String sex;
  final RegisterModel registerData;

  VolunteerRegisterState copyWth({
    RegisterStatus? status,
    String? name,
    String? cid,
    String? birthDate,
    String? sex,
    RegisterModel? registerData,
  }) {
    return VolunteerRegisterState(
      status: status ?? this.status,
      name: name ?? this.name,
      cid: cid ?? this.cid,
      birthDate: birthDate ?? this.birthDate,
      sex: sex ?? this.sex,
      registerData: registerData ?? this.registerData,
    );
  }

  @override
  List<Object> get props => [
        status,
        name,
        cid,
        birthDate,
        sex,
        registerData,
      ];
}
