part of 'emergency_detail_card_bloc.dart';

class EmergencyDetailCardEvent extends Equatable {
  const EmergencyDetailCardEvent();

  @override
  List<Object> get props => [];
}

class UpdateStatus extends EmergencyDetailCardEvent {
  final EmergencyStatus status;
  const UpdateStatus({this.status = EmergencyStatus.WaitingAssistance});
}

class GetEmergencyList extends EmergencyDetailCardEvent {
  const GetEmergencyList();
}

class AcceptAssistance extends EmergencyDetailCardEvent {
  final SubmitAssistance submitMol;

  const AcceptAssistance({
    required this.submitMol,
  });

  @override
  List<Object> get props => [submitMol];
}
