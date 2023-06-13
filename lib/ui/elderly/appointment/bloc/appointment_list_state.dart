import 'package:equatable/equatable.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/model/response/elderly.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_status_section/appointment_status_section.dart';

class AppointmentListState extends Equatable {
  const AppointmentListState({this.appointments = const[
    Appointment(
      id: '1',
      status: 'CREATE',
      eldery: Elderly(
        profileId: '1',
        name: 'แดง กีต้าร์',
        gender: 'ชาย',
        age: 72,
        mobileNumber: '0957873666',
        congenitalDisease: [],
        allergicFoods: []
      ),
      types: [],
      appointmentDate: '11 กันยายน 2977',
      appointmentTimes: [],
      note: 'อะจ๊ะเอ๋ตัวเอง',
      latitude: 0,
      longitude: 3
    )
  ]});

  final List<Appointment> appointments;
  
  @override
  List<Object?> get props => [appointments];

  AppointmentListState copyWith({
    List<Appointment>? appointments
  }) {
    return AppointmentListState(
      appointments: appointments ?? this.appointments
    );
  }
}