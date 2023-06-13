part of 'appointment_card_bloc.dart';

class AppointmentCardState extends Equatable {
  const AppointmentCardState(
      {this.uid = '', this.appointList = const AppointList()});

  final String uid;
  final AppointList appointList;

  AppointmentCardState copyWith({String? uid, AppointList? appointList}) {
    return AppointmentCardState(
        uid: uid ?? this.uid, appointList: appointList ?? this.appointList);
  }

  @override
  List<Object> get props => [uid, appointList];
}

class AppointmentCardInitial extends AppointmentCardState {}

enum AppointStatus { CREATE, WAITING_TO_START, START, COMPLETE, REJECT }
