part of 'register_profile_bloc.dart';

enum ProfileView { register }

enum ProfileType {
  role,
  privacyProfile,
  bmiProfile,
  disease,
  foodAllergies,
  success
}

enum BMIDetail { gender, name, age, weightDetail, heightDetail, summaryBMI }

enum RoleType { initial, elderly, volunteer }

enum Gender { initial, male, female }

class RegisterProfileState extends Equatable {
  const RegisterProfileState(
      {this.profileType = ProfileType.role,
      this.profileView = ProfileView.register,
      this.bmiDetail = BMIDetail.gender,
      this.roleType = RoleType.initial,
      this.gender = Gender.initial});
  final ProfileView profileView;
  final ProfileType profileType;
  final BMIDetail bmiDetail;
  final RoleType roleType;
  final Gender gender;
  RegisterProfileState copyWith(
      {ProfileView? profileView,
      ProfileType? profileType,
      BMIDetail? bmiDetail,
      RoleType? roleType,
      Gender? gender}) {
    return RegisterProfileState(
        profileView: profileView ?? this.profileView,
        profileType: profileType ?? this.profileType,
        bmiDetail: bmiDetail ?? this.bmiDetail,
        roleType: roleType ?? this.roleType,
        gender: gender ?? this.gender);
  }

  @override
  List<Object> get props =>
      [profileType, profileView, bmiDetail, roleType, gender];
}

class RegisterProfileInitial extends RegisterProfileState {}
