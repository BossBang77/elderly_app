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
