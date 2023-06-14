import 'package:equatable/equatable.dart';

abstract class AppointmentDetailEvent extends Equatable {
  const AppointmentDetailEvent();

  @override
  List<Object?> get props => [];
}

class AppointmentStatusChanged extends AppointmentDetailEvent {
  const AppointmentStatusChanged({required this.status});
  final String status;

  @override
  List<Object?> get props => [status];
}