part of 'emergency_detail_card_bloc.dart';

class EmergencyDetailCardState extends Equatable {
  const EmergencyDetailCardState(
      {this.status = EmergencyStatus.WaitingAssistance});
  final EmergencyStatus status;

  EmergencyDetailCardState copyWith({EmergencyStatus? status}) {
    return EmergencyDetailCardState(status: status ?? this.status);
  }

  @override
  List<Object> get props => [status];
}

class EmergencyDetailCardInitial extends EmergencyDetailCardState {}

enum EmergencyStatus { WaitingAssistance, AcceptAssitance }
