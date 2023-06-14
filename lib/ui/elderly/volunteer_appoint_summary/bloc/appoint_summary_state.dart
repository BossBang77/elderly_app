part of 'appoint_summary_bloc.dart';

class AppointSummaryState extends Equatable {
  const AppointSummaryState(
      {this.appointDetail = const AppointmentDetail(),
      this.isLoading = false,
      this.statusUpdate = StatusUpdate.initialState});
  final AppointmentDetail appointDetail;
  final bool isLoading;
  final StatusUpdate statusUpdate;

  AppointSummaryState copyWith(
      {AppointmentDetail? appointDetail,
      bool? isLoading,
      StatusUpdate? statusUpdate}) {
    return AppointSummaryState(
        appointDetail: appointDetail ?? this.appointDetail,
        isLoading: isLoading ?? this.isLoading,
        statusUpdate: statusUpdate ?? this.statusUpdate);
  }

  @override
  List<Object> get props => [appointDetail, isLoading, statusUpdate];
}

class AppointSummaryInitial extends AppointSummaryState {}

enum AppointStatus { CREATE, WAITING_TO_START, START, COMPLETE, REJECT }

enum StatusUpdate { initialState, updateStatusSuccess, updateStatusFail }
