part of 'profile_information_bloc.dart';

class ProfileInformationState extends Equatable {
  final XFile? pickedFile;
  final bool isLoading;
  final RegisterModel profile;
  final SubmitStatus submitStatus;
  final String role;

  ProfileInformationState copyWith(
      {XFile? pickedFile,
      bool? isLoading,
      RegisterModel? profile,
      SubmitStatus? submitStatus,
      String? role}) {
    return ProfileInformationState(
        pickedFile: pickedFile ?? this.pickedFile,
        isLoading: isLoading ?? this.isLoading,
        submitStatus: submitStatus ?? this.submitStatus,
        profile: profile ?? this.profile,
        role: role ?? this.role);
  }

  ProfileInformationState.initial(
      {this.pickedFile,
      this.isLoading = false,
      this.profile = const RegisterModel(),
      this.submitStatus = SubmitStatus.initial,
      this.role = ''});

  const ProfileInformationState(
      {this.pickedFile,
      this.isLoading = false,
      this.profile = const RegisterModel(),
      this.submitStatus = SubmitStatus.initial,
      this.role = ''});

  @override
  List<Object> get props => [pickedFile ?? '', isLoading, profile, role];
}

class ProfileInformationInitial extends ProfileInformationState {}

enum SubmitStatus {
  initial,
  uploadImgFail,
  uploadImgSuccess,
  submitFail,
  submitSuccess
}
