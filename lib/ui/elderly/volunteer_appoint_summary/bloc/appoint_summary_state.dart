part of 'appoint_summary_bloc.dart';

class AppointSummaryState extends Equatable {
  const AppointSummaryState(
      {this.appointDetail = const AppointmentDetail(), this.isLoading = false});
  final AppointmentDetail appointDetail;
  final bool isLoading;

  AppointSummaryState copyWith(
      {AppointmentDetail? appointDetail, bool? isLoading}) {
    return AppointSummaryState(
        appointDetail: appointDetail ?? this.appointDetail,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [appointDetail, isLoading];
}

class AppointSummaryInitial extends AppointSummaryState {}

enum AppointStatus { CREATE, WAITING_TO_START, START, COMPLETE, REJECT }
