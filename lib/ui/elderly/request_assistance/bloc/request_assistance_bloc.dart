import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'request_assistance_event.dart';
part 'request_assistance_state.dart';

class RequestAssistanceBloc extends Bloc<RequestAssistanceEvent, RequestAssistanceState> {
  RequestAssistanceBloc() : super(RequestAssistanceInitial()) {
    on<RequestAssistanceEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
