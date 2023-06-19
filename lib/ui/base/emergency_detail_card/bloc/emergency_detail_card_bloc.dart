import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:http/retry.dart';

part 'emergency_detail_card_event.dart';
part 'emergency_detail_card_state.dart';

class EmergencyDetailCardBloc
    extends Bloc<EmergencyDetailCardEvent, EmergencyDetailCardState> {
  EmergencyDetailCardBloc() : super(EmergencyDetailCardInitial()) {}
  @override
  Stream<EmergencyDetailCardState> mapEventToState(
      EmergencyDetailCardEvent event) async* {
    if (event is UpdateStatus) {
      yield state.copyWith(status: event.status);
    }
  }
}
