part of 'profile_information_bloc.dart';

class ProfileInformationState extends Equatable {
  final XFile? pickedFile;
  final bool isLoading;
  final RegisterModel profile;
  final SubmitStatus submitStatus;

  ProfileInformationState copyWith({
    XFile? pickedFile,
    bool? isLoading,
    RegisterModel? profile,
    SubmitStatus? submitStatus,
  }) {
    return ProfileInformationState(
        pickedFile: pickedFile ?? this.pickedFile,
        isLoading: isLoading ?? this.isLoading,
        submitStatus: submitStatus ?? this.submitStatus,
        profile: profile ?? this.profile);
  }

  ProfileInformationState.initial(
      {this.pickedFile,
      this.isLoading = false,
      this.profile = const RegisterModel(),
      this.submitStatus = SubmitStatus.initial});

  const ProfileInformationState(
      {this.pickedFile,
      this.isLoading = false,
      this.profile = const RegisterModel(),
      this.submitStatus = SubmitStatus.initial});

  @override
  List<Object> get props => [pickedFile ?? '', isLoading, profile];
}

class ProfileInformationInitial extends ProfileInformationState {}

enum SubmitStatus {
  initial,
  uploadImgFail,
  uploadImgSuccess,
  submitFail,
  submitSuccess
}
