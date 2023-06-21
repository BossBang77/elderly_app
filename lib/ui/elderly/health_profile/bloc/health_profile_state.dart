part of 'health_profile_bloc.dart';

class HealthProfileState extends Equatable {
  const HealthProfileState(
      {this.pageView = PageViewWidget.summary,
      this.currentProfile = const RegisterModel(),
      this.masterProfile = const RegisterModel(),
      this.textFilterAllergies = '',
      this.textFilterDisease = '',
      this.statusUpdate = StatusUpdate.initial});
  final PageViewWidget pageView;
  final RegisterModel masterProfile;
  final RegisterModel currentProfile;
  final String textFilterAllergies;
  final String textFilterDisease;
  final StatusUpdate statusUpdate;

  HealthProfileState copyWith(
      {PageViewWidget? pageView,
      RegisterModel? masterProfile,
      RegisterModel? currentProfile,
      String? textFilterAllergies,
      String? textFilterDisease,
      StatusUpdate? statusUpdate}) {
    return HealthProfileState(
        pageView: pageView ?? this.pageView,
        masterProfile: masterProfile ?? this.masterProfile,
        currentProfile: currentProfile ?? this.currentProfile,
        textFilterAllergies: textFilterAllergies ?? this.textFilterAllergies,
        textFilterDisease: textFilterDisease ?? this.textFilterDisease,
        statusUpdate: statusUpdate ?? this.statusUpdate);
  }

  @override
  List<Object> get props => [
        pageView,
        masterProfile,
        currentProfile,
        textFilterAllergies,
        textFilterDisease,
        statusUpdate
      ];
}

class HealthProfileInitial extends HealthProfileState {}

enum PageViewWidget {
  summary,
  gender,
  height,
  weight,
  age,
  dateOfBirth,
  bmi,
  foodAllergies,
  disease
}

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
  addDisease,
  delDisease,
  delAllDisease,
  searchDisease,
  addAllergies,
  delAllergies,
  delAllAllergies,
  searchAllergies,
  volunteerCode,
  resetAllergies,
  resetDisease,
  birthDate
}

enum StatusUpdate { initial, updateSuccess, updateFail }
