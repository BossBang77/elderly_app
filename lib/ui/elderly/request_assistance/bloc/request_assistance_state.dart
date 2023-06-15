part of 'request_assistance_bloc.dart';

abstract class RequestAssistanceState extends Equatable {
  const RequestAssistanceState();

  @override
  List<Object> get props => [];
}

class RequestAssistanceInitial extends RequestAssistanceState {}

enum AssistanceStatus {
  emergencyCall,
}
