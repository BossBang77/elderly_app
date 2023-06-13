import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health_application/ui/elderly/appointment/appointment_list_view.dart';
import 'package:health_application/ui/elderly/appointment/bloc/appointment_list_bloc.dart';
import 'package:health_application/ui/elderly/appointment/repository/appointment_repository.dart';

class AppointmentListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppointmentListBloc>(
      create:(context) => AppointmentListBloc(AppointmentRepository()),
      child: AppointmentListView(),
    );
  }
}