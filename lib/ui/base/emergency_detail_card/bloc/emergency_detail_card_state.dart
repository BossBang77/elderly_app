part of 'emergency_detail_card_bloc.dart';

class EmergencyDetailCardState extends Equatable {
  const EmergencyDetailCardState(
      {this.status = EmergencyStatus.WaitingAssistance,
      this.requsetAssistanceList = const RequestAssitanceListModel()});
  final EmergencyStatus status;
  final RequestAssitanceListModel requsetAssistanceList;

  EmergencyDetailCardState copyWith(
      {EmergencyStatus? status,
      RequestAssitanceListModel? requsetAssistanceList}) {
    return EmergencyDetailCardState(
        status: status ?? this.status,
        requsetAssistanceList:
            requsetAssistanceList ?? this.requsetAssistanceList);
  }

  @override
  List<Object> get props => [status, requsetAssistanceList];
}

class EmergencyDetailCardInitial extends EmergencyDetailCardState {}

enum EmergencyStatus { WaitingAssistance, AcceptAssitance }
