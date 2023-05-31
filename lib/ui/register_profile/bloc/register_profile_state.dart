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

enum FillType {
  role,
  username,
  password,
  elderlyCareCode,
  name,
  gender,
  age,
  weightDetail,
  heightDetail,
}

enum RoleType { initial, ROLE_USER_ELDERLY, volunteer }

enum Gender { initial, male, female }

enum SubmitStatus { initial, loading, success, fail }

class RegisterProfileState extends Equatable {
  const RegisterProfileState(
      {this.profileType = ProfileType.role,
      this.profileView = ProfileView.register,
      this.bmiDetail = BMIDetail.gender,
      this.roleType = RoleType.initial,
      this.gender = Gender.initial,
      this.registerModel = const RegisterModel(),
      this.bmiValue = 0,
      this.status = SubmitStatus.initial,
      this.obscurePassword = true});
  final ProfileView profileView;
  final ProfileType profileType;
  final BMIDetail bmiDetail;
  final RoleType roleType;
  final Gender gender;
  final RegisterModel registerModel;
  final double bmiValue;
  final SubmitStatus status;
  final bool obscurePassword;
  RegisterProfileState copyWith(
      {ProfileView? profileView,
      ProfileType? profileType,
      BMIDetail? bmiDetail,
      RoleType? roleType,
      Gender? gender,
      RegisterModel? registerModel,
      double? bmiValue,
      SubmitStatus? status,
      bool? obscurePassword}) {
    return RegisterProfileState(
        profileView: profileView ?? this.profileView,
        profileType: profileType ?? this.profileType,
        bmiDetail: bmiDetail ?? this.bmiDetail,
        roleType: roleType ?? this.roleType,
        gender: gender ?? this.gender,
        registerModel: registerModel ?? this.registerModel,
        bmiValue: bmiValue ?? this.bmiValue,
        status: status ?? this.status,
        obscurePassword: obscurePassword ?? this.obscurePassword);
  }

  @override
  List<Object> get props => [
        profileType,
        profileView,
        bmiDetail,
        roleType,
        gender,
        registerModel,
        bmiValue,
        status,
        obscurePassword
      ];
}

class RegisterProfileInitial extends RegisterProfileState {}
