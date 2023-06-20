part of 'request_assistance_bloc.dart';

class RequestAssistanceEvent extends Equatable {
  const RequestAssistanceEvent();

  @override
  List<Object> get props => [];
}

class GetAssistanceDatail extends RequestAssistanceEvent {
  final String emergencyId;
  const GetAssistanceDatail({this.emergencyId = ''});

  @override
  List<Object> get props => [emergencyId];
}

class GetElderlyProfile extends RequestAssistanceEvent {
  final String id;
  const GetElderlyProfile({this.id = ''});

  @override
  List<Object> get props => [id];
}

class SetInitialEvent extends RequestAssistanceEvent {
  const SetInitialEvent();
}
