import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/appointment/model/response/appointment.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';
import 'package:health_application/ui/elderly/appointment_detail/appointment_detail.dart';
import 'package:health_application/ui/elderly/appointment_detail/bloc/appointment_detial_bloc.dart';

class AppointmentDetailPage extends StatelessWidget {
  const AppointmentDetailPage({required this.appointment});

  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AppointmentDetailBloc(appointment, AppointmentRepository.instance),
      child: AppointmentDetailView(),
    );
  }
}