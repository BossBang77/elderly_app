part of 'request_assistance_bloc.dart';

class RequestAssistanceState extends Equatable {
  const RequestAssistanceState(
      {this.emergencyDetail = const AssitanceDetailModel(),
      this.isLoading = false});
  final AssitanceDetailModel emergencyDetail;
  final bool isLoading;
  RequestAssistanceState copyWith(
      {AssitanceDetailModel? emergencyDetail, bool? isLoading}) {
    return RequestAssistanceState(
        emergencyDetail: emergencyDetail ?? this.emergencyDetail,
        isLoading: isLoading ?? this.isLoading);
  }

  @override
  List<Object> get props => [emergencyDetail, isLoading];
}

class RequestAssistanceInitial extends RequestAssistanceState {}
