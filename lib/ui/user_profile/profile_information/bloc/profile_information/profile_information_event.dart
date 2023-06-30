part of 'profile_information_bloc.dart';

abstract class ProfileInformationEvent extends Equatable {
  const ProfileInformationEvent();

  @override
  List<Object> get props => [];
}

class UploadImageProfile extends ProfileInformationEvent {
  final XFile? img;
  const UploadImageProfile({this.img});
  @override
  List<Object> get props => [img!];
}

class SetIntitalData extends ProfileInformationEvent {
  final RegisterModel profile;
  const SetIntitalData({required this.profile});
  @override
  List<Object> get props => [profile];
}

class ChangeName extends ProfileInformationEvent {
  final String name;
  const ChangeName({this.name = ''});

  @override
  List<Object> get props => [name];
}

class ChangeElderlyCode extends ProfileInformationEvent {
  final String elderlyCode;
  const ChangeElderlyCode({this.elderlyCode = ''});

  @override
  List<Object> get props => [elderlyCode];
}

class ChangePhoneNumber extends ProfileInformationEvent {
  final String phoneNumber;
  const ChangePhoneNumber({this.phoneNumber = ''});

  @override
  List<Object> get props => [phoneNumber];
}

class SubmitProfile extends ProfileInformationEvent {
  const SubmitProfile();
}

class InitialSubmitStatus extends ProfileInformationEvent {
  const InitialSubmitStatus();
}
