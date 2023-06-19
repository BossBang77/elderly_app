import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_assistance_event.dart';
part 'request_assistance_state.dart';

class RequestAssistanceBloc
    extends Bloc<RequestAssistanceEvent, RequestAssistanceState> {
  RequestAssistanceBloc() : super(RequestAssistanceInitial()) {}
  @override
  Stream<RequestAssistanceState> mapEventToState(
      RequestAssistanceEvent event) async* {
    if (event is UpdateStatus) {
      yield state.copyWith(assistanceStatus: event.status);
    }
  }
}