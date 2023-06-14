part of 'appointment_card_bloc.dart';

class AppointmentCardEvent extends Equatable {
  const AppointmentCardEvent();

  @override
  List<Object> get props => [];
}

class SetUID extends AppointmentCardEvent {
  final String uid;
  const SetUID({required this.uid});
  @override
  List<Object> get props => [uid];
}

class GetAppointList extends AppointmentCardEvent {
  const GetAppointList();
}
